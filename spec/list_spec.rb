require("spec_helper")

describe(List) do
  it("tells which tasks are in it") do
    list = List.create({ :name => "My List" })
    task = Task.create({ :description => "Rule the world", :list_id => list.id })
    task2 = Task.create({ :description => "Rule my living room", :list_id => list.id })
    expect(list.tasks()).to eq([task, task2])
  end
end