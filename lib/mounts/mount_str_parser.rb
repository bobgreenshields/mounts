module Mounts

	class MountStrParser

	#  MNT_REG = /^(\S+) on (\S+) type (\S+) \((\S+)\)$/
		MNT_REG = /^(.+) on (.+) type (\S+) \((\S+)\)$/

		def parse(mnt_str)
			m = MNT_REG.match mnt_str
			res = []
			(1..4).each { |n| res << m[n] }
			res
		end

	end

end
