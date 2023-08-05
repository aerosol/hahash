defmodule HahashTest do
  use ExUnit.Case
  doctest Hahash

  use Hahash.Wordlist

  test "very cute" do
    assert Hahash.name("very cute") == "transform-national-exercise"
    assert Hahash.name(:totally_not_cute) == "flip-wide-denim"
    assert Hahash.name(%{a_map: :even}) == "combine-elaborate-engineer"
  end

  test "adjectives" do
    max = adjectives_size()
    assert adjectives(1) == "acute"
    assert adjectives(max) == "wintry"
  end

  test "verbs" do
    max = verbs_size()
    assert verbs(1) == "babble"
    assert verbs(max) == "survey"
  end

  test "nouns" do
    max = nouns_size()
    assert nouns(1) == "account"
    assert nouns(max) == "yeoman"
  end
end
