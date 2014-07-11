class Mount

	attr_reader :device, :location, :mnt_type, :options

	def initialize(mnt_arr)
		@device = mnt_arr[0]
		@location = mnt_arr[1]
		@mnt_type = mnt_arr[2]
		@options = mnt_arr[3].split(',')
	end

	def mounted_at?(loc)
		loc == @location
	end
end

class NilMount
	def mounted_at?(loc)
		false
	end
end
