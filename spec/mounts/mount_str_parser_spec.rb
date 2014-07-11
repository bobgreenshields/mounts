require 'spec_helper'

describe MountStrParser do

	describe '#parse' do
		let(:mnt_str) {
			"/dev/sda7 on /home/bobg/this dir type ext4 (rw,errors=remount-ro)"
		}
		let (:parser) { MountStrParser.new }

		it "should return an array of the mount values" do
			expect(parser.parse(mnt_str)).to eql(
				["/dev/sda7", "/home/bobg/this dir", "ext4", "rw,errors=remount-ro"]
			)
		end
	end

end
