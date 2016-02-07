require_relative 'queue'

RSpec.describe Queue do
	before do
		@queue = Queue.new
	end

	describe "attributes" do
		it "has getters and setters for data_store" do
			@queue.data_store = [1, 2, 3]
			expect(@queue.data_store).to eq([1, 2, 3])
		end
		it "has a default value of 0 for back" do
			expect(@queue.back).to eq(0)
		end
		it "has a default value of [] for data store" do
			expect(@queue.data_store).to eq([])
		end
		it "should prevent users from setting back" do
			expect {
				@queue.back = 99
			}.to raise_error
		end
	end

	describe "behavior" do
		before do
			@queue.enqueue(1)
			@queue.enqueue(2)
			@queue.enqueue(3)
		end
		it "enqueues element to the end" do
			expect(@queue.queue_display).to eq([1, 2, 3])
		end
		describe "dequeue" do
			it "dequeues the first-in element" do
				expect(@queue.dequeue).to eq(1)
				expect(@queue.queue_display).to eq([2, 3])
				expect(@queue.dequeue).to eq(2)
				expect(@queue.queue_display).to eq([3])
				expect(@queue.dequeue).to eq(3)
				expect(@queue.queue_display).to eq([])

			end
			it "returns nil if there is nothing to dequeue" do
				queue = Queue.new
				expect(queue.dequeue).to eq(nil)
			end
		end
	end
end
