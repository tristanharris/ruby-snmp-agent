# Ruby::Snmp::Agent
--
 Portions Copyright (c) 2006 Mooter Media Ltd
 All rights reserved.

 Portions Copyright (c) 2006 Matthew Palmer <mpalmer@hezmatt.org>
 All rights reserved.

 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 as published by the Free Software Foundation (version 2 of the License)
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 51 Franklin St, Fifth Floor, Boston MA  02110-1301 USA
++
 Ruby snmpd is a complete, stand-alone SNMP agent program designed for
 flexibility and easy customisation of the contents of the MIB.

 If you're familiar with the net-snmp agent, you will be familiar with the
 intention of this program.  However, unlike the net-snmp agent, Ruby snmpd
 doesn't (at present) define a lot of pre-existing, standard MIB subtrees.
 Instead, it allows you to easily define your own plugins to report on
 site-specific data.

 The upside of this is huge -- all of those interesting factoids about your
 machines can now be easily exposed using SNMP.  The lack of in-built MIB
 data is annoying, but the agent has a proxying capability, so you can
 ask another agent, such as net-snmp, for any values that Ruby snmpd can't
 handle itself.

 = Invocation

 Full documentation on the command line options available for the Ruby
 snmpd agent is available by running <tt>snmpd --help</tt>.

 = Plugins

 A plugin for the Ruby snmpd agent is simply a chunk of code that is
 executed whenever a request for an OID in a specified subtree of the MIB
 is received.

 The easiest way to include a plugin in the agent is to place it in the
 plugins directory of the agent.  You can find out what the plugins
 directory is for your agent by running <tt>snmpd --help</tt> and examining
 the default for the <tt>--plugindir</tt> option.  You can also change
 the directory examined for plugins by using that option.

 Writing plugins is a slightly involved topic, so I will simply refer the
 interested reader to the 'Writing Plugins' section of the SNMP::Agent
 class documentation.

 = Proxying

 This is an important topic until there is broad coverage of the common MIB
 sub-trees through native Ruby snmpd plugins (or you only want to use Ruby
 snmpd to provide a few custom values through plugins you write yourself).

 To specify a proxy, you simply create a special plugin that contains a
 specification like the following:

   self.add_proxy(base_oid, host, port)

 name it <tt>proxies.rb</tt> (or any other name ending in <tt>.rb</tt>,
 actually), and add that plugin to your standard plugins directory (see
 above for more information on plugins and directories).  If you need
 multiple proxies for different subtrees, just add multiple
 <tt>add_proxy</tt> calls to your <tt>proxies.rb</tt> file.

 This tells the agent that, for any requests for an OID below the
 <base_oid> given, it should make an SNMP request to the given <host> and
 <port> for that same OID, and return the results.

 For more information on Proxying, see the 'Proxying to other SNMP agents'
 section of the SNMP::Agent class documentation.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-snmp-agent'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-snmp-agent

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby-snmp-agent. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

