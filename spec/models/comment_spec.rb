describe Comment do
  it { should belong_to :user }
  it { should belong_to :post }
end