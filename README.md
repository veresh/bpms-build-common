BPMS Common Build
=================
This module is reponsible of installing common dependencies.rb as an artifact avoiding each module to have it's own dependency file and inturn using same set of libraries across Intalio modules.

All modules should load dependencies from this module instead of loading thier specific dependencies.rb.

This implementation is done in K2 release.

Steps:

- Checkout the current branch of this module.
- Find all the files in the module where dependencies.rb is included
- Replace the line where dependencies.rb  is included in component modules with the following lines

<pre>
<code>
DP_VERSION_NUMBER="1.0.0"
DEPENDENCIES = "#{ENV['HOME']}/.m2/repository/org/intalio/common/dependencies/#{DP_VERSION_NUMBER}/dependencies-#{DP_VERSION_NUMBER}.rb"
unless ENV["M2_REPO"] != ''
  DEPENDENCIES = "#{ENV['M2_REPO']}/org/intalio/common/dependencies/#{DP_VERSION_NUMBER}/dependencies-#{DP_VERSION_NUMBER}.rb"
end
load DEPENDENCIES
</code>
</pre>
 
<p> <a href="http://jira.intalio.com/browse/BPMS-994" title="JIRA">
JIRA can be found here</a> </p>

This module is currently tested with Tempo component. 



