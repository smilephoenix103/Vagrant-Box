require "spec_helper"

RSpec.describe Stringer do
  it "concatenates undefined number of strings with a space" do 
    expect(Stringer.spacify "Oscar", "Vazquez", "Zweig", "Olasaba", "Hernandez", "Ricardo", "Mendoza").to eq("Oscar Vazquez Zweig Olasaba Hernandez Ricardo Mendoza")
  end

  it "minifies - shortens length of strings to max length and adds '...', returns string if equal or less than max length"do
    expect(Stringer.minify("Hello my name is Kevin", 5)).to eq("Hello...")
    expect(Stringer.minify("Hello my dear", 15)).to eq("Hello my dear")
  end

  it "replaces - replaces word in text with replacement" do
    expect(Stringer.replacify("I can't do this", "can't", "can")).to eq("I can do this")
  end

  it "tokenize - iterates each word in a string into an array and returns array" do
    expect(Stringer.tokenize("Hello this is stringer")).to eq(["Hello", "this", "is", "stringer"])
  end

  it "removes - removes word from string" do
    expect(Stringer.removify("I am not a coder", "not")).to eq("I am a coder")
  end
end
