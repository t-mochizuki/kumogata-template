#
# Redshift ClusterParameterGroup resource
# http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-clusterparametergroup.html
#
require 'kumogata/template/helper'
require 'kumogata/template/redshift'

name = _resource_name(args[:name], "redshift cluster parameter group")
description = args[:description] || "#{args[:name]} redshift cluster parameter group description"
family = args[:family] || "redshift-1.0"
parameters = _redshift_parameters(args)

_(name) do
  Type "AWS::Redshift::ClusterParameterGroup"
  Properties do
    Description description
    ParameterGroupFamily family
    Parameters parameters
  end
end
