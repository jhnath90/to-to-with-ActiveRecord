require("spec_helper")

describe(Task) do

  it("tells which list it belongs to") do
    list = List.create({ :name => "My List" })
    task = Task.create({ :description => "Rule the world", :list_id => list.id })
    expect(task.list()).to eq(list)
  end

    it("validates presence of description") do
    task = Task.new({:description => ""})
    expect(task.save()).to(eq(false))
  end

   it("ensures the length of description is at most 50 characters") do
    task = Task.new({:description => "a".*(51)})
    expect(task.save()).to(eq(false))
  end

   it("converts the name to lowercase") do
    task = Task.create({:description => "FINAGLE THE BUFFALO"})
    expect(task.description()).to(eq("finagle the buffalo"))
  end


  describe(".not_done") do
    it("will return only tasks that are not yet completed") do
    test_task1 = Task.create({:description => "Rule the world", :done => false})
    test_task2 = Task.create({:description => "Master the known universe", :done => false})
    notdone_tasks = [test_task1, test_task2]
    test_task3 = Task.create({:description => "Rule my own living room", :done => true})
    expect(Task.not_done()).to(eq(notdone_tasks))
    end
  end
end