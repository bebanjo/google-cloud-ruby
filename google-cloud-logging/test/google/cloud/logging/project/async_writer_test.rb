# Copyright 2016 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "helper"

describe Google::Cloud::Logging::Project, :async_writer, :mock_logging do
  it "creates an async writer object" do
    async = logging.async_writer
    async.must_be_kind_of Google::Cloud::Logging::AsyncWriter
    async.logging.must_be_same_as logging
    async.max_queue_size.must_equal \
      Google::Cloud::Logging::AsyncWriter::DEFAULT_MAX_QUEUE_SIZE
    async.state.must_equal :running
  end

  it "creates an async writer object with a max queue size" do
    async = logging.async_writer max_queue_size: 42
    async.must_be_kind_of Google::Cloud::Logging::AsyncWriter
    async.logging.must_be_same_as logging
    async.max_queue_size.must_equal 42
    async.state.must_equal :running
  end
end
