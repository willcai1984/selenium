# Licensed to the Software Freedom Conservancy (SFC) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The SFC licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

require File.expand_path("../../../spec_helper", __FILE__)

module Selenium
  module WebDriver
    module Remote
      module Http
        describe Common do

          it "sends non-empty body header for POST requests without command data" do
            common = Common.new
            common.server_url = URI.parse("http://server")

            common.should_receive(:request).
                  with(:post, URI.parse("http://server/clear"),
                        hash_including("Content-Length" => "2"), "{}")

            common.call(:post, "clear", nil)
          end

        end # Common
      end # Http
    end # Remote
  end # WebDriver
end # Selenium