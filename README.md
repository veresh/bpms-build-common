bpms-build-common
=================
This module is reponsible of installing common dependencies.rb as an artifact.

All modules should load dependencies from this module instead of loading thier specific dependencies.rb.

This implementation is done in K2 release.

Steps:

1. Checkout the current branch of this module.
2. Find all the files in the module where dependencies.rb is included
3. Replace the line where dependencies.rb  is included in component modules with the following lines

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
Jira: http://jira.intalio.com/browse/BPMS-994

This module is currently tested with Tempo component. 



