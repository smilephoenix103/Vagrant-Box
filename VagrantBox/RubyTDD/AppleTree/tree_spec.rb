require_relative 'tree'

RSpec.describe AppleTree do
    before(:each) do
        @tree = AppleTree.new
    end

    it "has an age attribute with getter and setter methods" do
        @tree.age = 3
        expect(@tree.age).to eq(3)
    end

    it "should have a getter for the height attribute" do
        expect(@tree.height).to eq(10)
    end

    it "raises an error when user tries to set height attribute" do
        expect{@tree.height = 20}.to raise_error(NoMethodError)
    end

    it "should have a getter for the apple_count attribute" do
        expect(@tree.apple_count).to eq(0)
    end

    it "raises an error when user tries to set apple count" do
        expect{@tree.apple_count = 20}.to raise_error(NoMethodError)
    end

    context "should have a method year gone by" do
        before(:each) do
            @tree.year_gone_by
        end

        it "adds one year to the age attribute" do
            expect(@tree.age).to eq(1)
        end

        it "increases the height by 10% of it's current height" do
            expect(@tree.height).to eq(11)
        end

        context "increases the apple count by two within a range" do
            it "should not increase if the age is less than or equal to 3" do
                2.times { @tree.year_gone_by }
                expect(@tree.apple_count).to eq(0)
            end

            it "should increase if the age is between 4 and 10" do
                5.times { @tree.year_gone_by }
                expect(@tree.apple_count).to eq(6)
            end

            it "shound not increase if the age is greater than 10" do
                10.times { @tree.year_gone_by }
                expect(@tree.apple_count).to eq(14)
            end

        end

        it "should have a method called pick_apples that takes all apples of the tree" do
            5.times { @tree.year_gone_by }
            @tree.pick_apples
            expect(@tree.apple_count).to eq(0)
        end
    end
end