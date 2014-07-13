require "mounts/version"
require "mounts/mount_str_parser"
require "mounts/mount"
#require_relative './mount_str_parser'
#require_relative './mount'

module Mounts

	class ActiveMounts

		def initialize(mnts_provider = nil)
			@mnts_provider = mnts_provider || -> { `mount` }
			@parser = MountStrParser.new
			@devices = {}
			@locations = {}
			@mnts = []
			refresh
		end

		def refresh
			@devices.clear
			@locations.clear
			@mnts.clear
			mnt_str_arr.each do |mnt_str|
				mnt_data = @parser.parse mnt_str
				next if device_is_none?(mnt_data)
				mnt = Mount.new mnt_data
				@devices[mnt.device] = mnt
				@locations[mnt.location] = mnt
				@mnts << mnt
			end
		end

		def count
			@mnts.count
		end

		def device(name)
			@devices[name]
		end

		def has_device?(name)
			@devices.has_key? name
		end

		def has_location?(name)
			@locations.has_key? name
		end

		def mounted?(device, location)
			mnt = @devices.fetch(device) { NilMount.new }
			mnt.mounted_at?(location)
		end

		private

		def mnt_str_arr
			@mnts_provider.call.split("\n")
		end

		def device_is_none?(mnt_data)
			mnt_data[0] == 'none'
		end

	end
end
