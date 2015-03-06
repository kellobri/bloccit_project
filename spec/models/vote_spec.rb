require 'rails_helper'

describe Vote do 
	describe "validations" do
		describe "value validation" do
			before{@invalid_vote = Vote.create(value: 5)}
			it "only allows -1 or 1 as values" do
				expect(@invalid_vote.valid?).to eq false
			end
		end
	end
end			
	
