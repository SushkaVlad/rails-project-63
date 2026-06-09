# frozen_string_literal: true

RSpec.describe HexletCode do
  it "has a version number" do
    expect(HexletCode::VERSION).not_to be nil
  end

  describe ".form_for" do
    let(:user_struct) { Struct.new(:name, :job, keyword_init: true) }
    let(:user) { user_struct.new(name: "rob") }

    it "builds a form with default action and method" do
      result = described_class.form_for(user) {}
      expect(result).to eq('<form action="#" method="post"></form>')
    end

    it "passes extra attributes to the form tag" do
      result = described_class.form_for(user, class: "hexlet-form") {}
      expect(result).to eq('<form action="#" method="post" class="hexlet-form"></form>')
    end

    it "uses the url option as the form action" do
      result = described_class.form_for(user, url: "/profile", class: "hexlet-form") {}
      expect(result).to eq('<form action="/profile" method="post" class="hexlet-form"></form>')
    end
  end
end

RSpec.describe HexletCode::Tag do
  describe ".build" do
    context "with single tags" do
      it "builds a tag without attributes" do
        expect(described_class.build("br")).to eq("<br>")
      end

      it "builds a tag with attributes" do
        expect(described_class.build("img", src: "path/to/image"))
          .to eq('<img src="path/to/image">')
      end

      it "builds a tag with multiple attributes" do
        expect(described_class.build("input", type: "submit", value: "Save"))
          .to eq('<input type="submit" value="Save">')
      end
    end

    context "with paired tags" do
      it "builds an empty paired tag without a block" do
        expect(described_class.build("div")).to eq("<div></div>")
      end

      it "builds a paired tag with a block body" do
        expect(described_class.build("label") { "Email" })
          .to eq("<label>Email</label>")
      end

      it "builds a paired tag with attributes and a block body" do
        expect(described_class.build("label", for: "email") { "Email" })
          .to eq('<label for="email">Email</label>')
      end
    end
  end
end
