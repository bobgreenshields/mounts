require 'spec_helper'

describe Mounts do
	let (:mnt_str) { -> { <<END
/dev/sda1 on / type ext4 (rw,errors=remount-ro)
proc on /proc type proc (rw,noexec,nosuid,nodev)
none on /sys/fs/cgroup type tmpfs (rw)
sysfs on /sys type sysfs (rw,noexec,nosuid,nodev)
END
	}}

#	let (:mnts) { Mounts::Mounts.new(mnt_str) }
	let (:mnts) { ActiveMounts.new(mnt_str) }

	it "should have 3 mounts" do
		expect(mnts.count).to eql(3)
	end

	describe "#device" do
		it "should return a Mnt object" do
			expect(mnts.device("/dev/sda1")).to be_kind_of Mount
		end
	end

	describe "#has_device?" do
		it "should return true if device is present" do
#			expect(mnts.has_device?("/dev/sda1")).to be_true
			expect(mnts).to have_device("/dev/sda1")
		end
		it "should return false if device is not present" do
#			expect(mnts.has_device?("/dev/sdc3")).to be_false
			expect(mnts).not_to have_device("/dev/sdc3")
		end
	end

	describe "#has_location?" do
		it "should return true if location is mounted" do
#			expect(mnts.has_location?("/proc")).to be_true
			expect(mnts).to have_location("/proc")
		end
		it "should return false if location is not mounted" do
#			expect(mnts.has_location?("/wrong")).to be_false
			expect(mnts).not_to have_location("/wrong")
		end
	end
	
	describe "#mounted?" do
		it "should return true if device is mounted at location" do
			expect(mnts.mounted?('/dev/sda1', '/')).to be_truthy
		end
		it "should return false if device is not mounted at location" do
			expect(mnts.mounted?('/dev/sda1', '/home')).to be_falsy
		end
		it "should return false if device is unknown" do
			expect(mnts.mounted?('/dev/sda3', '/')).to be_falsy
		end
	end

end
