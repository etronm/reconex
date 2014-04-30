require 'spec_helper'

describe Section do

  before do
    @section = Section.new(name: "seccion 1", description: "Primera seccion del programa", status: 0)
  end

  subject { @section }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:status) }

  ############ section name ####################################
  describe "when name is not present" do
    before { @section.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @section.name = "a" * 31 }
    it { should_not be_valid }
  end

  ############ section description ####################################
  describe "when description is not present" do
    before { @section.description = " " }
    it { should_not be_valid }
  end

  describe "when description is too long" do
    before { @section.description = "a" * 61 }
    it { should_not be_valid }
  end

  ############ status  ####################################
  describe "when status is not valid " do
    before { @section.status =2}
    it { should_not be_valid }
  end

  describe "when description already exists " do
    before do
      section_with_same_name  = @section.dup
      section_with_same_name.name  = @section.name.upcase
      section_with_same_name.save
    end
    it { should_not be_valid }
  end

end