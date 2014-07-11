require 'spec_helper'

describe Mount do

	let (:mount_arr) { ["devpts", "/dev/pts", "devpts", "rw,noexec,nosuid,gid=5,mode=0620"] }

	let (:mnt) { Mount.new(mount_arr) }

	describe "#device" do
		it "should equal device from mount string" do
#			mnt.device.should eql('devpts')
			expect(mnt.device).to eql('devpts')
		end
	end

	describe "#location" do
		it "should equal location from mount string" do
			expect(mnt.location).to eql('/dev/pts')
		end
	end

	describe "#mnt_type" do
		it "should equal mnt_type from mount string" do
			expect(mnt.mnt_type).to eql('devpts')
		end
	end

	describe "#options" do
		it "should equal options from mount string" do
			expect(mnt.options).to eql(
				["rw", "noexec", "nosuid", "gid=5", "mode=0620"]
			)
		end
	end

	describe "#mounted_at?" do
		it "should  return true if the device is mounted at that location" do
			expect(mnt.mounted_at?('/dev/pts')).to be_truthy
		end
	end

end
