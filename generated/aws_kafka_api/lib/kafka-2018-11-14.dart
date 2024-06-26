// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

///
/// The operations for managing an Amazon MSK cluster.
///
class Kafka {
  final _s.RestJsonProtocol _protocol;
  Kafka({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kafka',
            signingName: 'kafka',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  ///
  /// Associates one or more Scram Secrets with an Amazon MSK cluster.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster to be updated.
  ///
  ///
  /// Parameter [secretArnList] :
  ///
  /// List of AWS Secrets Manager secret ARNs.
  ///
  Future<BatchAssociateScramSecretResponse> batchAssociateScramSecret({
    required String clusterArn,
    required List<String> secretArnList,
  }) async {
    final $payload = <String, dynamic>{
      'secretArnList': secretArnList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/scram-secrets',
      exceptionFnMap: _exceptionFns,
    );
    return BatchAssociateScramSecretResponse.fromJson(response);
  }

  ///
  /// Creates a new MSK cluster.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [brokerNodeGroupInfo] :
  ///
  /// Information about the broker nodes in the cluster.
  ///
  ///
  /// Parameter [clusterName] :
  ///
  /// The name of the cluster.
  ///
  ///
  /// Parameter [kafkaVersion] :
  ///
  /// The version of Apache Kafka.
  ///
  ///
  /// Parameter [numberOfBrokerNodes] :
  ///
  /// The number of broker nodes in the cluster.
  ///
  ///
  /// Parameter [clientAuthentication] :
  ///
  /// Includes all client authentication related information.
  ///
  ///
  /// Parameter [configurationInfo] :
  ///
  /// Represents the configuration that you want MSK to use for the brokers in a
  /// cluster.
  ///
  ///
  /// Parameter [encryptionInfo] :
  ///
  /// Includes all encryption-related information.
  ///
  ///
  /// Parameter [enhancedMonitoring] :
  ///
  /// Specifies the level of monitoring for the MSK cluster. The possible values
  /// are DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER, and
  /// PER_TOPIC_PER_PARTITION.
  ///
  ///
  /// Parameter [openMonitoring] :
  ///
  /// The settings for open monitoring.
  ///
  ///
  /// Parameter [storageMode] :
  ///
  /// This controls storage mode for supported storage tiers.
  ///
  ///
  /// Parameter [tags] :
  ///
  /// Create tags when creating the cluster.
  ///
  Future<CreateClusterResponse> createCluster({
    required BrokerNodeGroupInfo brokerNodeGroupInfo,
    required String clusterName,
    required String kafkaVersion,
    required int numberOfBrokerNodes,
    ClientAuthentication? clientAuthentication,
    ConfigurationInfo? configurationInfo,
    EncryptionInfo? encryptionInfo,
    EnhancedMonitoring? enhancedMonitoring,
    LoggingInfo? loggingInfo,
    OpenMonitoringInfo? openMonitoring,
    StorageMode? storageMode,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'numberOfBrokerNodes',
      numberOfBrokerNodes,
      1,
      15,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'brokerNodeGroupInfo': brokerNodeGroupInfo,
      'clusterName': clusterName,
      'kafkaVersion': kafkaVersion,
      'numberOfBrokerNodes': numberOfBrokerNodes,
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
      if (configurationInfo != null) 'configurationInfo': configurationInfo,
      if (encryptionInfo != null) 'encryptionInfo': encryptionInfo,
      if (enhancedMonitoring != null)
        'enhancedMonitoring': enhancedMonitoring.toValue(),
      if (loggingInfo != null) 'loggingInfo': loggingInfo,
      if (openMonitoring != null) 'openMonitoring': openMonitoring,
      if (storageMode != null) 'storageMode': storageMode.toValue(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/clusters',
      exceptionFnMap: _exceptionFns,
    );
    return CreateClusterResponse.fromJson(response);
  }

  ///
  /// Creates a new MSK cluster.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [clusterName] :
  ///
  /// The name of the cluster.
  ///
  ///
  /// Parameter [provisioned] :
  ///
  /// Information about the provisioned cluster.
  ///
  ///
  /// Parameter [serverless] :
  ///
  /// Information about the serverless cluster.
  ///
  ///
  /// Parameter [tags] :
  ///
  /// A map of tags that you want the cluster to have.
  ///
  Future<CreateClusterV2Response> createClusterV2({
    required String clusterName,
    ProvisionedRequest? provisioned,
    ServerlessRequest? serverless,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'clusterName': clusterName,
      if (provisioned != null) 'provisioned': provisioned,
      if (serverless != null) 'serverless': serverless,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/api/v2/clusters',
      exceptionFnMap: _exceptionFns,
    );
    return CreateClusterV2Response.fromJson(response);
  }

  ///
  /// Creates a new MSK configuration.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  ///
  /// The name of the configuration.
  ///
  ///
  /// Parameter [serverProperties] :
  ///
  /// Contents of the <filename>server.properties</filename> file. When using
  /// the API, you must ensure that the contents of the file are base64 encoded.
  /// When using the AWS Management Console, the SDK, or the AWS CLI, the
  /// contents of <filename>server.properties</filename> can be in plaintext.
  ///
  ///
  /// Parameter [description] :
  ///
  /// The description of the configuration.
  ///
  ///
  /// Parameter [kafkaVersions] :
  ///
  /// The versions of Apache Kafka with which you can use this MSK
  /// configuration.
  ///
  Future<CreateConfigurationResponse> createConfiguration({
    required String name,
    required Uint8List serverProperties,
    String? description,
    List<String>? kafkaVersions,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'serverProperties': base64Encode(serverProperties),
      if (description != null) 'description': description,
      if (kafkaVersions != null) 'kafkaVersions': kafkaVersions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/configurations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConfigurationResponse.fromJson(response);
  }

  ///
  /// Creates a new MSK VPC connection.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [authentication] :
  ///
  /// The authentication type of VPC connection.
  ///
  ///
  /// Parameter [clientSubnets] :
  ///
  /// The list of client subnets.
  ///
  ///
  /// Parameter [securityGroups] :
  ///
  /// The list of security groups.
  ///
  ///
  /// Parameter [targetClusterArn] :
  ///
  /// The cluster Amazon Resource Name (ARN) for the VPC connection.
  ///
  ///
  /// Parameter [vpcId] :
  ///
  /// The VPC ID of VPC connection.
  ///
  ///
  /// Parameter [tags] :
  ///
  /// A map of tags for the VPC connection.
  ///
  Future<CreateVpcConnectionResponse> createVpcConnection({
    required String authentication,
    required List<String> clientSubnets,
    required List<String> securityGroups,
    required String targetClusterArn,
    required String vpcId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'authentication': authentication,
      'clientSubnets': clientSubnets,
      'securityGroups': securityGroups,
      'targetClusterArn': targetClusterArn,
      'vpcId': vpcId,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/vpc-connection',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVpcConnectionResponse.fromJson(response);
  }

  ///
  /// Deletes the MSK cluster specified by the Amazon Resource Name (ARN) in the
  /// request.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The current version of the MSK cluster.
  ///
  Future<DeleteClusterResponse> deleteCluster({
    required String clusterArn,
    String? currentVersion,
  }) async {
    final $query = <String, List<String>>{
      if (currentVersion != null) 'currentVersion': [currentVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteClusterResponse.fromJson(response);
  }

  ///
  /// Deletes the MSK cluster policy specified by the Amazon Resource Name (ARN)
  /// in the request.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  Future<void> deleteClusterPolicy({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// Deletes an MSK Configuration.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [arn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration.
  ///
  Future<DeleteConfigurationResponse> deleteConfiguration({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/configurations/${Uri.encodeQueryComponent(arn).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteConfigurationResponse.fromJson(response);
  }

  ///
  /// Deletes a MSK VPC connection.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [arn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK VPC
  /// connection.
  ///
  Future<DeleteVpcConnectionResponse> deleteVpcConnection({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/vpc-connection/${Uri.encodeQueryComponent(arn).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteVpcConnectionResponse.fromJson(response);
  }

  ///
  /// Returns a description of the MSK cluster whose Amazon Resource Name (ARN)
  /// is specified in the request.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  Future<DescribeClusterResponse> describeCluster({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeClusterResponse.fromJson(response);
  }

  ///
  /// Returns a description of the MSK cluster whose Amazon Resource Name (ARN)
  /// is specified in the request.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  Future<DescribeClusterV2Response> describeClusterV2({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/api/v2/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeClusterV2Response.fromJson(response);
  }

  ///
  /// Returns a description of the cluster operation specified by the ARN.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterOperationArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the MSK cluster
  /// operation.
  ///
  Future<DescribeClusterOperationResponse> describeClusterOperation({
    required String clusterOperationArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/operations/${Uri.encodeQueryComponent(clusterOperationArn).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeClusterOperationResponse.fromJson(response);
  }

  ///
  /// Returns a description of this MSK configuration.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [arn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration and all of its revisions.
  ///
  Future<DescribeConfigurationResponse> describeConfiguration({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/configurations/${Uri.encodeQueryComponent(arn).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeConfigurationResponse.fromJson(response);
  }

  ///
  /// Returns a description of this revision of the configuration.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [arn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration and all of its revisions.
  ///
  ///
  /// Parameter [revision] :
  ///
  /// A string that uniquely identifies a revision of an MSK configuration.
  ///
  Future<DescribeConfigurationRevisionResponse> describeConfigurationRevision({
    required String arn,
    required int revision,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/configurations/%24%7BUri.encodeQueryComponent%28arn%29.replaceAll%28%27%2B%27%2C%20%27%2520%27%29%7D/revisions/${Uri.encodeQueryComponent(revision.toString()).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeConfigurationRevisionResponse.fromJson(response);
  }

  ///
  /// Returns a description of this MSK VPC connection.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [arn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies a MSK VPC
  /// connection.
  ///
  Future<DescribeVpcConnectionResponse> describeVpcConnection({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/vpc-connection/${Uri.encodeQueryComponent(arn).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeVpcConnectionResponse.fromJson(response);
  }

  ///
  /// Disassociates one or more Scram Secrets from an Amazon MSK cluster.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster to be updated.
  ///
  ///
  /// Parameter [secretArnList] :
  ///
  /// List of AWS Secrets Manager secret ARNs.
  ///
  Future<BatchDisassociateScramSecretResponse> batchDisassociateScramSecret({
    required String clusterArn,
    required List<String> secretArnList,
  }) async {
    final $payload = <String, dynamic>{
      'secretArnList': secretArnList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/scram-secrets',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDisassociateScramSecretResponse.fromJson(response);
  }

  ///
  /// A list of brokers that a client application can use to bootstrap.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  Future<GetBootstrapBrokersResponse> getBootstrapBrokers({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/bootstrap-brokers',
      exceptionFnMap: _exceptionFns,
    );
    return GetBootstrapBrokersResponse.fromJson(response);
  }

  ///
  /// Gets the Apache Kafka versions to which you can update the MSK cluster.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster check.
  ///
  Future<GetCompatibleKafkaVersionsResponse> getCompatibleKafkaVersions({
    String? clusterArn,
  }) async {
    final $query = <String, List<String>>{
      if (clusterArn != null) 'clusterArn': [clusterArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/compatible-kafka-versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetCompatibleKafkaVersionsResponse.fromJson(response);
  }

  ///
  /// Get the MSK cluster policy specified by the Amazon Resource Name (ARN) in
  /// the request.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  Future<GetClusterPolicyResponse> getClusterPolicy({
    required String clusterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetClusterPolicyResponse.fromJson(response);
  }

  ///
  /// Returns a list of all the operations that have been performed on the
  /// specified MSK cluster.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [maxResults] :
  ///
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  ///
  /// Parameter [nextToken] :
  ///
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response.
  /// To get the next batch, provide this token in your next request.
  ///
  Future<ListClusterOperationsResponse> listClusterOperations({
    required String clusterArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/operations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClusterOperationsResponse.fromJson(response);
  }

  ///
  /// Returns a list of all the MSK clusters in the current Region.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterNameFilter] :
  ///
  /// Specify a prefix of the name of the clusters that you want to list. The
  /// service lists all the clusters whose names start with this prefix.
  ///
  ///
  /// Parameter [maxResults] :
  ///
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  ///
  /// Parameter [nextToken] :
  ///
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response.
  /// To get the next batch, provide this token in your next request.
  ///
  Future<ListClustersResponse> listClusters({
    String? clusterNameFilter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (clusterNameFilter != null) 'clusterNameFilter': [clusterNameFilter],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/clusters',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClustersResponse.fromJson(response);
  }

  ///
  /// Returns a list of all the MSK clusters in the current Region.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterNameFilter] :
  ///
  /// Specify a prefix of the names of the clusters that you want to list. The
  /// service lists all the clusters whose names start with this prefix.
  ///
  ///
  /// Parameter [clusterTypeFilter] :
  ///
  /// Specify either PROVISIONED or SERVERLESS.
  ///
  ///
  /// Parameter [maxResults] :
  ///
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  ///
  /// Parameter [nextToken] :
  ///
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response.
  /// To get the next batch, provide this token in your next request.
  ///
  Future<ListClustersV2Response> listClustersV2({
    String? clusterNameFilter,
    String? clusterTypeFilter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (clusterNameFilter != null) 'clusterNameFilter': [clusterNameFilter],
      if (clusterTypeFilter != null) 'clusterTypeFilter': [clusterTypeFilter],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/api/v2/clusters',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClustersV2Response.fromJson(response);
  }

  ///
  /// Returns a list of all the MSK configurations in this Region.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [arn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration and all of its revisions.
  ///
  ///
  /// Parameter [maxResults] :
  ///
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  ///
  /// Parameter [nextToken] :
  ///
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response.
  /// To get the next batch, provide this token in your next request.
  ///
  Future<ListConfigurationRevisionsResponse> listConfigurationRevisions({
    required String arn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/configurations/${Uri.encodeQueryComponent(arn).replaceAll('+', '%20')}/revisions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConfigurationRevisionsResponse.fromJson(response);
  }

  ///
  /// Returns a list of all the MSK configurations in this Region.
  ///
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [maxResults] :
  ///
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  ///
  /// Parameter [nextToken] :
  ///
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response.
  /// To get the next batch, provide this token in your next request.
  ///
  Future<ListConfigurationsResponse> listConfigurations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/configurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConfigurationsResponse.fromJson(response);
  }

  ///
  /// Returns a list of Apache Kafka versions.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [maxResults] :
  ///
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  /// Parameter [nextToken] :
  ///
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response. To get the next
  /// batch, provide this token in your next request.
  Future<ListKafkaVersionsResponse> listKafkaVersions({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/kafka-versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListKafkaVersionsResponse.fromJson(response);
  }

  ///
  /// Returns a list of the broker nodes in the cluster.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [maxResults] :
  ///
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  ///
  /// Parameter [nextToken] :
  ///
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response.
  /// To get the next batch, provide this token in your next request.
  ///
  Future<ListNodesResponse> listNodes({
    required String clusterArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/nodes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNodesResponse.fromJson(response);
  }

  ///
  /// Returns a list of the Scram Secrets associated with an Amazon MSK cluster.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The arn of the cluster.
  ///
  ///
  /// Parameter [maxResults] :
  ///
  /// The maxResults of the query.
  ///
  ///
  /// Parameter [nextToken] :
  ///
  /// The nextToken of the query.
  ///
  Future<ListScramSecretsResponse> listScramSecrets({
    required String clusterArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/scram-secrets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListScramSecretsResponse.fromJson(response);
  }

  ///
  /// Returns a list of the tags associated with the specified resource.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the resource
  /// that's associated with the tags.
  ///
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/tags/${Uri.encodeQueryComponent(resourceArn).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  ///
  /// Returns a list of all the VPC connections in this Region.
  ///
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  ///
  /// Parameter [maxResults] :
  ///
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  ///
  /// Parameter [nextToken] :
  ///
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response.
  /// To get the next batch, provide this token in your next request.
  ///
  Future<ListClientVpcConnectionsResponse> listClientVpcConnections({
    required String clusterArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/client-vpc-connections',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClientVpcConnectionsResponse.fromJson(response);
  }

  ///
  /// Returns a list of all the VPC connections in this Region.
  ///
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [maxResults] :
  ///
  /// The maximum number of results to return in the response. If there are more
  /// results, the response includes a NextToken parameter.
  ///
  ///
  /// Parameter [nextToken] :
  ///
  /// The paginated results marker. When the result of the operation is
  /// truncated, the call returns NextToken in the response.
  /// To get the next batch, provide this token in your next request.
  ///
  Future<ListVpcConnectionsResponse> listVpcConnections({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/vpc-connections',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVpcConnectionsResponse.fromJson(response);
  }

  ///
  /// Returns empty response.
  ///
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  ///
  /// Parameter [vpcConnectionArn] :
  ///
  /// The VPC connection ARN.
  ///
  Future<void> rejectClientVpcConnection({
    required String clusterArn,
    required String vpcConnectionArn,
  }) async {
    final $payload = <String, dynamic>{
      'vpcConnectionArn': vpcConnectionArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/client-vpc-connection',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// Creates or updates the MSK cluster policy specified by the cluster Amazon
  /// Resource Name (ARN) in the request.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  ///
  /// Parameter [policy] :
  ///
  /// The policy.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The policy version.
  ///
  Future<PutClusterPolicyResponse> putClusterPolicy({
    required String clusterArn,
    required String policy,
    String? currentVersion,
  }) async {
    final $payload = <String, dynamic>{
      'policy': policy,
      if (currentVersion != null) 'currentVersion': currentVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return PutClusterPolicyResponse.fromJson(response);
  }

  /// Reboots brokers.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [brokerIds] :
  ///
  /// The list of broker IDs to be rebooted. The reboot-broker operation
  /// supports rebooting one broker at a time.
  ///
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster to be updated.
  ///
  Future<RebootBrokerResponse> rebootBroker({
    required List<String> brokerIds,
    required String clusterArn,
  }) async {
    final $payload = <String, dynamic>{
      'brokerIds': brokerIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/reboot-broker',
      exceptionFnMap: _exceptionFns,
    );
    return RebootBrokerResponse.fromJson(response);
  }

  ///
  /// Adds tags to the specified MSK resource.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the resource
  /// that's associated with the tags.
  ///
  ///
  /// Parameter [tags] :
  ///
  /// The key-value pair for the resource tag.
  ///
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/tags/${Uri.encodeQueryComponent(resourceArn).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// Removes the tags associated with the keys that are provided in the query.
  ///
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the resource
  /// that's associated with the tags.
  ///
  ///
  /// Parameter [tagKeys] :
  ///
  /// Tag keys must be unique for a given cluster. In addition, the following
  /// restrictions apply:
  ///
  ///
  /// <ul>
  ///
  /// <li>
  ///
  /// Each tag key must be unique. If you add a tag with a key that's already in
  /// use, your new tag overwrites the existing key-value pair.
  ///
  /// </li>
  ///
  /// <li>
  ///
  /// You can't start a tag key with aws: because this prefix is reserved for
  /// use
  /// by  AWS.  AWS creates tags that begin with this prefix on your behalf, but
  /// you can't edit or delete them.
  ///
  /// </li>
  ///
  /// <li>
  ///
  /// Tag keys must be between 1 and 128 Unicode characters in length.
  ///
  /// </li>
  ///
  /// <li>
  ///
  /// Tag keys must consist of the following characters: Unicode letters,
  /// digits,
  /// white space, and the following special characters: _ . / = + -
  /// @.
  ///
  /// </li>
  ///
  /// </ul>
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/tags/${Uri.encodeQueryComponent(resourceArn).replaceAll('+', '%20')}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// Updates the number of broker nodes in the cluster.
  ///
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The version of cluster to update from. A successful operation will then
  /// generate a new version.
  ///
  ///
  /// Parameter [targetNumberOfBrokerNodes] :
  ///
  /// The number of broker nodes that you want the cluster to have after this
  /// operation completes successfully.
  ///
  Future<UpdateBrokerCountResponse> updateBrokerCount({
    required String clusterArn,
    required String currentVersion,
    required int targetNumberOfBrokerNodes,
  }) async {
    _s.validateNumRange(
      'targetNumberOfBrokerNodes',
      targetNumberOfBrokerNodes,
      1,
      15,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      'targetNumberOfBrokerNodes': targetNumberOfBrokerNodes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/nodes/count',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBrokerCountResponse.fromJson(response);
  }

  ///
  /// Updates EC2 instance type.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The cluster version that you want to change. After this operation
  /// completes successfully, the cluster will have a new version.
  ///
  ///
  /// Parameter [targetInstanceType] :
  ///
  /// The Amazon MSK broker type that you want all of the brokers in this
  /// cluster to be.
  ///
  Future<UpdateBrokerTypeResponse> updateBrokerType({
    required String clusterArn,
    required String currentVersion,
    required String targetInstanceType,
  }) async {
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      'targetInstanceType': targetInstanceType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/nodes/type',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBrokerTypeResponse.fromJson(response);
  }

  ///
  /// Updates the EBS storage associated with MSK brokers.
  ///
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The version of cluster to update from. A successful operation will then
  /// generate a new version.
  ///
  ///
  /// Parameter [targetBrokerEBSVolumeInfo] :
  ///
  /// Describes the target volume size and the ID of the broker to apply the
  /// update to.
  ///
  Future<UpdateBrokerStorageResponse> updateBrokerStorage({
    required String clusterArn,
    required String currentVersion,
    required List<BrokerEBSVolumeInfo> targetBrokerEBSVolumeInfo,
  }) async {
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      'targetBrokerEBSVolumeInfo': targetBrokerEBSVolumeInfo,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/nodes/storage',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBrokerStorageResponse.fromJson(response);
  }

  ///
  /// Updates an MSK configuration.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [arn] :
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  ///
  /// Parameter [serverProperties] :
  ///
  /// Contents of the <filename>server.properties</filename> file. When using
  /// the API, you must ensure that the contents of the file are base64 encoded.
  /// When using the AWS Management Console, the SDK, or the AWS CLI, the
  /// contents of <filename>server.properties</filename> can be in plaintext.
  ///
  ///
  /// Parameter [description] :
  ///
  /// The description of the configuration revision.
  ///
  Future<UpdateConfigurationResponse> updateConfiguration({
    required String arn,
    required Uint8List serverProperties,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'serverProperties': base64Encode(serverProperties),
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/configurations/${Uri.encodeQueryComponent(arn).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConfigurationResponse.fromJson(response);
  }

  ///
  /// Updates the cluster's connectivity configuration.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  ///
  /// Parameter [connectivityInfo] :
  ///
  /// Information about the broker access configuration.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The version of the MSK cluster to update. Cluster versions aren't simple
  /// numbers. You can describe an MSK cluster to find its version. When this
  /// update operation is successful, it generates a new cluster version.
  ///
  Future<UpdateConnectivityResponse> updateConnectivity({
    required String clusterArn,
    required ConnectivityInfo connectivityInfo,
    required String currentVersion,
  }) async {
    final $payload = <String, dynamic>{
      'connectivityInfo': connectivityInfo,
      'currentVersion': currentVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/connectivity',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConnectivityResponse.fromJson(response);
  }

  ///
  /// Updates the cluster with the configuration that is specified in the
  /// request body.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [configurationInfo] :
  ///
  /// Represents the configuration that you want MSK to use for the brokers in a
  /// cluster.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The version of the cluster that needs to be updated.
  ///
  Future<UpdateClusterConfigurationResponse> updateClusterConfiguration({
    required String clusterArn,
    required ConfigurationInfo configurationInfo,
    required String currentVersion,
  }) async {
    final $payload = <String, dynamic>{
      'configurationInfo': configurationInfo,
      'currentVersion': currentVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateClusterConfigurationResponse.fromJson(response);
  }

  ///
  /// Updates the Apache Kafka version for the cluster.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster to be updated.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// Current cluster version.
  ///
  ///
  /// Parameter [targetKafkaVersion] :
  ///
  /// Target Kafka version.
  ///
  ///
  /// Parameter [configurationInfo] :
  ///
  /// The custom configuration that should be applied on the new version of
  /// cluster.
  ///
  Future<UpdateClusterKafkaVersionResponse> updateClusterKafkaVersion({
    required String clusterArn,
    required String currentVersion,
    required String targetKafkaVersion,
    ConfigurationInfo? configurationInfo,
  }) async {
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      'targetKafkaVersion': targetKafkaVersion,
      if (configurationInfo != null) 'configurationInfo': configurationInfo,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/version',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateClusterKafkaVersionResponse.fromJson(response);
  }

  ///
  /// Updates the monitoring settings for the cluster. You can use this
  /// operation to specify which Apache Kafka metrics you want Amazon MSK to
  /// send to Amazon CloudWatch. You can also specify settings for open
  /// monitoring with Prometheus.
  ///
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The version of the MSK cluster to update. Cluster versions aren't simple
  /// numbers. You can describe an MSK cluster to find its version. When this
  /// update operation is successful, it generates a new cluster version.
  ///
  ///
  /// Parameter [enhancedMonitoring] :
  ///
  /// Specifies which Apache Kafka metrics Amazon MSK gathers and sends to
  /// Amazon CloudWatch for this cluster.
  ///
  ///
  /// Parameter [openMonitoring] :
  ///
  /// The settings for open monitoring.
  ///
  Future<UpdateMonitoringResponse> updateMonitoring({
    required String clusterArn,
    required String currentVersion,
    EnhancedMonitoring? enhancedMonitoring,
    LoggingInfo? loggingInfo,
    OpenMonitoringInfo? openMonitoring,
  }) async {
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      if (enhancedMonitoring != null)
        'enhancedMonitoring': enhancedMonitoring.toValue(),
      if (loggingInfo != null) 'loggingInfo': loggingInfo,
      if (openMonitoring != null) 'openMonitoring': openMonitoring,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/monitoring',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMonitoringResponse.fromJson(response);
  }

  ///
  /// Updates the security settings for the cluster. You can use this operation
  /// to specify encryption and authentication on existing clusters.
  ///
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The version of the MSK cluster to update. Cluster versions aren't simple
  /// numbers. You can describe an MSK cluster to find its version. When this
  /// update operation is successful, it generates a new cluster version.
  ///
  ///
  /// Parameter [clientAuthentication] :
  ///
  /// Includes all client authentication related information.
  ///
  ///
  /// Parameter [encryptionInfo] :
  ///
  /// Includes all encryption-related information.
  ///
  Future<UpdateSecurityResponse> updateSecurity({
    required String clusterArn,
    required String currentVersion,
    ClientAuthentication? clientAuthentication,
    EncryptionInfo? encryptionInfo,
  }) async {
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
      if (encryptionInfo != null) 'encryptionInfo': encryptionInfo,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/security',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSecurityResponse.fromJson(response);
  }

  /// Updates cluster broker volume size (or) sets cluster storage mode to
  /// TIERED.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clusterArn] :
  ///
  /// The Amazon Resource Name (ARN) of the cluster to be updated.
  ///
  ///
  /// Parameter [currentVersion] :
  ///
  /// The version of cluster to update from. A successful operation will then
  /// generate a new version.
  ///
  ///
  /// Parameter [provisionedThroughput] :
  ///
  /// EBS volume provisioned throughput information.
  ///
  ///
  /// Parameter [storageMode] :
  ///
  /// Controls storage mode for supported storage tiers.
  ///
  ///
  /// Parameter [volumeSizeGB] :
  ///
  /// size of the EBS volume to update.
  ///
  Future<UpdateStorageResponse> updateStorage({
    required String clusterArn,
    required String currentVersion,
    ProvisionedThroughput? provisionedThroughput,
    StorageMode? storageMode,
    int? volumeSizeGB,
  }) async {
    final $payload = <String, dynamic>{
      'currentVersion': currentVersion,
      if (provisionedThroughput != null)
        'provisionedThroughput': provisionedThroughput,
      if (storageMode != null) 'storageMode': storageMode.toValue(),
      if (volumeSizeGB != null) 'volumeSizeGB': volumeSizeGB,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/clusters/${Uri.encodeQueryComponent(clusterArn).replaceAll('+', '%20')}/storage',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateStorageResponse.fromJson(response);
  }
}

class BatchAssociateScramSecretResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// List of errors when associating secrets to cluster.
  ///
  final List<UnprocessedScramSecret>? unprocessedScramSecrets;

  BatchAssociateScramSecretResponse({
    this.clusterArn,
    this.unprocessedScramSecrets,
  });

  factory BatchAssociateScramSecretResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchAssociateScramSecretResponse(
      clusterArn: json['clusterArn'] as String?,
      unprocessedScramSecrets: (json['unprocessedScramSecrets'] as List?)
          ?.whereNotNull()
          .map(
              (e) => UnprocessedScramSecret.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

///
/// The distribution of broker nodes across Availability Zones. This is an
/// optional parameter. If you don't specify it, Amazon MSK gives it the value
/// DEFAULT. You can also explicitly set this parameter to the value DEFAULT. No
/// other values are currently allowed.
///
///
/// Amazon MSK distributes the broker nodes evenly across the Availability Zones
/// that correspond to the subnets you provide when you create the cluster.
///
enum BrokerAZDistribution {
  $default,
}

extension BrokerAZDistributionValueExtension on BrokerAZDistribution {
  String toValue() {
    switch (this) {
      case BrokerAZDistribution.$default:
        return 'DEFAULT';
    }
  }
}

extension BrokerAZDistributionFromString on String {
  BrokerAZDistribution toBrokerAZDistribution() {
    switch (this) {
      case 'DEFAULT':
        return BrokerAZDistribution.$default;
    }
    throw Exception('$this is not known in enum BrokerAZDistribution');
  }
}

///
/// Specifies the EBS volume upgrade information. The broker identifier must be
/// set to the keyword ALL. This means the changes apply to all the brokers in
/// the cluster.
///
class BrokerEBSVolumeInfo {
  ///
  /// The ID of the broker to update.
  ///
  final String kafkaBrokerNodeId;

  ///
  /// EBS volume provisioned throughput information.
  ///
  final ProvisionedThroughput? provisionedThroughput;

  ///
  /// Size of the EBS volume to update.
  ///
  final int? volumeSizeGB;

  BrokerEBSVolumeInfo({
    required this.kafkaBrokerNodeId,
    this.provisionedThroughput,
    this.volumeSizeGB,
  });

  factory BrokerEBSVolumeInfo.fromJson(Map<String, dynamic> json) {
    return BrokerEBSVolumeInfo(
      kafkaBrokerNodeId: json['kafkaBrokerNodeId'] as String,
      provisionedThroughput: json['provisionedThroughput'] != null
          ? ProvisionedThroughput.fromJson(
              json['provisionedThroughput'] as Map<String, dynamic>)
          : null,
      volumeSizeGB: json['volumeSizeGB'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final kafkaBrokerNodeId = this.kafkaBrokerNodeId;
    final provisionedThroughput = this.provisionedThroughput;
    final volumeSizeGB = this.volumeSizeGB;
    return {
      'kafkaBrokerNodeId': kafkaBrokerNodeId,
      if (provisionedThroughput != null)
        'provisionedThroughput': provisionedThroughput,
      if (volumeSizeGB != null) 'volumeSizeGB': volumeSizeGB,
    };
  }
}

class BrokerLogs {
  final CloudWatchLogs? cloudWatchLogs;
  final Firehose? firehose;
  final S3? s3;

  BrokerLogs({
    this.cloudWatchLogs,
    this.firehose,
    this.s3,
  });

  factory BrokerLogs.fromJson(Map<String, dynamic> json) {
    return BrokerLogs(
      cloudWatchLogs: json['cloudWatchLogs'] != null
          ? CloudWatchLogs.fromJson(
              json['cloudWatchLogs'] as Map<String, dynamic>)
          : null,
      firehose: json['firehose'] != null
          ? Firehose.fromJson(json['firehose'] as Map<String, dynamic>)
          : null,
      s3: json['s3'] != null
          ? S3.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogs = this.cloudWatchLogs;
    final firehose = this.firehose;
    final s3 = this.s3;
    return {
      if (cloudWatchLogs != null) 'cloudWatchLogs': cloudWatchLogs,
      if (firehose != null) 'firehose': firehose,
      if (s3 != null) 's3': s3,
    };
  }
}

///
/// Describes the setup to be used for Apache Kafka broker nodes in the cluster.
///
class BrokerNodeGroupInfo {
  ///
  /// The list of subnets to connect to in the client virtual private cloud (VPC).
  /// AWS creates elastic network interfaces inside these subnets. Client
  /// applications use elastic network interfaces to produce and consume data.
  /// Client subnets can't occupy the Availability Zone with ID use use1-az3.
  ///
  final List<String> clientSubnets;

  ///
  /// The type of Amazon EC2 instances to use for Apache Kafka brokers. The
  /// following instance types are allowed: kafka.m5.large, kafka.m5.xlarge,
  /// kafka.m5.2xlarge,
  /// kafka.m5.4xlarge, kafka.m5.12xlarge, and kafka.m5.24xlarge.
  ///
  final String instanceType;

  ///
  /// The distribution of broker nodes across Availability Zones. This is an
  /// optional parameter. If you don't specify it, Amazon MSK gives it the value
  /// DEFAULT. You can also explicitly set this parameter to the value DEFAULT. No
  /// other values are currently allowed.
  ///
  ///
  /// Amazon MSK distributes the broker nodes evenly across the Availability Zones
  /// that correspond to the subnets you provide when you create the cluster.
  ///
  final BrokerAZDistribution? brokerAZDistribution;

  ///
  /// Information about the broker access configuration.
  ///
  final ConnectivityInfo? connectivityInfo;

  ///
  /// The AWS security groups to associate with the elastic network interfaces in
  /// order to specify who can connect to and communicate with the Amazon MSK
  /// cluster. If you don't specify a security group, Amazon MSK uses the default
  /// security group associated with the VPC.
  ///
  final List<String>? securityGroups;

  ///
  /// Contains information about storage volumes attached to MSK broker nodes.
  ///
  final StorageInfo? storageInfo;

  ///
  /// The list of zoneIds for the cluster in the virtual private cloud (VPC).
  ///
  final List<String>? zoneIds;

  BrokerNodeGroupInfo({
    required this.clientSubnets,
    required this.instanceType,
    this.brokerAZDistribution,
    this.connectivityInfo,
    this.securityGroups,
    this.storageInfo,
    this.zoneIds,
  });

  factory BrokerNodeGroupInfo.fromJson(Map<String, dynamic> json) {
    return BrokerNodeGroupInfo(
      clientSubnets: (json['clientSubnets'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      instanceType: json['instanceType'] as String,
      brokerAZDistribution:
          (json['brokerAZDistribution'] as String?)?.toBrokerAZDistribution(),
      connectivityInfo: json['connectivityInfo'] != null
          ? ConnectivityInfo.fromJson(
              json['connectivityInfo'] as Map<String, dynamic>)
          : null,
      securityGroups: (json['securityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      storageInfo: json['storageInfo'] != null
          ? StorageInfo.fromJson(json['storageInfo'] as Map<String, dynamic>)
          : null,
      zoneIds: (json['zoneIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clientSubnets = this.clientSubnets;
    final instanceType = this.instanceType;
    final brokerAZDistribution = this.brokerAZDistribution;
    final connectivityInfo = this.connectivityInfo;
    final securityGroups = this.securityGroups;
    final storageInfo = this.storageInfo;
    final zoneIds = this.zoneIds;
    return {
      'clientSubnets': clientSubnets,
      'instanceType': instanceType,
      if (brokerAZDistribution != null)
        'brokerAZDistribution': brokerAZDistribution.toValue(),
      if (connectivityInfo != null) 'connectivityInfo': connectivityInfo,
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (storageInfo != null) 'storageInfo': storageInfo,
      if (zoneIds != null) 'zoneIds': zoneIds,
    };
  }
}

///
/// BrokerNodeInfo
///
class BrokerNodeInfo {
  ///
  /// The attached elastic network interface of the broker.
  ///
  final String? attachedENIId;

  ///
  /// The ID of the broker.
  ///
  final double? brokerId;

  ///
  /// The client subnet to which this broker node belongs.
  ///
  final String? clientSubnet;

  ///
  /// The virtual private cloud (VPC) of the client.
  ///
  final String? clientVpcIpAddress;

  ///
  /// Information about the version of software currently deployed on the Apache
  /// Kafka brokers in the cluster.
  ///
  final BrokerSoftwareInfo? currentBrokerSoftwareInfo;

  ///
  /// Endpoints for accessing the broker.
  ///
  final List<String>? endpoints;

  BrokerNodeInfo({
    this.attachedENIId,
    this.brokerId,
    this.clientSubnet,
    this.clientVpcIpAddress,
    this.currentBrokerSoftwareInfo,
    this.endpoints,
  });

  factory BrokerNodeInfo.fromJson(Map<String, dynamic> json) {
    return BrokerNodeInfo(
      attachedENIId: json['attachedENIId'] as String?,
      brokerId: json['brokerId'] as double?,
      clientSubnet: json['clientSubnet'] as String?,
      clientVpcIpAddress: json['clientVpcIpAddress'] as String?,
      currentBrokerSoftwareInfo: json['currentBrokerSoftwareInfo'] != null
          ? BrokerSoftwareInfo.fromJson(
              json['currentBrokerSoftwareInfo'] as Map<String, dynamic>)
          : null,
      endpoints: (json['endpoints'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }
}

///
/// Information about the current software installed on the cluster.
///
class BrokerSoftwareInfo {
  ///
  /// The Amazon Resource Name (ARN) of the configuration used for the cluster.
  /// This field isn't visible in this preview release.
  ///
  final String? configurationArn;

  ///
  /// The revision of the configuration to use. This field isn't visible in this
  /// preview release.
  ///
  final int? configurationRevision;

  ///
  /// The version of Apache Kafka.
  ///
  final String? kafkaVersion;

  BrokerSoftwareInfo({
    this.configurationArn,
    this.configurationRevision,
    this.kafkaVersion,
  });

  factory BrokerSoftwareInfo.fromJson(Map<String, dynamic> json) {
    return BrokerSoftwareInfo(
      configurationArn: json['configurationArn'] as String?,
      configurationRevision: json['configurationRevision'] as int?,
      kafkaVersion: json['kafkaVersion'] as String?,
    );
  }
}

///
/// Includes all client authentication information.
///
class ClientAuthentication {
  ///
  /// Details for ClientAuthentication using SASL.
  ///
  final Sasl? sasl;

  ///
  /// Details for ClientAuthentication using TLS.
  ///
  final Tls? tls;

  ///
  /// Contains information about unauthenticated traffic to the cluster.
  ///
  final Unauthenticated? unauthenticated;

  ClientAuthentication({
    this.sasl,
    this.tls,
    this.unauthenticated,
  });

  factory ClientAuthentication.fromJson(Map<String, dynamic> json) {
    return ClientAuthentication(
      sasl: json['sasl'] != null
          ? Sasl.fromJson(json['sasl'] as Map<String, dynamic>)
          : null,
      tls: json['tls'] != null
          ? Tls.fromJson(json['tls'] as Map<String, dynamic>)
          : null,
      unauthenticated: json['unauthenticated'] != null
          ? Unauthenticated.fromJson(
              json['unauthenticated'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sasl = this.sasl;
    final tls = this.tls;
    final unauthenticated = this.unauthenticated;
    return {
      if (sasl != null) 'sasl': sasl,
      if (tls != null) 'tls': tls,
      if (unauthenticated != null) 'unauthenticated': unauthenticated,
    };
  }
}

///
/// Includes all client authentication information for VPC connectivity.
///
class VpcConnectivityClientAuthentication {
  ///
  /// SASL authentication type details for VPC connectivity.
  ///
  final VpcConnectivitySasl? sasl;

  ///
  /// TLS authentication type details for VPC connectivity.
  ///
  final VpcConnectivityTls? tls;

  VpcConnectivityClientAuthentication({
    this.sasl,
    this.tls,
  });

  factory VpcConnectivityClientAuthentication.fromJson(
      Map<String, dynamic> json) {
    return VpcConnectivityClientAuthentication(
      sasl: json['sasl'] != null
          ? VpcConnectivitySasl.fromJson(json['sasl'] as Map<String, dynamic>)
          : null,
      tls: json['tls'] != null
          ? VpcConnectivityTls.fromJson(json['tls'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sasl = this.sasl;
    final tls = this.tls;
    return {
      if (sasl != null) 'sasl': sasl,
      if (tls != null) 'tls': tls,
    };
  }
}

///
/// Includes all client authentication information.
///
class ServerlessClientAuthentication {
  ///
  /// Details for ClientAuthentication using SASL.
  ///
  final ServerlessSasl? sasl;

  ServerlessClientAuthentication({
    this.sasl,
  });

  factory ServerlessClientAuthentication.fromJson(Map<String, dynamic> json) {
    return ServerlessClientAuthentication(
      sasl: json['sasl'] != null
          ? ServerlessSasl.fromJson(json['sasl'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sasl = this.sasl;
    return {
      if (sasl != null) 'sasl': sasl,
    };
  }
}

///
/// Client-broker encryption in transit setting.
///
enum ClientBroker {
  tls,
  tlsPlaintext,
  plaintext,
}

extension ClientBrokerValueExtension on ClientBroker {
  String toValue() {
    switch (this) {
      case ClientBroker.tls:
        return 'TLS';
      case ClientBroker.tlsPlaintext:
        return 'TLS_PLAINTEXT';
      case ClientBroker.plaintext:
        return 'PLAINTEXT';
    }
  }
}

extension ClientBrokerFromString on String {
  ClientBroker toClientBroker() {
    switch (this) {
      case 'TLS':
        return ClientBroker.tls;
      case 'TLS_PLAINTEXT':
        return ClientBroker.tlsPlaintext;
      case 'PLAINTEXT':
        return ClientBroker.plaintext;
    }
    throw Exception('$this is not known in enum ClientBroker');
  }
}

class CloudWatchLogs {
  final bool enabled;
  final String? logGroup;

  CloudWatchLogs({
    required this.enabled,
    this.logGroup,
  });

  factory CloudWatchLogs.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogs(
      enabled: json['enabled'] as bool,
      logGroup: json['logGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final logGroup = this.logGroup;
    return {
      'enabled': enabled,
      if (logGroup != null) 'logGroup': logGroup,
    };
  }
}

///
/// Returns information about a cluster.
///
class ClusterInfo {
  ///
  /// Arn of active cluster operation.
  ///
  final String? activeOperationArn;

  ///
  /// Information about the broker nodes.
  ///
  final BrokerNodeGroupInfo? brokerNodeGroupInfo;

  ///
  /// Includes all client authentication information.
  ///
  final ClientAuthentication? clientAuthentication;

  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  final String? clusterArn;

  ///
  /// The name of the cluster.
  ///
  final String? clusterName;

  ///
  /// The time when the cluster was created.
  ///
  final DateTime? creationTime;

  ///
  /// Information about the version of software currently deployed on the Apache
  /// Kafka brokers in the cluster.
  ///
  final BrokerSoftwareInfo? currentBrokerSoftwareInfo;

  ///
  /// The current version of the MSK cluster.
  ///
  final String? currentVersion;

  ///
  /// Includes all encryption-related information.
  ///
  final EncryptionInfo? encryptionInfo;

  ///
  /// Specifies which metrics are gathered for the MSK cluster. This property has
  /// the following possible values: DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER,
  /// and PER_TOPIC_PER_PARTITION. For a list of the metrics associated with each
  /// of these levels of monitoring, see <a
  /// href="https://docs.aws.amazon.com/msk/latest/developerguide/monitoring.html">Monitoring</a>.
  ///
  final EnhancedMonitoring? enhancedMonitoring;
  final LoggingInfo? loggingInfo;

  ///
  /// The number of broker nodes in the cluster.
  ///
  final int? numberOfBrokerNodes;

  ///
  /// Settings for open monitoring using Prometheus.
  ///
  final OpenMonitoring? openMonitoring;

  ///
  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  ///
  final ClusterState? state;
  final StateInfo? stateInfo;

  ///
  /// This controls storage mode for supported storage tiers.
  ///
  final StorageMode? storageMode;

  ///
  /// Tags attached to the cluster.
  ///
  final Map<String, String>? tags;

  ///
  /// The connection string to use to connect to the Apache ZooKeeper cluster.
  ///
  final String? zookeeperConnectString;

  ///
  /// The connection string to use to connect to zookeeper cluster on Tls port.
  ///
  final String? zookeeperConnectStringTls;

  ClusterInfo({
    this.activeOperationArn,
    this.brokerNodeGroupInfo,
    this.clientAuthentication,
    this.clusterArn,
    this.clusterName,
    this.creationTime,
    this.currentBrokerSoftwareInfo,
    this.currentVersion,
    this.encryptionInfo,
    this.enhancedMonitoring,
    this.loggingInfo,
    this.numberOfBrokerNodes,
    this.openMonitoring,
    this.state,
    this.stateInfo,
    this.storageMode,
    this.tags,
    this.zookeeperConnectString,
    this.zookeeperConnectStringTls,
  });

  factory ClusterInfo.fromJson(Map<String, dynamic> json) {
    return ClusterInfo(
      activeOperationArn: json['activeOperationArn'] as String?,
      brokerNodeGroupInfo: json['brokerNodeGroupInfo'] != null
          ? BrokerNodeGroupInfo.fromJson(
              json['brokerNodeGroupInfo'] as Map<String, dynamic>)
          : null,
      clientAuthentication: json['clientAuthentication'] != null
          ? ClientAuthentication.fromJson(
              json['clientAuthentication'] as Map<String, dynamic>)
          : null,
      clusterArn: json['clusterArn'] as String?,
      clusterName: json['clusterName'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      currentBrokerSoftwareInfo: json['currentBrokerSoftwareInfo'] != null
          ? BrokerSoftwareInfo.fromJson(
              json['currentBrokerSoftwareInfo'] as Map<String, dynamic>)
          : null,
      currentVersion: json['currentVersion'] as String?,
      encryptionInfo: json['encryptionInfo'] != null
          ? EncryptionInfo.fromJson(
              json['encryptionInfo'] as Map<String, dynamic>)
          : null,
      enhancedMonitoring:
          (json['enhancedMonitoring'] as String?)?.toEnhancedMonitoring(),
      loggingInfo: json['loggingInfo'] != null
          ? LoggingInfo.fromJson(json['loggingInfo'] as Map<String, dynamic>)
          : null,
      numberOfBrokerNodes: json['numberOfBrokerNodes'] as int?,
      openMonitoring: json['openMonitoring'] != null
          ? OpenMonitoring.fromJson(
              json['openMonitoring'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.toClusterState(),
      stateInfo: json['stateInfo'] != null
          ? StateInfo.fromJson(json['stateInfo'] as Map<String, dynamic>)
          : null,
      storageMode: (json['storageMode'] as String?)?.toStorageMode(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      zookeeperConnectString: json['zookeeperConnectString'] as String?,
      zookeeperConnectStringTls: json['zookeeperConnectStringTls'] as String?,
    );
  }
}

///
/// Returns information about a cluster.
///
class Cluster {
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies a cluster operation.
  ///
  final String? activeOperationArn;

  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  ///
  final String? clusterArn;

  ///
  /// The name of the cluster.
  ///
  final String? clusterName;

  ///
  /// Cluster Type.
  ///
  final ClusterType? clusterType;

  ///
  /// The time when the cluster was created.
  ///
  final DateTime? creationTime;

  ///
  /// The current version of the MSK cluster.
  ///
  final String? currentVersion;

  ///
  /// Information about the provisioned cluster.
  ///
  final Provisioned? provisioned;

  ///
  /// Information about the serverless cluster.
  ///
  final Serverless? serverless;

  ///
  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  ///
  final ClusterState? state;

  ///
  /// State Info for the Amazon MSK cluster.
  ///
  final StateInfo? stateInfo;

  ///
  /// Tags attached to the cluster.
  ///
  final Map<String, String>? tags;

  Cluster({
    this.activeOperationArn,
    this.clusterArn,
    this.clusterName,
    this.clusterType,
    this.creationTime,
    this.currentVersion,
    this.provisioned,
    this.serverless,
    this.state,
    this.stateInfo,
    this.tags,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      activeOperationArn: json['activeOperationArn'] as String?,
      clusterArn: json['clusterArn'] as String?,
      clusterName: json['clusterName'] as String?,
      clusterType: (json['clusterType'] as String?)?.toClusterType(),
      creationTime: timeStampFromJson(json['creationTime']),
      currentVersion: json['currentVersion'] as String?,
      provisioned: json['provisioned'] != null
          ? Provisioned.fromJson(json['provisioned'] as Map<String, dynamic>)
          : null,
      serverless: json['serverless'] != null
          ? Serverless.fromJson(json['serverless'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.toClusterState(),
      stateInfo: json['stateInfo'] != null
          ? StateInfo.fromJson(json['stateInfo'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

///
/// Returns information about a cluster operation.
///
class ClusterOperationInfo {
  ///
  /// The ID of the API request that triggered this operation.
  ///
  final String? clientRequestId;

  ///
  /// ARN of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The time that the operation was created.
  ///
  final DateTime? creationTime;

  ///
  /// The time at which the operation finished.
  ///
  final DateTime? endTime;

  ///
  /// Describes the error if the operation fails.
  ///
  final ErrorInfo? errorInfo;

  ///
  /// ARN of the cluster operation.
  ///
  final String? operationArn;

  ///
  /// State of the cluster operation.
  ///
  final String? operationState;

  ///
  /// Steps completed during the operation.
  ///
  final List<ClusterOperationStep>? operationSteps;

  ///
  /// Type of the cluster operation.
  ///
  final String? operationType;

  ///
  /// Information about cluster attributes before a cluster is updated.
  ///
  final MutableClusterInfo? sourceClusterInfo;

  ///
  /// Information about cluster attributes after a cluster is updated.
  ///
  final MutableClusterInfo? targetClusterInfo;

  ///
  /// Description of the VPC connection for CreateVpcConnection and
  /// DeleteVpcConnection operations.
  ///
  final VpcConnectionInfo? vpcConnectionInfo;

  ClusterOperationInfo({
    this.clientRequestId,
    this.clusterArn,
    this.creationTime,
    this.endTime,
    this.errorInfo,
    this.operationArn,
    this.operationState,
    this.operationSteps,
    this.operationType,
    this.sourceClusterInfo,
    this.targetClusterInfo,
    this.vpcConnectionInfo,
  });

  factory ClusterOperationInfo.fromJson(Map<String, dynamic> json) {
    return ClusterOperationInfo(
      clientRequestId: json['clientRequestId'] as String?,
      clusterArn: json['clusterArn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      endTime: timeStampFromJson(json['endTime']),
      errorInfo: json['errorInfo'] != null
          ? ErrorInfo.fromJson(json['errorInfo'] as Map<String, dynamic>)
          : null,
      operationArn: json['operationArn'] as String?,
      operationState: json['operationState'] as String?,
      operationSteps: (json['operationSteps'] as List?)
          ?.whereNotNull()
          .map((e) => ClusterOperationStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      operationType: json['operationType'] as String?,
      sourceClusterInfo: json['sourceClusterInfo'] != null
          ? MutableClusterInfo.fromJson(
              json['sourceClusterInfo'] as Map<String, dynamic>)
          : null,
      targetClusterInfo: json['targetClusterInfo'] != null
          ? MutableClusterInfo.fromJson(
              json['targetClusterInfo'] as Map<String, dynamic>)
          : null,
      vpcConnectionInfo: json['vpcConnectionInfo'] != null
          ? VpcConnectionInfo.fromJson(
              json['vpcConnectionInfo'] as Map<String, dynamic>)
          : null,
    );
  }
}

///
/// Step taken during a cluster operation.
///
class ClusterOperationStep {
  ///
  /// Information about the step and its status.
  ///
  final ClusterOperationStepInfo? stepInfo;

  ///
  /// The name of the step.
  ///
  final String? stepName;

  ClusterOperationStep({
    this.stepInfo,
    this.stepName,
  });

  factory ClusterOperationStep.fromJson(Map<String, dynamic> json) {
    return ClusterOperationStep(
      stepInfo: json['stepInfo'] != null
          ? ClusterOperationStepInfo.fromJson(
              json['stepInfo'] as Map<String, dynamic>)
          : null,
      stepName: json['stepName'] as String?,
    );
  }
}

///
/// State information about the operation step.
///
class ClusterOperationStepInfo {
  ///
  /// The steps current status.
  ///
  final String? stepStatus;

  ClusterOperationStepInfo({
    this.stepStatus,
  });

  factory ClusterOperationStepInfo.fromJson(Map<String, dynamic> json) {
    return ClusterOperationStepInfo(
      stepStatus: json['stepStatus'] as String?,
    );
  }
}

///
/// The state of the Apache Kafka cluster.
///
enum ClusterState {
  active,
  creating,
  deleting,
  failed,
  healing,
  maintenance,
  rebootingBroker,
  updating,
}

extension ClusterStateValueExtension on ClusterState {
  String toValue() {
    switch (this) {
      case ClusterState.active:
        return 'ACTIVE';
      case ClusterState.creating:
        return 'CREATING';
      case ClusterState.deleting:
        return 'DELETING';
      case ClusterState.failed:
        return 'FAILED';
      case ClusterState.healing:
        return 'HEALING';
      case ClusterState.maintenance:
        return 'MAINTENANCE';
      case ClusterState.rebootingBroker:
        return 'REBOOTING_BROKER';
      case ClusterState.updating:
        return 'UPDATING';
    }
  }
}

extension ClusterStateFromString on String {
  ClusterState toClusterState() {
    switch (this) {
      case 'ACTIVE':
        return ClusterState.active;
      case 'CREATING':
        return ClusterState.creating;
      case 'DELETING':
        return ClusterState.deleting;
      case 'FAILED':
        return ClusterState.failed;
      case 'HEALING':
        return ClusterState.healing;
      case 'MAINTENANCE':
        return ClusterState.maintenance;
      case 'REBOOTING_BROKER':
        return ClusterState.rebootingBroker;
      case 'UPDATING':
        return ClusterState.updating;
    }
    throw Exception('$this is not known in enum ClusterState');
  }
}

///
/// The type of cluster.
///
enum ClusterType {
  provisioned,
  serverless,
}

extension ClusterTypeValueExtension on ClusterType {
  String toValue() {
    switch (this) {
      case ClusterType.provisioned:
        return 'PROVISIONED';
      case ClusterType.serverless:
        return 'SERVERLESS';
    }
  }
}

extension ClusterTypeFromString on String {
  ClusterType toClusterType() {
    switch (this) {
      case 'PROVISIONED':
        return ClusterType.provisioned;
      case 'SERVERLESS':
        return ClusterType.serverless;
    }
    throw Exception('$this is not known in enum ClusterType');
  }
}

///
/// Provisioned cluster request.
///
class ProvisionedRequest {
  ///
  /// Information about the brokers.
  ///
  final BrokerNodeGroupInfo brokerNodeGroupInfo;

  ///
  /// The Apache Kafka version that you want for the cluster.
  ///
  final String kafkaVersion;

  ///
  /// The number of broker nodes in the cluster.
  ///
  final int numberOfBrokerNodes;

  ///
  /// Includes all client authentication information.
  ///
  final ClientAuthentication? clientAuthentication;

  ///
  /// Represents the configuration that you want Amazon MSK to use for the brokers
  /// in a cluster.
  ///
  final ConfigurationInfo? configurationInfo;

  ///
  /// Includes all encryption-related information.
  ///
  final EncryptionInfo? encryptionInfo;

  ///
  /// Specifies the level of monitoring for the MSK cluster. The possible values
  /// are DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER, and PER_TOPIC_PER_PARTITION.
  ///
  final EnhancedMonitoring? enhancedMonitoring;

  ///
  /// Log delivery information for the cluster.
  ///
  final LoggingInfo? loggingInfo;

  ///
  /// The settings for open monitoring.
  ///
  final OpenMonitoringInfo? openMonitoring;

  ///
  /// This controls storage mode for supported storage tiers.
  ///
  final StorageMode? storageMode;

  ProvisionedRequest({
    required this.brokerNodeGroupInfo,
    required this.kafkaVersion,
    required this.numberOfBrokerNodes,
    this.clientAuthentication,
    this.configurationInfo,
    this.encryptionInfo,
    this.enhancedMonitoring,
    this.loggingInfo,
    this.openMonitoring,
    this.storageMode,
  });

  Map<String, dynamic> toJson() {
    final brokerNodeGroupInfo = this.brokerNodeGroupInfo;
    final kafkaVersion = this.kafkaVersion;
    final numberOfBrokerNodes = this.numberOfBrokerNodes;
    final clientAuthentication = this.clientAuthentication;
    final configurationInfo = this.configurationInfo;
    final encryptionInfo = this.encryptionInfo;
    final enhancedMonitoring = this.enhancedMonitoring;
    final loggingInfo = this.loggingInfo;
    final openMonitoring = this.openMonitoring;
    final storageMode = this.storageMode;
    return {
      'brokerNodeGroupInfo': brokerNodeGroupInfo,
      'kafkaVersion': kafkaVersion,
      'numberOfBrokerNodes': numberOfBrokerNodes,
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
      if (configurationInfo != null) 'configurationInfo': configurationInfo,
      if (encryptionInfo != null) 'encryptionInfo': encryptionInfo,
      if (enhancedMonitoring != null)
        'enhancedMonitoring': enhancedMonitoring.toValue(),
      if (loggingInfo != null) 'loggingInfo': loggingInfo,
      if (openMonitoring != null) 'openMonitoring': openMonitoring,
      if (storageMode != null) 'storageMode': storageMode.toValue(),
    };
  }
}

///
/// Provisioned cluster.
///
class Provisioned {
  ///
  /// Information about the brokers.
  ///
  final BrokerNodeGroupInfo brokerNodeGroupInfo;

  ///
  /// The number of broker nodes in the cluster.
  ///
  final int numberOfBrokerNodes;

  ///
  /// Includes all client authentication information.
  ///
  final ClientAuthentication? clientAuthentication;

  ///
  /// Information about the Apache Kafka version deployed on the brokers.
  ///
  final BrokerSoftwareInfo? currentBrokerSoftwareInfo;

  ///
  /// Includes all encryption-related information.
  ///
  final EncryptionInfo? encryptionInfo;

  ///
  /// Specifies the level of monitoring for the MSK cluster. The possible values
  /// are DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER, and PER_TOPIC_PER_PARTITION.
  ///
  final EnhancedMonitoring? enhancedMonitoring;

  ///
  /// Log delivery information for the cluster.
  ///
  final LoggingInfo? loggingInfo;

  ///
  /// The settings for open monitoring.
  ///
  final OpenMonitoringInfo? openMonitoring;

  ///
  /// This controls storage mode for supported storage tiers.
  ///
  final StorageMode? storageMode;

  ///
  /// The connection string to use to connect to the Apache ZooKeeper cluster.
  ///
  final String? zookeeperConnectString;

  ///
  /// The connection string to use to connect to the Apache ZooKeeper cluster on a
  /// TLS port.
  ///
  final String? zookeeperConnectStringTls;

  Provisioned({
    required this.brokerNodeGroupInfo,
    required this.numberOfBrokerNodes,
    this.clientAuthentication,
    this.currentBrokerSoftwareInfo,
    this.encryptionInfo,
    this.enhancedMonitoring,
    this.loggingInfo,
    this.openMonitoring,
    this.storageMode,
    this.zookeeperConnectString,
    this.zookeeperConnectStringTls,
  });

  factory Provisioned.fromJson(Map<String, dynamic> json) {
    return Provisioned(
      brokerNodeGroupInfo: BrokerNodeGroupInfo.fromJson(
          json['brokerNodeGroupInfo'] as Map<String, dynamic>),
      numberOfBrokerNodes: json['numberOfBrokerNodes'] as int,
      clientAuthentication: json['clientAuthentication'] != null
          ? ClientAuthentication.fromJson(
              json['clientAuthentication'] as Map<String, dynamic>)
          : null,
      currentBrokerSoftwareInfo: json['currentBrokerSoftwareInfo'] != null
          ? BrokerSoftwareInfo.fromJson(
              json['currentBrokerSoftwareInfo'] as Map<String, dynamic>)
          : null,
      encryptionInfo: json['encryptionInfo'] != null
          ? EncryptionInfo.fromJson(
              json['encryptionInfo'] as Map<String, dynamic>)
          : null,
      enhancedMonitoring:
          (json['enhancedMonitoring'] as String?)?.toEnhancedMonitoring(),
      loggingInfo: json['loggingInfo'] != null
          ? LoggingInfo.fromJson(json['loggingInfo'] as Map<String, dynamic>)
          : null,
      openMonitoring: json['openMonitoring'] != null
          ? OpenMonitoringInfo.fromJson(
              json['openMonitoring'] as Map<String, dynamic>)
          : null,
      storageMode: (json['storageMode'] as String?)?.toStorageMode(),
      zookeeperConnectString: json['zookeeperConnectString'] as String?,
      zookeeperConnectStringTls: json['zookeeperConnectStringTls'] as String?,
    );
  }
}

///
/// The configuration of the Amazon VPCs for the cluster.
///
class VpcConfig {
  ///
  /// The IDs of the subnets associated with the cluster.
  ///
  final List<String> subnetIds;

  ///
  /// The IDs of the security groups associated with the cluster.
  ///
  final List<String>? securityGroupIds;

  VpcConfig({
    required this.subnetIds,
    this.securityGroupIds,
  });

  factory VpcConfig.fromJson(Map<String, dynamic> json) {
    return VpcConfig(
      subnetIds: (json['subnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final subnetIds = this.subnetIds;
    final securityGroupIds = this.securityGroupIds;
    return {
      'subnetIds': subnetIds,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
    };
  }
}

///
/// Serverless cluster request.
///
class ServerlessRequest {
  ///
  /// The configuration of the Amazon VPCs for the cluster.
  ///
  final List<VpcConfig> vpcConfigs;

  ///
  /// Includes all client authentication information.
  ///
  final ServerlessClientAuthentication? clientAuthentication;

  ServerlessRequest({
    required this.vpcConfigs,
    this.clientAuthentication,
  });

  Map<String, dynamic> toJson() {
    final vpcConfigs = this.vpcConfigs;
    final clientAuthentication = this.clientAuthentication;
    return {
      'vpcConfigs': vpcConfigs,
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
    };
  }
}

///
/// Serverless cluster.
///
class Serverless {
  ///
  /// The configuration of the Amazon VPCs for the cluster.
  ///
  final List<VpcConfig> vpcConfigs;

  ///
  /// Includes all client authentication information.
  ///
  final ServerlessClientAuthentication? clientAuthentication;

  Serverless({
    required this.vpcConfigs,
    this.clientAuthentication,
  });

  factory Serverless.fromJson(Map<String, dynamic> json) {
    return Serverless(
      vpcConfigs: (json['vpcConfigs'] as List)
          .whereNotNull()
          .map((e) => VpcConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      clientAuthentication: json['clientAuthentication'] != null
          ? ServerlessClientAuthentication.fromJson(
              json['clientAuthentication'] as Map<String, dynamic>)
          : null,
    );
  }
}

///
/// The client VPC connection object.
///
class ClientVpcConnection {
  ///
  /// The ARN that identifies the Vpc Connection.
  ///
  final String vpcConnectionArn;

  ///
  /// Information about the auth scheme of Vpc Connection.
  ///
  final String? authentication;

  ///
  /// Creation time of the Vpc Connection.
  ///
  final DateTime? creationTime;

  ///
  /// The Owner of the Vpc Connection.
  ///
  final String? owner;

  ///
  /// State of the Vpc Connection.
  ///
  final VpcConnectionState? state;

  ClientVpcConnection({
    required this.vpcConnectionArn,
    this.authentication,
    this.creationTime,
    this.owner,
    this.state,
  });

  factory ClientVpcConnection.fromJson(Map<String, dynamic> json) {
    return ClientVpcConnection(
      vpcConnectionArn: json['vpcConnectionArn'] as String,
      authentication: json['authentication'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      owner: json['owner'] as String?,
      state: (json['state'] as String?)?.toVpcConnectionState(),
    );
  }
}

///
/// The VPC connection object.
///
class VpcConnection {
  ///
  /// The ARN that identifies the Cluster which the Vpc Connection belongs to.
  ///
  final String targetClusterArn;

  ///
  /// The ARN that identifies the Vpc Connection.
  ///
  final String vpcConnectionArn;

  ///
  /// Information about the auth scheme of Vpc Connection.
  ///
  final String? authentication;

  ///
  /// Creation time of the Vpc Connection.
  ///
  final DateTime? creationTime;

  ///
  /// State of the Vpc Connection.
  ///
  final VpcConnectionState? state;

  ///
  /// The vpcId that belongs to the Vpc Connection.
  ///
  final String? vpcId;

  VpcConnection({
    required this.targetClusterArn,
    required this.vpcConnectionArn,
    this.authentication,
    this.creationTime,
    this.state,
    this.vpcId,
  });

  factory VpcConnection.fromJson(Map<String, dynamic> json) {
    return VpcConnection(
      targetClusterArn: json['targetClusterArn'] as String,
      vpcConnectionArn: json['vpcConnectionArn'] as String,
      authentication: json['authentication'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      state: (json['state'] as String?)?.toVpcConnectionState(),
      vpcId: json['vpcId'] as String?,
    );
  }
}

///
/// Contains source Apache Kafka versions and compatible target Apache Kafka
/// versions.
///
class CompatibleKafkaVersion {
  ///
  /// An Apache Kafka version.
  ///
  final String? sourceVersion;

  ///
  /// A list of Apache Kafka versions.
  ///
  final List<String>? targetVersions;

  CompatibleKafkaVersion({
    this.sourceVersion,
    this.targetVersions,
  });

  factory CompatibleKafkaVersion.fromJson(Map<String, dynamic> json) {
    return CompatibleKafkaVersion(
      sourceVersion: json['sourceVersion'] as String?,
      targetVersions: (json['targetVersions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }
}

///
/// Represents an MSK Configuration.
///
class Configuration {
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  final String arn;

  ///
  /// The time when the configuration was created.
  ///
  final DateTime creationTime;

  ///
  /// The description of the configuration.
  ///
  final String description;

  ///
  /// An array of the versions of Apache Kafka with which you can use this MSK
  /// configuration. You can use this configuration for an MSK cluster only if the
  /// Apache Kafka version specified for the cluster appears in this array.
  ///
  final List<String> kafkaVersions;

  ///
  /// Latest revision of the configuration.
  ///
  final ConfigurationRevision latestRevision;

  ///
  /// The name of the configuration.
  ///
  final String name;

  ///
  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  ///
  final ConfigurationState state;

  Configuration({
    required this.arn,
    required this.creationTime,
    required this.description,
    required this.kafkaVersions,
    required this.latestRevision,
    required this.name,
    required this.state,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      description: json['description'] as String,
      kafkaVersions: (json['kafkaVersions'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      latestRevision: ConfigurationRevision.fromJson(
          json['latestRevision'] as Map<String, dynamic>),
      name: json['name'] as String,
      state: (json['state'] as String).toConfigurationState(),
    );
  }
}

///
/// Specifies the configuration to use for the brokers.
///
class ConfigurationInfo {
  ///
  /// ARN of the configuration to use.
  ///
  final String arn;

  ///
  /// The revision of the configuration to use.
  ///
  final int revision;

  ConfigurationInfo({
    required this.arn,
    required this.revision,
  });

  factory ConfigurationInfo.fromJson(Map<String, dynamic> json) {
    return ConfigurationInfo(
      arn: json['arn'] as String,
      revision: json['revision'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final revision = this.revision;
    return {
      'arn': arn,
      'revision': revision,
    };
  }
}

///
/// Describes a configuration revision.
///
class ConfigurationRevision {
  ///
  /// The time when the configuration revision was created.
  ///
  final DateTime creationTime;

  ///
  /// The revision number.
  ///
  final int revision;

  ///
  /// The description of the configuration revision.
  ///
  final String? description;

  ConfigurationRevision({
    required this.creationTime,
    required this.revision,
    this.description,
  });

  factory ConfigurationRevision.fromJson(Map<String, dynamic> json) {
    return ConfigurationRevision(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      revision: json['revision'] as int,
      description: json['description'] as String?,
    );
  }
}

///
/// The state of a configuration.
///
enum ConfigurationState {
  active,
  deleting,
  deleteFailed,
}

extension ConfigurationStateValueExtension on ConfigurationState {
  String toValue() {
    switch (this) {
      case ConfigurationState.active:
        return 'ACTIVE';
      case ConfigurationState.deleting:
        return 'DELETING';
      case ConfigurationState.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension ConfigurationStateFromString on String {
  ConfigurationState toConfigurationState() {
    switch (this) {
      case 'ACTIVE':
        return ConfigurationState.active;
      case 'DELETING':
        return ConfigurationState.deleting;
      case 'DELETE_FAILED':
        return ConfigurationState.deleteFailed;
    }
    throw Exception('$this is not known in enum ConfigurationState');
  }
}

///
/// Information about the broker access configuration.
///
class ConnectivityInfo {
  ///
  /// Public access control for brokers.
  ///
  final PublicAccess? publicAccess;

  ///
  /// VPC connectivity access control for brokers.
  ///
  final VpcConnectivity? vpcConnectivity;

  ConnectivityInfo({
    this.publicAccess,
    this.vpcConnectivity,
  });

  factory ConnectivityInfo.fromJson(Map<String, dynamic> json) {
    return ConnectivityInfo(
      publicAccess: json['publicAccess'] != null
          ? PublicAccess.fromJson(json['publicAccess'] as Map<String, dynamic>)
          : null,
      vpcConnectivity: json['vpcConnectivity'] != null
          ? VpcConnectivity.fromJson(
              json['vpcConnectivity'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final publicAccess = this.publicAccess;
    final vpcConnectivity = this.vpcConnectivity;
    return {
      if (publicAccess != null) 'publicAccess': publicAccess,
      if (vpcConnectivity != null) 'vpcConnectivity': vpcConnectivity,
    };
  }
}

class CreateClusterResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The name of the MSK cluster.
  ///
  final String? clusterName;

  ///
  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  ///
  final ClusterState? state;

  CreateClusterResponse({
    this.clusterArn,
    this.clusterName,
    this.state,
  });

  factory CreateClusterResponse.fromJson(Map<String, dynamic> json) {
    return CreateClusterResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterName: json['clusterName'] as String?,
      state: (json['state'] as String?)?.toClusterState(),
    );
  }
}

class CreateClusterV2Response {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The name of the MSK cluster.
  ///
  final String? clusterName;

  ///
  /// The type of the cluster. The possible states are PROVISIONED or SERVERLESS.
  ///
  final ClusterType? clusterType;

  ///
  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  ///
  final ClusterState? state;

  CreateClusterV2Response({
    this.clusterArn,
    this.clusterName,
    this.clusterType,
    this.state,
  });

  factory CreateClusterV2Response.fromJson(Map<String, dynamic> json) {
    return CreateClusterV2Response(
      clusterArn: json['clusterArn'] as String?,
      clusterName: json['clusterName'] as String?,
      clusterType: (json['clusterType'] as String?)?.toClusterType(),
      state: (json['state'] as String?)?.toClusterState(),
    );
  }
}

class CreateConfigurationResponse {
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  final String? arn;

  ///
  /// The time when the configuration was created.
  ///
  final DateTime? creationTime;

  ///
  /// Latest revision of the configuration.
  ///
  final ConfigurationRevision? latestRevision;

  ///
  /// The name of the configuration.
  ///
  final String? name;

  ///
  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  ///
  final ConfigurationState? state;

  CreateConfigurationResponse({
    this.arn,
    this.creationTime,
    this.latestRevision,
    this.name,
    this.state,
  });

  factory CreateConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return CreateConfigurationResponse(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      latestRevision: json['latestRevision'] != null
          ? ConfigurationRevision.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      state: (json['state'] as String?)?.toConfigurationState(),
    );
  }
}

class CreateVpcConnectionResponse {
  ///
  /// The authentication type of VPC connection.
  ///
  final String? authentication;

  ///
  /// The list of client subnets.
  ///
  final List<String>? clientSubnets;

  ///
  /// The creation time of VPC connection.
  ///
  final DateTime? creationTime;

  ///
  /// The list of security groups.
  ///
  final List<String>? securityGroups;

  ///
  /// The State of Vpc Connection.
  ///
  final VpcConnectionState? state;

  ///
  /// A map of tags for the VPC connection.
  ///
  final Map<String, String>? tags;

  ///
  /// The VPC connection ARN.
  ///
  final String? vpcConnectionArn;

  ///
  /// The VPC ID of the VPC connection.
  ///
  final String? vpcId;

  CreateVpcConnectionResponse({
    this.authentication,
    this.clientSubnets,
    this.creationTime,
    this.securityGroups,
    this.state,
    this.tags,
    this.vpcConnectionArn,
    this.vpcId,
  });

  factory CreateVpcConnectionResponse.fromJson(Map<String, dynamic> json) {
    return CreateVpcConnectionResponse(
      authentication: json['authentication'] as String?,
      clientSubnets: (json['clientSubnets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      creationTime: timeStampFromJson(json['creationTime']),
      securityGroups: (json['securityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      state: (json['state'] as String?)?.toVpcConnectionState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcConnectionArn: json['vpcConnectionArn'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }
}

class DeleteClusterResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The state of the cluster. The possible states are ACTIVE, CREATING,
  /// DELETING, FAILED, HEALING, MAINTENANCE, REBOOTING_BROKER, and UPDATING.
  ///
  final ClusterState? state;

  DeleteClusterResponse({
    this.clusterArn,
    this.state,
  });

  factory DeleteClusterResponse.fromJson(Map<String, dynamic> json) {
    return DeleteClusterResponse(
      clusterArn: json['clusterArn'] as String?,
      state: (json['state'] as String?)?.toClusterState(),
    );
  }
}

class DeleteClusterPolicyResponse {
  DeleteClusterPolicyResponse();

  factory DeleteClusterPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteClusterPolicyResponse();
  }
}

class DeleteConfigurationResponse {
  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK
  /// configuration.
  ///
  final String? arn;

  ///
  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  ///
  final ConfigurationState? state;

  DeleteConfigurationResponse({
    this.arn,
    this.state,
  });

  factory DeleteConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return DeleteConfigurationResponse(
      arn: json['arn'] as String?,
      state: (json['state'] as String?)?.toConfigurationState(),
    );
  }
}

class DeleteVpcConnectionResponse {
  ///
  /// The state of the VPC connection.
  ///
  final VpcConnectionState? state;

  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK VPC
  /// connection.
  ///
  final String? vpcConnectionArn;

  DeleteVpcConnectionResponse({
    this.state,
    this.vpcConnectionArn,
  });

  factory DeleteVpcConnectionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteVpcConnectionResponse(
      state: (json['state'] as String?)?.toVpcConnectionState(),
      vpcConnectionArn: json['vpcConnectionArn'] as String?,
    );
  }
}

class DescribeClusterOperationResponse {
  ///
  /// Cluster operation information
  ///
  final ClusterOperationInfo? clusterOperationInfo;

  DescribeClusterOperationResponse({
    this.clusterOperationInfo,
  });

  factory DescribeClusterOperationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeClusterOperationResponse(
      clusterOperationInfo: json['clusterOperationInfo'] != null
          ? ClusterOperationInfo.fromJson(
              json['clusterOperationInfo'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeClusterResponse {
  ///
  /// The cluster information.
  ///
  final ClusterInfo? clusterInfo;

  DescribeClusterResponse({
    this.clusterInfo,
  });

  factory DescribeClusterResponse.fromJson(Map<String, dynamic> json) {
    return DescribeClusterResponse(
      clusterInfo: json['clusterInfo'] != null
          ? ClusterInfo.fromJson(json['clusterInfo'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeClusterV2Response {
  ///
  /// The cluster information.
  ///
  final Cluster? clusterInfo;

  DescribeClusterV2Response({
    this.clusterInfo,
  });

  factory DescribeClusterV2Response.fromJson(Map<String, dynamic> json) {
    return DescribeClusterV2Response(
      clusterInfo: json['clusterInfo'] != null
          ? Cluster.fromJson(json['clusterInfo'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeConfigurationResponse {
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  final String? arn;

  ///
  /// The time when the configuration was created.
  ///
  final DateTime? creationTime;

  ///
  /// The description of the configuration.
  ///
  final String? description;

  ///
  /// The versions of Apache Kafka with which you can use this MSK configuration.
  ///
  final List<String>? kafkaVersions;

  ///
  /// Latest revision of the configuration.
  ///
  final ConfigurationRevision? latestRevision;

  ///
  /// The name of the configuration.
  ///
  final String? name;

  ///
  /// The state of the configuration. The possible states are ACTIVE, DELETING,
  /// and DELETE_FAILED.
  ///
  final ConfigurationState? state;

  DescribeConfigurationResponse({
    this.arn,
    this.creationTime,
    this.description,
    this.kafkaVersions,
    this.latestRevision,
    this.name,
    this.state,
  });

  factory DescribeConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeConfigurationResponse(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      kafkaVersions: (json['kafkaVersions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      latestRevision: json['latestRevision'] != null
          ? ConfigurationRevision.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      state: (json['state'] as String?)?.toConfigurationState(),
    );
  }
}

class DescribeConfigurationRevisionResponse {
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  final String? arn;

  ///
  /// The time when the configuration was created.
  ///
  final DateTime? creationTime;

  ///
  /// The description of the configuration.
  ///
  final String? description;

  ///
  /// The revision number.
  ///
  final int? revision;

  ///
  /// Contents of the <filename>server.properties</filename> file. When using the
  /// API, you must ensure that the contents of the file are base64 encoded.
  /// When using the AWS Management Console, the SDK, or the AWS CLI, the contents
  /// of <filename>server.properties</filename> can be in plaintext.
  ///
  final Uint8List? serverProperties;

  DescribeConfigurationRevisionResponse({
    this.arn,
    this.creationTime,
    this.description,
    this.revision,
    this.serverProperties,
  });

  factory DescribeConfigurationRevisionResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeConfigurationRevisionResponse(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      revision: json['revision'] as int?,
      serverProperties:
          _s.decodeNullableUint8List(json['serverProperties'] as String?),
    );
  }
}

class DescribeVpcConnectionResponse {
  ///
  /// The authentication type of VPC connection.
  ///
  final String? authentication;

  ///
  /// The creation time of the VPC connection.
  ///
  final DateTime? creationTime;

  ///
  /// The list of security groups for the VPC connection.
  ///
  final List<String>? securityGroups;

  ///
  /// The state of VPC connection.
  ///
  final VpcConnectionState? state;

  ///
  /// The list of subnets for the VPC connection.
  ///
  final List<String>? subnets;

  ///
  /// A map of tags for the VPC connection.
  ///
  final Map<String, String>? tags;

  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies an MSK cluster.
  ///
  final String? targetClusterArn;

  ///
  /// The Amazon Resource Name (ARN) that uniquely identifies a MSK VPC
  /// connection.
  ///
  final String? vpcConnectionArn;

  ///
  /// The VPC Id for the VPC connection.
  ///
  final String? vpcId;

  DescribeVpcConnectionResponse({
    this.authentication,
    this.creationTime,
    this.securityGroups,
    this.state,
    this.subnets,
    this.tags,
    this.targetClusterArn,
    this.vpcConnectionArn,
    this.vpcId,
  });

  factory DescribeVpcConnectionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeVpcConnectionResponse(
      authentication: json['authentication'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      securityGroups: (json['securityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      state: (json['state'] as String?)?.toVpcConnectionState(),
      subnets: (json['subnets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetClusterArn: json['targetClusterArn'] as String?,
      vpcConnectionArn: json['vpcConnectionArn'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }
}

class BatchDisassociateScramSecretResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// List of errors when disassociating secrets to cluster.
  ///
  final List<UnprocessedScramSecret>? unprocessedScramSecrets;

  BatchDisassociateScramSecretResponse({
    this.clusterArn,
    this.unprocessedScramSecrets,
  });

  factory BatchDisassociateScramSecretResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDisassociateScramSecretResponse(
      clusterArn: json['clusterArn'] as String?,
      unprocessedScramSecrets: (json['unprocessedScramSecrets'] as List?)
          ?.whereNotNull()
          .map(
              (e) => UnprocessedScramSecret.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

///
/// Contains information about the EBS storage volumes attached to Apache Kafka
/// broker nodes.
///
class EBSStorageInfo {
  ///
  /// EBS volume provisioned throughput information.
  ///
  final ProvisionedThroughput? provisionedThroughput;

  ///
  /// The size in GiB of the EBS volume for the data drive on each broker node.
  ///
  final int? volumeSize;

  EBSStorageInfo({
    this.provisionedThroughput,
    this.volumeSize,
  });

  factory EBSStorageInfo.fromJson(Map<String, dynamic> json) {
    return EBSStorageInfo(
      provisionedThroughput: json['provisionedThroughput'] != null
          ? ProvisionedThroughput.fromJson(
              json['provisionedThroughput'] as Map<String, dynamic>)
          : null,
      volumeSize: json['volumeSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final provisionedThroughput = this.provisionedThroughput;
    final volumeSize = this.volumeSize;
    return {
      if (provisionedThroughput != null)
        'provisionedThroughput': provisionedThroughput,
      if (volumeSize != null) 'volumeSize': volumeSize,
    };
  }
}

///
/// The data-volume encryption details.
///
class EncryptionAtRest {
  ///
  /// The ARN of the AWS KMS key for encrypting data at rest. If you don't specify
  /// a KMS key, MSK creates one for you and uses it.
  ///
  final String dataVolumeKMSKeyId;

  EncryptionAtRest({
    required this.dataVolumeKMSKeyId,
  });

  factory EncryptionAtRest.fromJson(Map<String, dynamic> json) {
    return EncryptionAtRest(
      dataVolumeKMSKeyId: json['dataVolumeKMSKeyId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dataVolumeKMSKeyId = this.dataVolumeKMSKeyId;
    return {
      'dataVolumeKMSKeyId': dataVolumeKMSKeyId,
    };
  }
}

///
/// The settings for encrypting data in transit.
///
class EncryptionInTransit {
  ///
  /// Indicates the encryption setting for data in transit between clients and
  /// brokers. The following are the possible values.
  ///
  ///
  ///
  /// TLS means that client-broker communication is enabled with TLS only.
  ///
  ///
  ///
  /// TLS_PLAINTEXT means that client-broker communication is enabled for both
  /// TLS-encrypted, as well as plaintext data.
  ///
  ///
  ///
  /// PLAINTEXT means that client-broker communication is enabled in plaintext
  /// only.
  ///
  ///
  /// The default value is TLS_PLAINTEXT.
  ///
  final ClientBroker? clientBroker;

  ///
  /// When set to true, it indicates that data communication among the broker
  /// nodes of the cluster is encrypted. When set to false, the communication
  /// happens in plaintext.
  ///
  ///
  /// The default value is true.
  ///
  final bool? inCluster;

  EncryptionInTransit({
    this.clientBroker,
    this.inCluster,
  });

  factory EncryptionInTransit.fromJson(Map<String, dynamic> json) {
    return EncryptionInTransit(
      clientBroker: (json['clientBroker'] as String?)?.toClientBroker(),
      inCluster: json['inCluster'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientBroker = this.clientBroker;
    final inCluster = this.inCluster;
    return {
      if (clientBroker != null) 'clientBroker': clientBroker.toValue(),
      if (inCluster != null) 'inCluster': inCluster,
    };
  }
}

///
/// Includes encryption-related information, such as the AWS KMS key used for
/// encrypting data at rest and whether you want MSK to encrypt your data in
/// transit.
///
class EncryptionInfo {
  ///
  /// The data-volume encryption details.
  ///
  final EncryptionAtRest? encryptionAtRest;

  ///
  /// The details for encryption in transit.
  ///
  final EncryptionInTransit? encryptionInTransit;

  EncryptionInfo({
    this.encryptionAtRest,
    this.encryptionInTransit,
  });

  factory EncryptionInfo.fromJson(Map<String, dynamic> json) {
    return EncryptionInfo(
      encryptionAtRest: json['encryptionAtRest'] != null
          ? EncryptionAtRest.fromJson(
              json['encryptionAtRest'] as Map<String, dynamic>)
          : null,
      encryptionInTransit: json['encryptionInTransit'] != null
          ? EncryptionInTransit.fromJson(
              json['encryptionInTransit'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionAtRest = this.encryptionAtRest;
    final encryptionInTransit = this.encryptionInTransit;
    return {
      if (encryptionAtRest != null) 'encryptionAtRest': encryptionAtRest,
      if (encryptionInTransit != null)
        'encryptionInTransit': encryptionInTransit,
    };
  }
}

///
/// Specifies which metrics are gathered for the MSK cluster. This property has
/// the following possible values: DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER,
/// and PER_TOPIC_PER_PARTITION. For a list of the metrics associated with each
/// of these levels of monitoring, see <a
/// href="https://docs.aws.amazon.com/msk/latest/developerguide/monitoring.html">Monitoring</a>.
///
enum EnhancedMonitoring {
  $default,
  perBroker,
  perTopicPerBroker,
  perTopicPerPartition,
}

extension EnhancedMonitoringValueExtension on EnhancedMonitoring {
  String toValue() {
    switch (this) {
      case EnhancedMonitoring.$default:
        return 'DEFAULT';
      case EnhancedMonitoring.perBroker:
        return 'PER_BROKER';
      case EnhancedMonitoring.perTopicPerBroker:
        return 'PER_TOPIC_PER_BROKER';
      case EnhancedMonitoring.perTopicPerPartition:
        return 'PER_TOPIC_PER_PARTITION';
    }
  }
}

extension EnhancedMonitoringFromString on String {
  EnhancedMonitoring toEnhancedMonitoring() {
    switch (this) {
      case 'DEFAULT':
        return EnhancedMonitoring.$default;
      case 'PER_BROKER':
        return EnhancedMonitoring.perBroker;
      case 'PER_TOPIC_PER_BROKER':
        return EnhancedMonitoring.perTopicPerBroker;
      case 'PER_TOPIC_PER_PARTITION':
        return EnhancedMonitoring.perTopicPerPartition;
    }
    throw Exception('$this is not known in enum EnhancedMonitoring');
  }
}

///
/// Returns information about an error state of the cluster.
///
class ErrorInfo {
  ///
  /// A number describing the error programmatically.
  ///
  final String? errorCode;

  ///
  /// An optional field to provide more details about the error.
  ///
  final String? errorString;

  ErrorInfo({
    this.errorCode,
    this.errorString,
  });

  factory ErrorInfo.fromJson(Map<String, dynamic> json) {
    return ErrorInfo(
      errorCode: json['errorCode'] as String?,
      errorString: json['errorString'] as String?,
    );
  }
}

class Firehose {
  final bool enabled;
  final String? deliveryStream;

  Firehose({
    required this.enabled,
    this.deliveryStream,
  });

  factory Firehose.fromJson(Map<String, dynamic> json) {
    return Firehose(
      enabled: json['enabled'] as bool,
      deliveryStream: json['deliveryStream'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final deliveryStream = this.deliveryStream;
    return {
      'enabled': enabled,
      if (deliveryStream != null) 'deliveryStream': deliveryStream,
    };
  }
}

class GetBootstrapBrokersResponse {
  ///
  /// A string containing one or more hostname:port pairs.
  ///
  final String? bootstrapBrokerString;

  ///
  /// A string that contains one or more DNS names (or IP addresses) and SASL IAM
  /// port pairs.
  ///
  final String? bootstrapBrokerStringPublicSaslIam;

  ///
  /// A string containing one or more DNS names (or IP) and Sasl Scram port pairs.
  ///
  final String? bootstrapBrokerStringPublicSaslScram;

  ///
  /// A string containing one or more DNS names (or IP) and TLS port pairs.
  ///
  final String? bootstrapBrokerStringPublicTls;

  ///
  /// A string that contains one or more DNS names (or IP addresses) and SASL IAM
  /// port pairs.
  ///
  final String? bootstrapBrokerStringSaslIam;

  ///
  /// A string containing one or more DNS names (or IP) and Sasl Scram port pairs.
  ///
  final String? bootstrapBrokerStringSaslScram;

  ///
  /// A string containing one or more DNS names (or IP) and TLS port pairs.
  ///
  final String? bootstrapBrokerStringTls;

  ///
  /// A string containing one or more DNS names (or IP) and SASL/IAM port pairs
  /// for VPC connectivity.
  ///
  final String? bootstrapBrokerStringVpcConnectivitySaslIam;

  ///
  /// A string containing one or more DNS names (or IP) and SASL/SCRAM port pairs
  /// for VPC connectivity.
  ///
  final String? bootstrapBrokerStringVpcConnectivitySaslScram;

  ///
  /// A string containing one or more DNS names (or IP) and TLS port pairs for VPC
  /// connectivity.
  ///
  final String? bootstrapBrokerStringVpcConnectivityTls;

  GetBootstrapBrokersResponse({
    this.bootstrapBrokerString,
    this.bootstrapBrokerStringPublicSaslIam,
    this.bootstrapBrokerStringPublicSaslScram,
    this.bootstrapBrokerStringPublicTls,
    this.bootstrapBrokerStringSaslIam,
    this.bootstrapBrokerStringSaslScram,
    this.bootstrapBrokerStringTls,
    this.bootstrapBrokerStringVpcConnectivitySaslIam,
    this.bootstrapBrokerStringVpcConnectivitySaslScram,
    this.bootstrapBrokerStringVpcConnectivityTls,
  });

  factory GetBootstrapBrokersResponse.fromJson(Map<String, dynamic> json) {
    return GetBootstrapBrokersResponse(
      bootstrapBrokerString: json['bootstrapBrokerString'] as String?,
      bootstrapBrokerStringPublicSaslIam:
          json['bootstrapBrokerStringPublicSaslIam'] as String?,
      bootstrapBrokerStringPublicSaslScram:
          json['bootstrapBrokerStringPublicSaslScram'] as String?,
      bootstrapBrokerStringPublicTls:
          json['bootstrapBrokerStringPublicTls'] as String?,
      bootstrapBrokerStringSaslIam:
          json['bootstrapBrokerStringSaslIam'] as String?,
      bootstrapBrokerStringSaslScram:
          json['bootstrapBrokerStringSaslScram'] as String?,
      bootstrapBrokerStringTls: json['bootstrapBrokerStringTls'] as String?,
      bootstrapBrokerStringVpcConnectivitySaslIam:
          json['bootstrapBrokerStringVpcConnectivitySaslIam'] as String?,
      bootstrapBrokerStringVpcConnectivitySaslScram:
          json['bootstrapBrokerStringVpcConnectivitySaslScram'] as String?,
      bootstrapBrokerStringVpcConnectivityTls:
          json['bootstrapBrokerStringVpcConnectivityTls'] as String?,
    );
  }
}

class GetCompatibleKafkaVersionsResponse {
  ///
  /// A list of CompatibleKafkaVersion objects.
  ///
  final List<CompatibleKafkaVersion>? compatibleKafkaVersions;

  GetCompatibleKafkaVersionsResponse({
    this.compatibleKafkaVersions,
  });

  factory GetCompatibleKafkaVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCompatibleKafkaVersionsResponse(
      compatibleKafkaVersions: (json['compatibleKafkaVersions'] as List?)
          ?.whereNotNull()
          .map(
              (e) => CompatibleKafkaVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetClusterPolicyResponse {
  ///
  /// The version of cluster policy.
  ///
  final String? currentVersion;

  ///
  /// The cluster policy.
  ///
  final String? policy;

  GetClusterPolicyResponse({
    this.currentVersion,
    this.policy,
  });

  factory GetClusterPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetClusterPolicyResponse(
      currentVersion: json['currentVersion'] as String?,
      policy: json['policy'] as String?,
    );
  }
}

class KafkaVersion {
  final KafkaVersionStatus? status;
  final String? version;

  KafkaVersion({
    this.status,
    this.version,
  });

  factory KafkaVersion.fromJson(Map<String, dynamic> json) {
    return KafkaVersion(
      status: (json['status'] as String?)?.toKafkaVersionStatus(),
      version: json['version'] as String?,
    );
  }
}

enum KafkaVersionStatus {
  active,
  deprecated,
}

extension KafkaVersionStatusValueExtension on KafkaVersionStatus {
  String toValue() {
    switch (this) {
      case KafkaVersionStatus.active:
        return 'ACTIVE';
      case KafkaVersionStatus.deprecated:
        return 'DEPRECATED';
    }
  }
}

extension KafkaVersionStatusFromString on String {
  KafkaVersionStatus toKafkaVersionStatus() {
    switch (this) {
      case 'ACTIVE':
        return KafkaVersionStatus.active;
      case 'DEPRECATED':
        return KafkaVersionStatus.deprecated;
    }
    throw Exception('$this is not known in enum KafkaVersionStatus');
  }
}

class ListClusterOperationsResponse {
  ///
  /// An array of cluster operation information objects.
  ///
  final List<ClusterOperationInfo>? clusterOperationInfoList;

  ///
  /// If the response of ListClusterOperations is truncated, it returns a
  /// NextToken in the response. This Nexttoken should be sent in the subsequent
  /// request to ListClusterOperations.
  ///
  final String? nextToken;

  ListClusterOperationsResponse({
    this.clusterOperationInfoList,
    this.nextToken,
  });

  factory ListClusterOperationsResponse.fromJson(Map<String, dynamic> json) {
    return ListClusterOperationsResponse(
      clusterOperationInfoList: (json['clusterOperationInfoList'] as List?)
          ?.whereNotNull()
          .map((e) => ClusterOperationInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListClustersResponse {
  ///
  /// Information on each of the MSK clusters in the response.
  ///
  final List<ClusterInfo>? clusterInfoList;

  ///
  /// The paginated results marker. When the result of a ListClusters operation is
  /// truncated, the call returns NextToken in the response.
  /// To get another batch of clusters, provide this token in your next request.
  ///
  final String? nextToken;

  ListClustersResponse({
    this.clusterInfoList,
    this.nextToken,
  });

  factory ListClustersResponse.fromJson(Map<String, dynamic> json) {
    return ListClustersResponse(
      clusterInfoList: (json['clusterInfoList'] as List?)
          ?.whereNotNull()
          .map((e) => ClusterInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListClustersV2Response {
  ///
  /// Information on each of the MSK clusters in the response.
  ///
  final List<Cluster>? clusterInfoList;

  ///
  /// The paginated results marker. When the result of a ListClusters operation is
  /// truncated, the call returns NextToken in the response.
  /// To get another batch of clusters, provide this token in your next request.
  ///
  final String? nextToken;

  ListClustersV2Response({
    this.clusterInfoList,
    this.nextToken,
  });

  factory ListClustersV2Response.fromJson(Map<String, dynamic> json) {
    return ListClustersV2Response(
      clusterInfoList: (json['clusterInfoList'] as List?)
          ?.whereNotNull()
          .map((e) => Cluster.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListConfigurationRevisionsResponse {
  ///
  /// Paginated results marker.
  ///
  final String? nextToken;

  ///
  /// List of ConfigurationRevision objects.
  ///
  final List<ConfigurationRevision>? revisions;

  ListConfigurationRevisionsResponse({
    this.nextToken,
    this.revisions,
  });

  factory ListConfigurationRevisionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListConfigurationRevisionsResponse(
      nextToken: json['nextToken'] as String?,
      revisions: (json['revisions'] as List?)
          ?.whereNotNull()
          .map((e) => ConfigurationRevision.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListConfigurationsResponse {
  ///
  /// An array of MSK configurations.
  ///
  final List<Configuration>? configurations;

  ///
  /// The paginated results marker. When the result of a ListConfigurations
  /// operation is truncated, the call returns NextToken in the response.
  /// To get another batch of configurations, provide this token in your next
  /// request.
  ///
  final String? nextToken;

  ListConfigurationsResponse({
    this.configurations,
    this.nextToken,
  });

  factory ListConfigurationsResponse.fromJson(Map<String, dynamic> json) {
    return ListConfigurationsResponse(
      configurations: (json['configurations'] as List?)
          ?.whereNotNull()
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListKafkaVersionsResponse {
  final List<KafkaVersion>? kafkaVersions;
  final String? nextToken;

  ListKafkaVersionsResponse({
    this.kafkaVersions,
    this.nextToken,
  });

  factory ListKafkaVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListKafkaVersionsResponse(
      kafkaVersions: (json['kafkaVersions'] as List?)
          ?.whereNotNull()
          .map((e) => KafkaVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListNodesResponse {
  ///
  /// The paginated results marker. When the result of a ListNodes operation is
  /// truncated, the call returns NextToken in the response.
  /// To get another batch of nodes, provide this token in your next request.
  ///
  final String? nextToken;

  ///
  /// List containing a NodeInfo object.
  ///
  final List<NodeInfo>? nodeInfoList;

  ListNodesResponse({
    this.nextToken,
    this.nodeInfoList,
  });

  factory ListNodesResponse.fromJson(Map<String, dynamic> json) {
    return ListNodesResponse(
      nextToken: json['nextToken'] as String?,
      nodeInfoList: (json['nodeInfoList'] as List?)
          ?.whereNotNull()
          .map((e) => NodeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListScramSecretsResponse {
  ///
  /// Paginated results marker.
  ///
  final String? nextToken;

  ///
  /// The list of scram secrets associated with the cluster.
  ///
  final List<String>? secretArnList;

  ListScramSecretsResponse({
    this.nextToken,
    this.secretArnList,
  });

  factory ListScramSecretsResponse.fromJson(Map<String, dynamic> json) {
    return ListScramSecretsResponse(
      nextToken: json['nextToken'] as String?,
      secretArnList: (json['secretArnList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }
}

class ListTagsForResourceResponse {
  ///
  /// The key-value pair for the resource tag.
  ///
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class ListClientVpcConnectionsResponse {
  ///
  /// List of client VPC connections.
  ///
  final List<ClientVpcConnection>? clientVpcConnections;

  ///
  /// The paginated results marker. When the result of a ListClientVpcConnections
  /// operation is truncated, the call returns NextToken in the response.
  /// To get another batch of configurations, provide this token in your next
  /// request.
  ///
  final String? nextToken;

  ListClientVpcConnectionsResponse({
    this.clientVpcConnections,
    this.nextToken,
  });

  factory ListClientVpcConnectionsResponse.fromJson(Map<String, dynamic> json) {
    return ListClientVpcConnectionsResponse(
      clientVpcConnections: (json['clientVpcConnections'] as List?)
          ?.whereNotNull()
          .map((e) => ClientVpcConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListVpcConnectionsResponse {
  ///
  /// The paginated results marker. When the result of a ListClientVpcConnections
  /// operation is truncated, the call returns NextToken in the response.
  /// To get another batch of configurations, provide this token in your next
  /// request.
  ///
  final String? nextToken;

  ///
  /// List of VPC connections.
  ///
  final List<VpcConnection>? vpcConnections;

  ListVpcConnectionsResponse({
    this.nextToken,
    this.vpcConnections,
  });

  factory ListVpcConnectionsResponse.fromJson(Map<String, dynamic> json) {
    return ListVpcConnectionsResponse(
      nextToken: json['nextToken'] as String?,
      vpcConnections: (json['vpcConnections'] as List?)
          ?.whereNotNull()
          .map((e) => VpcConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class RejectClientVpcConnectionResponse {
  RejectClientVpcConnectionResponse();

  factory RejectClientVpcConnectionResponse.fromJson(Map<String, dynamic> _) {
    return RejectClientVpcConnectionResponse();
  }
}

class LoggingInfo {
  final BrokerLogs brokerLogs;

  LoggingInfo({
    required this.brokerLogs,
  });

  factory LoggingInfo.fromJson(Map<String, dynamic> json) {
    return LoggingInfo(
      brokerLogs:
          BrokerLogs.fromJson(json['brokerLogs'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final brokerLogs = this.brokerLogs;
    return {
      'brokerLogs': brokerLogs,
    };
  }
}

///
/// Information about cluster attributes that can be updated via update APIs.
///
class MutableClusterInfo {
  ///
  /// Specifies the size of the EBS volume and the ID of the associated broker.
  ///
  final List<BrokerEBSVolumeInfo>? brokerEBSVolumeInfo;

  ///
  /// Includes all client authentication information.
  ///
  final ClientAuthentication? clientAuthentication;

  ///
  /// Information about the changes in the configuration of the brokers.
  ///
  final ConfigurationInfo? configurationInfo;

  ///
  /// Information about the broker access configuration.
  ///
  final ConnectivityInfo? connectivityInfo;

  ///
  /// Includes all encryption-related information.
  ///
  final EncryptionInfo? encryptionInfo;

  ///
  /// Specifies which Apache Kafka metrics Amazon MSK gathers and sends to Amazon
  /// CloudWatch for this cluster.
  ///
  final EnhancedMonitoring? enhancedMonitoring;

  ///
  /// Information about the Amazon MSK broker type.
  ///
  final String? instanceType;

  ///
  /// The Apache Kafka version.
  ///
  final String? kafkaVersion;

  ///
  /// You can configure your MSK cluster to send broker logs to different
  /// destination types. This is a container for the configuration details related
  /// to broker logs.
  ///
  final LoggingInfo? loggingInfo;

  ///
  /// The number of broker nodes in the cluster.
  ///
  final int? numberOfBrokerNodes;

  ///
  /// The settings for open monitoring.
  ///
  final OpenMonitoring? openMonitoring;

  ///
  /// This controls storage mode for supported storage tiers.
  ///
  final StorageMode? storageMode;

  MutableClusterInfo({
    this.brokerEBSVolumeInfo,
    this.clientAuthentication,
    this.configurationInfo,
    this.connectivityInfo,
    this.encryptionInfo,
    this.enhancedMonitoring,
    this.instanceType,
    this.kafkaVersion,
    this.loggingInfo,
    this.numberOfBrokerNodes,
    this.openMonitoring,
    this.storageMode,
  });

  factory MutableClusterInfo.fromJson(Map<String, dynamic> json) {
    return MutableClusterInfo(
      brokerEBSVolumeInfo: (json['brokerEBSVolumeInfo'] as List?)
          ?.whereNotNull()
          .map((e) => BrokerEBSVolumeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      clientAuthentication: json['clientAuthentication'] != null
          ? ClientAuthentication.fromJson(
              json['clientAuthentication'] as Map<String, dynamic>)
          : null,
      configurationInfo: json['configurationInfo'] != null
          ? ConfigurationInfo.fromJson(
              json['configurationInfo'] as Map<String, dynamic>)
          : null,
      connectivityInfo: json['connectivityInfo'] != null
          ? ConnectivityInfo.fromJson(
              json['connectivityInfo'] as Map<String, dynamic>)
          : null,
      encryptionInfo: json['encryptionInfo'] != null
          ? EncryptionInfo.fromJson(
              json['encryptionInfo'] as Map<String, dynamic>)
          : null,
      enhancedMonitoring:
          (json['enhancedMonitoring'] as String?)?.toEnhancedMonitoring(),
      instanceType: json['instanceType'] as String?,
      kafkaVersion: json['kafkaVersion'] as String?,
      loggingInfo: json['loggingInfo'] != null
          ? LoggingInfo.fromJson(json['loggingInfo'] as Map<String, dynamic>)
          : null,
      numberOfBrokerNodes: json['numberOfBrokerNodes'] as int?,
      openMonitoring: json['openMonitoring'] != null
          ? OpenMonitoring.fromJson(
              json['openMonitoring'] as Map<String, dynamic>)
          : null,
      storageMode: (json['storageMode'] as String?)?.toStorageMode(),
    );
  }
}

///
/// Indicates whether you want to turn on or turn off the Node Exporter.
///
class NodeExporter {
  ///
  /// Indicates whether you want to turn on or turn off the Node Exporter.
  ///
  final bool enabledInBroker;

  NodeExporter({
    required this.enabledInBroker,
  });

  factory NodeExporter.fromJson(Map<String, dynamic> json) {
    return NodeExporter(
      enabledInBroker: json['enabledInBroker'] as bool,
    );
  }
}

///
/// Indicates whether you want to turn on or turn off the Node Exporter.
///
class NodeExporterInfo {
  ///
  /// Indicates whether you want to turn on or turn off the Node Exporter.
  ///
  final bool enabledInBroker;

  NodeExporterInfo({
    required this.enabledInBroker,
  });

  factory NodeExporterInfo.fromJson(Map<String, dynamic> json) {
    return NodeExporterInfo(
      enabledInBroker: json['enabledInBroker'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledInBroker = this.enabledInBroker;
    return {
      'enabledInBroker': enabledInBroker,
    };
  }
}

///
/// Indicates whether you want to turn on or turn off the JMX Exporter.
///
class JmxExporter {
  ///
  /// Indicates whether you want to turn on or turn off the JMX Exporter.
  ///
  final bool enabledInBroker;

  JmxExporter({
    required this.enabledInBroker,
  });

  factory JmxExporter.fromJson(Map<String, dynamic> json) {
    return JmxExporter(
      enabledInBroker: json['enabledInBroker'] as bool,
    );
  }
}

///
/// Indicates whether you want to turn on or turn off the JMX Exporter.
///
class JmxExporterInfo {
  ///
  /// Indicates whether you want to turn on or turn off the JMX Exporter.
  ///
  final bool enabledInBroker;

  JmxExporterInfo({
    required this.enabledInBroker,
  });

  factory JmxExporterInfo.fromJson(Map<String, dynamic> json) {
    return JmxExporterInfo(
      enabledInBroker: json['enabledInBroker'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledInBroker = this.enabledInBroker;
    return {
      'enabledInBroker': enabledInBroker,
    };
  }
}

///
/// JMX and Node monitoring for the MSK cluster.
///
class OpenMonitoring {
  ///
  /// Prometheus settings.
  ///
  final Prometheus prometheus;

  OpenMonitoring({
    required this.prometheus,
  });

  factory OpenMonitoring.fromJson(Map<String, dynamic> json) {
    return OpenMonitoring(
      prometheus:
          Prometheus.fromJson(json['prometheus'] as Map<String, dynamic>),
    );
  }
}

///
/// JMX and Node monitoring for the MSK cluster.
///
class OpenMonitoringInfo {
  ///
  /// Prometheus settings.
  ///
  final PrometheusInfo prometheus;

  OpenMonitoringInfo({
    required this.prometheus,
  });

  factory OpenMonitoringInfo.fromJson(Map<String, dynamic> json) {
    return OpenMonitoringInfo(
      prometheus:
          PrometheusInfo.fromJson(json['prometheus'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final prometheus = this.prometheus;
    return {
      'prometheus': prometheus,
    };
  }
}

///
/// Prometheus settings.
///
class Prometheus {
  ///
  /// Indicates whether you want to turn on or turn off the JMX Exporter.
  ///
  final JmxExporter? jmxExporter;

  ///
  /// Indicates whether you want to turn on or turn off the Node Exporter.
  ///
  final NodeExporter? nodeExporter;

  Prometheus({
    this.jmxExporter,
    this.nodeExporter,
  });

  factory Prometheus.fromJson(Map<String, dynamic> json) {
    return Prometheus(
      jmxExporter: json['jmxExporter'] != null
          ? JmxExporter.fromJson(json['jmxExporter'] as Map<String, dynamic>)
          : null,
      nodeExporter: json['nodeExporter'] != null
          ? NodeExporter.fromJson(json['nodeExporter'] as Map<String, dynamic>)
          : null,
    );
  }
}

///
/// Prometheus settings.
///
class PrometheusInfo {
  ///
  /// Indicates whether you want to turn on or turn off the JMX Exporter.
  ///
  final JmxExporterInfo? jmxExporter;

  ///
  /// Indicates whether you want to turn on or turn off the Node Exporter.
  ///
  final NodeExporterInfo? nodeExporter;

  PrometheusInfo({
    this.jmxExporter,
    this.nodeExporter,
  });

  factory PrometheusInfo.fromJson(Map<String, dynamic> json) {
    return PrometheusInfo(
      jmxExporter: json['jmxExporter'] != null
          ? JmxExporterInfo.fromJson(
              json['jmxExporter'] as Map<String, dynamic>)
          : null,
      nodeExporter: json['nodeExporter'] != null
          ? NodeExporterInfo.fromJson(
              json['nodeExporter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jmxExporter = this.jmxExporter;
    final nodeExporter = this.nodeExporter;
    return {
      if (jmxExporter != null) 'jmxExporter': jmxExporter,
      if (nodeExporter != null) 'nodeExporter': nodeExporter,
    };
  }
}

///
/// Contains information about provisioned throughput for EBS storage volumes
/// attached to kafka broker nodes.
///
class ProvisionedThroughput {
  ///
  /// Provisioned throughput is enabled or not.
  ///
  final bool? enabled;

  ///
  /// Throughput value of the EBS volumes for the data drive on each kafka broker
  /// node in MiB per second.
  ///
  final int? volumeThroughput;

  ProvisionedThroughput({
    this.enabled,
    this.volumeThroughput,
  });

  factory ProvisionedThroughput.fromJson(Map<String, dynamic> json) {
    return ProvisionedThroughput(
      enabled: json['enabled'] as bool?,
      volumeThroughput: json['volumeThroughput'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final volumeThroughput = this.volumeThroughput;
    return {
      if (enabled != null) 'enabled': enabled,
      if (volumeThroughput != null) 'volumeThroughput': volumeThroughput,
    };
  }
}

/// Public access control for brokers.
class PublicAccess {
  ///
  /// The value DISABLED indicates that public access is turned off.
  /// SERVICE_PROVIDED_EIPS indicates that public access is turned on.
  ///
  final String? type;

  PublicAccess({
    this.type,
  });

  factory PublicAccess.fromJson(Map<String, dynamic> json) {
    return PublicAccess(
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'type': type,
    };
  }
}

class PutClusterPolicyResponse {
  ///
  /// The policy version.
  ///
  final String? currentVersion;

  PutClusterPolicyResponse({
    this.currentVersion,
  });

  factory PutClusterPolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutClusterPolicyResponse(
      currentVersion: json['currentVersion'] as String?,
    );
  }
}

class RebootBrokerResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  final String? clusterOperationArn;

  RebootBrokerResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory RebootBrokerResponse.fromJson(Map<String, dynamic> json) {
    return RebootBrokerResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }
}

class S3 {
  final bool enabled;
  final String? bucket;
  final String? prefix;

  S3({
    required this.enabled,
    this.bucket,
    this.prefix,
  });

  factory S3.fromJson(Map<String, dynamic> json) {
    return S3(
      enabled: json['enabled'] as bool,
      bucket: json['bucket'] as String?,
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final bucket = this.bucket;
    final prefix = this.prefix;
    return {
      'enabled': enabled,
      if (bucket != null) 'bucket': bucket,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

///
/// Details for client authentication using SASL.
///
class ServerlessSasl {
  ///
  /// Indicates whether IAM access control is enabled.
  ///
  final Iam? iam;

  ServerlessSasl({
    this.iam,
  });

  factory ServerlessSasl.fromJson(Map<String, dynamic> json) {
    return ServerlessSasl(
      iam: json['iam'] != null
          ? Iam.fromJson(json['iam'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iam = this.iam;
    return {
      if (iam != null) 'iam': iam,
    };
  }
}

///
/// Details for client authentication using SASL.
///
class Sasl {
  ///
  /// Indicates whether IAM access control is enabled.
  ///
  final Iam? iam;

  ///
  /// Details for SASL/SCRAM client authentication.
  ///
  final Scram? scram;

  Sasl({
    this.iam,
    this.scram,
  });

  factory Sasl.fromJson(Map<String, dynamic> json) {
    return Sasl(
      iam: json['iam'] != null
          ? Iam.fromJson(json['iam'] as Map<String, dynamic>)
          : null,
      scram: json['scram'] != null
          ? Scram.fromJson(json['scram'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iam = this.iam;
    final scram = this.scram;
    return {
      if (iam != null) 'iam': iam,
      if (scram != null) 'scram': scram,
    };
  }
}

///
/// Details for SASL client authentication for VPC connectivity.
///
class VpcConnectivitySasl {
  ///
  /// Details for SASL/IAM client authentication for VPC connectivity.
  ///
  final VpcConnectivityIam? iam;

  ///
  /// Details for SASL/SCRAM client authentication for VPC connectivity.
  ///
  final VpcConnectivityScram? scram;

  VpcConnectivitySasl({
    this.iam,
    this.scram,
  });

  factory VpcConnectivitySasl.fromJson(Map<String, dynamic> json) {
    return VpcConnectivitySasl(
      iam: json['iam'] != null
          ? VpcConnectivityIam.fromJson(json['iam'] as Map<String, dynamic>)
          : null,
      scram: json['scram'] != null
          ? VpcConnectivityScram.fromJson(json['scram'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iam = this.iam;
    final scram = this.scram;
    return {
      if (iam != null) 'iam': iam,
      if (scram != null) 'scram': scram,
    };
  }
}

///
/// Details for SASL/SCRAM client authentication.
///
class Scram {
  ///
  /// SASL/SCRAM authentication is enabled or not.
  ///
  final bool? enabled;

  Scram({
    this.enabled,
  });

  factory Scram.fromJson(Map<String, dynamic> json) {
    return Scram(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

///
/// Details for SASL/SCRAM client authentication for VPC connectivity.
///
class VpcConnectivityScram {
  ///
  /// SASL/SCRAM authentication is on or off for VPC connectivity.
  ///
  final bool? enabled;

  VpcConnectivityScram({
    this.enabled,
  });

  factory VpcConnectivityScram.fromJson(Map<String, dynamic> json) {
    return VpcConnectivityScram(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

///
/// Details for IAM access control.
///
class Iam {
  ///
  /// Indicates whether IAM access control is enabled.
  ///
  final bool? enabled;

  Iam({
    this.enabled,
  });

  factory Iam.fromJson(Map<String, dynamic> json) {
    return Iam(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

///
/// Details for IAM access control for VPC connectivity.
///
class VpcConnectivityIam {
  ///
  /// SASL/IAM authentication is on or off for VPC connectivity.
  ///
  final bool? enabled;

  VpcConnectivityIam({
    this.enabled,
  });

  factory VpcConnectivityIam.fromJson(Map<String, dynamic> json) {
    return VpcConnectivityIam(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

///
/// The node information object.
///
class NodeInfo {
  ///
  /// The start time.
  ///
  final String? addedToClusterTime;

  ///
  /// The broker node info.
  ///
  final BrokerNodeInfo? brokerNodeInfo;

  ///
  /// The instance type.
  ///
  final String? instanceType;

  ///
  /// The Amazon Resource Name (ARN) of the node.
  ///
  final String? nodeARN;

  ///
  /// The node type.
  ///
  final NodeType? nodeType;

  ///
  /// The ZookeeperNodeInfo.
  ///
  final ZookeeperNodeInfo? zookeeperNodeInfo;

  NodeInfo({
    this.addedToClusterTime,
    this.brokerNodeInfo,
    this.instanceType,
    this.nodeARN,
    this.nodeType,
    this.zookeeperNodeInfo,
  });

  factory NodeInfo.fromJson(Map<String, dynamic> json) {
    return NodeInfo(
      addedToClusterTime: json['addedToClusterTime'] as String?,
      brokerNodeInfo: json['brokerNodeInfo'] != null
          ? BrokerNodeInfo.fromJson(
              json['brokerNodeInfo'] as Map<String, dynamic>)
          : null,
      instanceType: json['instanceType'] as String?,
      nodeARN: json['nodeARN'] as String?,
      nodeType: (json['nodeType'] as String?)?.toNodeType(),
      zookeeperNodeInfo: json['zookeeperNodeInfo'] != null
          ? ZookeeperNodeInfo.fromJson(
              json['zookeeperNodeInfo'] as Map<String, dynamic>)
          : null,
    );
  }
}

///
/// The broker or Zookeeper node.
///
enum NodeType {
  broker,
}

extension NodeTypeValueExtension on NodeType {
  String toValue() {
    switch (this) {
      case NodeType.broker:
        return 'BROKER';
    }
  }
}

extension NodeTypeFromString on String {
  NodeType toNodeType() {
    switch (this) {
      case 'BROKER':
        return NodeType.broker;
    }
    throw Exception('$this is not known in enum NodeType');
  }
}

class StateInfo {
  final String? code;
  final String? message;

  StateInfo({
    this.code,
    this.message,
  });

  factory StateInfo.fromJson(Map<String, dynamic> json) {
    return StateInfo(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );
  }
}

///
/// Contains information about storage volumes attached to MSK broker nodes.
///
class StorageInfo {
  ///
  /// EBS volume information.
  ///
  final EBSStorageInfo? ebsStorageInfo;

  StorageInfo({
    this.ebsStorageInfo,
  });

  factory StorageInfo.fromJson(Map<String, dynamic> json) {
    return StorageInfo(
      ebsStorageInfo: json['ebsStorageInfo'] != null
          ? EBSStorageInfo.fromJson(
              json['ebsStorageInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ebsStorageInfo = this.ebsStorageInfo;
    return {
      if (ebsStorageInfo != null) 'ebsStorageInfo': ebsStorageInfo,
    };
  }
}

/// Controls storage mode for various supported storage tiers.
enum StorageMode {
  local,
  tiered,
}

extension StorageModeValueExtension on StorageMode {
  String toValue() {
    switch (this) {
      case StorageMode.local:
        return 'LOCAL';
      case StorageMode.tiered:
        return 'TIERED';
    }
  }
}

extension StorageModeFromString on String {
  StorageMode toStorageMode() {
    switch (this) {
      case 'LOCAL':
        return StorageMode.local;
      case 'TIERED':
        return StorageMode.tiered;
    }
    throw Exception('$this is not known in enum StorageMode');
  }
}

///
/// Details for client authentication using TLS.
///
class Tls {
  ///
  /// List of ACM Certificate Authority ARNs.
  ///
  final List<String>? certificateAuthorityArnList;

  ///
  /// Specifies whether you want to turn on or turn off TLS authentication.
  ///
  final bool? enabled;

  Tls({
    this.certificateAuthorityArnList,
    this.enabled,
  });

  factory Tls.fromJson(Map<String, dynamic> json) {
    return Tls(
      certificateAuthorityArnList:
          (json['certificateAuthorityArnList'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAuthorityArnList = this.certificateAuthorityArnList;
    final enabled = this.enabled;
    return {
      if (certificateAuthorityArnList != null)
        'certificateAuthorityArnList': certificateAuthorityArnList,
      if (enabled != null) 'enabled': enabled,
    };
  }
}

///
/// Details for TLS client authentication for VPC connectivity.
///
class VpcConnectivityTls {
  ///
  /// TLS authentication is on or off for VPC connectivity.
  ///
  final bool? enabled;

  VpcConnectivityTls({
    this.enabled,
  });

  factory VpcConnectivityTls.fromJson(Map<String, dynamic> json) {
    return VpcConnectivityTls(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

class Unauthenticated {
  ///
  /// Specifies whether you want to turn on or turn off unauthenticated traffic to
  /// your cluster.
  ///
  final bool? enabled;

  Unauthenticated({
    this.enabled,
  });

  factory Unauthenticated.fromJson(Map<String, dynamic> json) {
    return Unauthenticated(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

///
/// Error info for scram secret associate/disassociate failure.
///
class UnprocessedScramSecret {
  ///
  /// Error code for associate/disassociate failure.
  ///
  final String? errorCode;

  ///
  /// Error message for associate/disassociate failure.
  ///
  final String? errorMessage;

  ///
  /// AWS Secrets Manager secret ARN.
  ///
  final String? secretArn;

  UnprocessedScramSecret({
    this.errorCode,
    this.errorMessage,
    this.secretArn,
  });

  factory UnprocessedScramSecret.fromJson(Map<String, dynamic> json) {
    return UnprocessedScramSecret(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      secretArn: json['secretArn'] as String?,
    );
  }
}

class UpdateBrokerCountResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  final String? clusterOperationArn;

  UpdateBrokerCountResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateBrokerCountResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBrokerCountResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }
}

class UpdateBrokerTypeResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  final String? clusterOperationArn;

  UpdateBrokerTypeResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateBrokerTypeResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBrokerTypeResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }
}

class UpdateBrokerStorageResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  final String? clusterOperationArn;

  UpdateBrokerStorageResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateBrokerStorageResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBrokerStorageResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }
}

class UpdateClusterConfigurationResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  final String? clusterOperationArn;

  UpdateClusterConfigurationResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateClusterConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateClusterConfigurationResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }
}

class UpdateClusterKafkaVersionResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  final String? clusterOperationArn;

  UpdateClusterKafkaVersionResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateClusterKafkaVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateClusterKafkaVersionResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }
}

class UpdateMonitoringResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  final String? clusterOperationArn;

  UpdateMonitoringResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateMonitoringResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMonitoringResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }
}

class UpdateSecurityResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  final String? clusterOperationArn;

  UpdateSecurityResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateSecurityResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSecurityResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }
}

class UpdateStorageResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  final String? clusterOperationArn;

  UpdateStorageResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateStorageResponse.fromJson(Map<String, dynamic> json) {
    return UpdateStorageResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }
}

class UpdateConfigurationResponse {
  ///
  /// The Amazon Resource Name (ARN) of the configuration.
  ///
  final String? arn;

  ///
  /// Latest revision of the configuration.
  ///
  final ConfigurationRevision? latestRevision;

  UpdateConfigurationResponse({
    this.arn,
    this.latestRevision,
  });

  factory UpdateConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateConfigurationResponse(
      arn: json['arn'] as String?,
      latestRevision: json['latestRevision'] != null
          ? ConfigurationRevision.fromJson(
              json['latestRevision'] as Map<String, dynamic>)
          : null,
    );
  }
}

class UpdateConnectivityResponse {
  ///
  /// The Amazon Resource Name (ARN) of the cluster.
  ///
  final String? clusterArn;

  ///
  /// The Amazon Resource Name (ARN) of the cluster operation.
  ///
  final String? clusterOperationArn;

  UpdateConnectivityResponse({
    this.clusterArn,
    this.clusterOperationArn,
  });

  factory UpdateConnectivityResponse.fromJson(Map<String, dynamic> json) {
    return UpdateConnectivityResponse(
      clusterArn: json['clusterArn'] as String?,
      clusterOperationArn: json['clusterOperationArn'] as String?,
    );
  }
}

///
/// Description of the requester that calls the API operation.
///
class UserIdentity {
  ///
  /// A unique identifier for the requester that calls the API operation.
  ///
  final String? principalId;

  ///
  /// The identity type of the requester that calls the API operation.
  ///
  final UserIdentityType? type;

  UserIdentity({
    this.principalId,
    this.type,
  });

  factory UserIdentity.fromJson(Map<String, dynamic> json) {
    return UserIdentity(
      principalId: json['principalId'] as String?,
      type: (json['type'] as String?)?.toUserIdentityType(),
    );
  }
}

///
/// The identity type of the requester that calls the API operation.
///
enum UserIdentityType {
  awsaccount,
  awsservice,
}

extension UserIdentityTypeValueExtension on UserIdentityType {
  String toValue() {
    switch (this) {
      case UserIdentityType.awsaccount:
        return 'AWSACCOUNT';
      case UserIdentityType.awsservice:
        return 'AWSSERVICE';
    }
  }
}

extension UserIdentityTypeFromString on String {
  UserIdentityType toUserIdentityType() {
    switch (this) {
      case 'AWSACCOUNT':
        return UserIdentityType.awsaccount;
      case 'AWSSERVICE':
        return UserIdentityType.awsservice;
    }
    throw Exception('$this is not known in enum UserIdentityType');
  }
}

///
/// Description of the VPC connection.
///
class VpcConnectionInfo {
  ///
  /// The time when Amazon MSK creates the VPC Connnection.
  ///
  final DateTime? creationTime;

  ///
  /// The owner of the VPC Connection.
  ///
  final String? owner;

  ///
  /// Description of the requester that calls the API operation.
  ///
  final UserIdentity? userIdentity;

  ///
  /// The Amazon Resource Name (ARN) of the VPC connection.
  ///
  final String? vpcConnectionArn;

  VpcConnectionInfo({
    this.creationTime,
    this.owner,
    this.userIdentity,
    this.vpcConnectionArn,
  });

  factory VpcConnectionInfo.fromJson(Map<String, dynamic> json) {
    return VpcConnectionInfo(
      creationTime: timeStampFromJson(json['creationTime']),
      owner: json['owner'] as String?,
      userIdentity: json['userIdentity'] != null
          ? UserIdentity.fromJson(json['userIdentity'] as Map<String, dynamic>)
          : null,
      vpcConnectionArn: json['vpcConnectionArn'] as String?,
    );
  }
}

///
/// The state of a VPC connection.
///
enum VpcConnectionState {
  creating,
  available,
  inactive,
  deactivating,
  deleting,
  failed,
  rejected,
  rejecting,
}

extension VpcConnectionStateValueExtension on VpcConnectionState {
  String toValue() {
    switch (this) {
      case VpcConnectionState.creating:
        return 'CREATING';
      case VpcConnectionState.available:
        return 'AVAILABLE';
      case VpcConnectionState.inactive:
        return 'INACTIVE';
      case VpcConnectionState.deactivating:
        return 'DEACTIVATING';
      case VpcConnectionState.deleting:
        return 'DELETING';
      case VpcConnectionState.failed:
        return 'FAILED';
      case VpcConnectionState.rejected:
        return 'REJECTED';
      case VpcConnectionState.rejecting:
        return 'REJECTING';
    }
  }
}

extension VpcConnectionStateFromString on String {
  VpcConnectionState toVpcConnectionState() {
    switch (this) {
      case 'CREATING':
        return VpcConnectionState.creating;
      case 'AVAILABLE':
        return VpcConnectionState.available;
      case 'INACTIVE':
        return VpcConnectionState.inactive;
      case 'DEACTIVATING':
        return VpcConnectionState.deactivating;
      case 'DELETING':
        return VpcConnectionState.deleting;
      case 'FAILED':
        return VpcConnectionState.failed;
      case 'REJECTED':
        return VpcConnectionState.rejected;
      case 'REJECTING':
        return VpcConnectionState.rejecting;
    }
    throw Exception('$this is not known in enum VpcConnectionState');
  }
}

/// VPC connectivity access control for brokers.
class VpcConnectivity {
  ///
  /// Includes all client authentication information for VPC connectivity.
  ///
  final VpcConnectivityClientAuthentication? clientAuthentication;

  VpcConnectivity({
    this.clientAuthentication,
  });

  factory VpcConnectivity.fromJson(Map<String, dynamic> json) {
    return VpcConnectivity(
      clientAuthentication: json['clientAuthentication'] != null
          ? VpcConnectivityClientAuthentication.fromJson(
              json['clientAuthentication'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientAuthentication = this.clientAuthentication;
    return {
      if (clientAuthentication != null)
        'clientAuthentication': clientAuthentication,
    };
  }
}

///
/// Zookeeper node information.
///
class ZookeeperNodeInfo {
  ///
  /// The attached elastic network interface of the broker.
  ///
  final String? attachedENIId;

  ///
  /// The virtual private cloud (VPC) IP address of the client.
  ///
  final String? clientVpcIpAddress;

  ///
  /// Endpoints for accessing the ZooKeeper.
  ///
  final List<String>? endpoints;

  ///
  /// The role-specific ID for Zookeeper.
  ///
  final double? zookeeperId;

  ///
  /// The version of Zookeeper.
  ///
  final String? zookeeperVersion;

  ZookeeperNodeInfo({
    this.attachedENIId,
    this.clientVpcIpAddress,
    this.endpoints,
    this.zookeeperId,
    this.zookeeperVersion,
  });

  factory ZookeeperNodeInfo.fromJson(Map<String, dynamic> json) {
    return ZookeeperNodeInfo(
      attachedENIId: json['attachedENIId'] as String?,
      clientVpcIpAddress: json['clientVpcIpAddress'] as String?,
      endpoints: (json['endpoints'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      zookeeperId: json['zookeeperId'] as double?,
      zookeeperVersion: json['zookeeperVersion'] as String?,
    );
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
