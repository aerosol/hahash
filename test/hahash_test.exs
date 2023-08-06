defmodule HahashTest do
  use ExUnit.Case
  doctest Hahash

  use Hahash.Wordlist

  test "very cute" do
    assert Hahash.name("very cute") == "translate-principal-fencing"
    assert Hahash.name(:totally_not_cute) == "import-average-flannel"
    assert Hahash.name(%{a_map: :even}) == "connect-fancy-engine"
  end

  test "adjectives" do
    max = adjectives_size()
    assert adjectives(0) == "acute"
    assert adjectives(max - 1) == "wintry"
  end

  test "verbs" do
    max = verbs_size()
    assert verbs(0) == "babble"
    assert verbs(max - 1) == "survey"
  end

  test "nouns" do
    max = nouns_size()
    assert nouns(0) == "account"
    assert nouns(max - 1) == "yeoman"
  end

  test "bugs" do
    assert Hahash.name(103)
  end
end
