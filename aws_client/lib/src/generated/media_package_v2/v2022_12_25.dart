// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export '../../shared/shared.dart' show AwsClientCredentials;

/// <note>
/// This guide is intended for creating AWS Elemental MediaPackage resources in
/// MediaPackage Version 2 (v2) starting from May 2023. To get started with
/// MediaPackage v2, create your MediaPackage resources. There isn't an
/// automated process to migrate your resources from MediaPackage v1 to
/// MediaPackage v2.
///
/// The names of the entities that you use to access this API, like URLs and
/// ARNs, all have the versioning information added, like "v2", to distinguish
/// from the prior version. If you used MediaPackage prior to this release, you
/// can't use the MediaPackage v2 CLI or the MediaPackage v2 API to access any
/// MediaPackage v1 resources.
///
/// If you created resources in MediaPackage v1, use video on demand (VOD)
/// workflows, and aren't looking to migrate to MediaPackage v2 yet, see the <a
/// href="https://docs.aws.amazon.com/mediapackage/latest/apireference/what-is.html">MediaPackage
/// v1 Live API Reference</a>.
/// </note>
/// This is the AWS Elemental MediaPackage v2 Live REST API Reference. It
/// describes all the MediaPackage API operations for live content in detail,
/// and provides sample requests, responses, and errors for the supported web
/// services protocols.
///
/// We assume that you have the IAM permissions that you need to use
/// MediaPackage via the REST API. We also assume that you are familiar with the
/// features and operations of MediaPackage, as described in the AWS Elemental
/// MediaPackage User Guide.
class Mediapackagev2 {
  final _s.RestJsonProtocol _protocol;
  Mediapackagev2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mediapackagev2',
            signingName: 'mediapackagev2',
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

  /// Create a channel to start receiving content streams. The channel
  /// represents the input to MediaPackage for incoming live content from an
  /// encoder such as AWS Elemental MediaLive. The channel receives content, and
  /// after packaging it, outputs it through an origin endpoint to downstream
  /// devices (such as video players or CDNs) that request the content. You can
  /// create only one channel with each request. We recommend that you spread
  /// out channels between channel groups, such as putting redundant channels in
  /// the same AWS Region in different channel groups.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group. You can't change the name after you create the channel.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
  ///
  /// Parameter [description] :
  /// Enter any descriptive text that helps you to identify the channel.
  ///
  /// Parameter [tags] :
  /// A comma-separated list of tag key:value pairs that you define. For
  /// example:
  ///
  /// <code>"Key1": "Value1",</code>
  ///
  /// <code>"Key2": "Value2"</code>
  Future<CreateChannelResponse> createChannel({
    required String channelGroupName,
    required String channelName,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'x-amzn-client-token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'ChannelName': channelName,
      if (description != null) 'Description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelResponse.fromJson(response);
  }

  /// Create a channel group to group your channels and origin endpoints. A
  /// channel group is the top-level resource that consists of channels and
  /// origin endpoints that are associated with it and that provides predictable
  /// URLs for stream delivery. All channels and origin endpoints within the
  /// channel group are guaranteed to share the DNS. You can create only one
  /// channel group with each request.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region. You can't use spaces in the name. You can't change the
  /// name after you create the channel group.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
  ///
  /// Parameter [description] :
  /// Enter any descriptive text that helps you to identify the channel group.
  ///
  /// Parameter [tags] :
  /// A comma-separated list of tag key:value pairs that you define. For
  /// example:
  ///
  /// <code>"Key1": "Value1",</code>
  ///
  /// <code>"Key2": "Value2"</code>
  Future<CreateChannelGroupResponse> createChannelGroup({
    required String channelGroupName,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'x-amzn-client-token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'ChannelGroupName': channelGroupName,
      if (description != null) 'Description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channelGroup',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelGroupResponse.fromJson(response);
  }

  /// The endpoint is attached to a channel, and represents the output of the
  /// live content. You can associate multiple endpoints to a single channel.
  /// Each endpoint gives players and downstream CDNs (such as Amazon
  /// CloudFront) access to the content for playback. Content can't be served
  /// from a channel until it has an endpoint. You can create only one endpoint
  /// with each request.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [containerType] :
  /// The type of container to attach to this origin endpoint. A container type
  /// is a file format that encapsulates one or more media streams, such as
  /// audio and video, into a single file. You can't change the container type
  /// after you create the endpoint.
  ///
  /// Parameter [originEndpointName] :
  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and must be unique for your account in
  /// the AWS Region and channel. You can't use spaces in the name. You can't
  /// change the name after you create the endpoint.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
  ///
  /// Parameter [description] :
  /// Enter any descriptive text that helps you to identify the origin endpoint.
  ///
  /// Parameter [hlsManifests] :
  /// An HTTP live streaming (HLS) manifest configuration.
  ///
  /// Parameter [lowLatencyHlsManifests] :
  /// A low-latency HLS manifest configuration.
  ///
  /// Parameter [segment] :
  /// The segment configuration, including the segment name, duration, and other
  /// configuration values.
  ///
  /// Parameter [startoverWindowSeconds] :
  /// The size of the window (in seconds) to create a window of the live stream
  /// that's available for on-demand viewing. Viewers can start-over or catch-up
  /// on content that falls within the window. The maximum startover window is
  /// 1,209,600 seconds (14 days).
  ///
  /// Parameter [tags] :
  /// A comma-separated list of tag key:value pairs that you define. For
  /// example:
  ///
  /// <code>"Key1": "Value1",</code>
  ///
  /// <code>"Key2": "Value2"</code>
  Future<CreateOriginEndpointResponse> createOriginEndpoint({
    required String channelGroupName,
    required String channelName,
    required ContainerType containerType,
    required String originEndpointName,
    String? clientToken,
    String? description,
    List<CreateHlsManifestConfiguration>? hlsManifests,
    List<CreateLowLatencyHlsManifestConfiguration>? lowLatencyHlsManifests,
    Segment? segment,
    int? startoverWindowSeconds,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'startoverWindowSeconds',
      startoverWindowSeconds,
      60,
      1209600,
    );
    final headers = <String, String>{
      if (clientToken != null) 'x-amzn-client-token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'ContainerType': containerType.toValue(),
      'OriginEndpointName': originEndpointName,
      if (description != null) 'Description': description,
      if (hlsManifests != null) 'HlsManifests': hlsManifests,
      if (lowLatencyHlsManifests != null)
        'LowLatencyHlsManifests': lowLatencyHlsManifests,
      if (segment != null) 'Segment': segment,
      if (startoverWindowSeconds != null)
        'StartoverWindowSeconds': startoverWindowSeconds,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel/${Uri.encodeQueryComponent(channelName).replaceAll('+', '%20')}/originEndpoint',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateOriginEndpointResponse.fromJson(response);
  }

  /// Delete a channel to stop AWS Elemental MediaPackage from receiving further
  /// content. You must delete the channel's origin endpoints before you can
  /// delete the channel.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  Future<void> deleteChannel({
    required String channelGroupName,
    required String channelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel/${Uri.encodeQueryComponent(channelName).replaceAll('+', '%20')}/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a channel group. You must delete the channel group's channels and
  /// origin endpoints before you can delete the channel group. If you delete a
  /// channel group, you'll lose access to the egress domain and will have to
  /// create a new channel group to replace it.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  Future<void> deleteChannelGroup({
    required String channelGroupName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a channel policy.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  Future<void> deleteChannelPolicy({
    required String channelGroupName,
    required String channelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel/${Uri.encodeQueryComponent(channelName).replaceAll('+', '%20')}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Origin endpoints can serve content until they're deleted. Delete the
  /// endpoint if it should no longer respond to playback requests. You must
  /// delete all endpoints from a channel before you can delete the channel.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [originEndpointName] :
  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your
  /// account in the AWS Region and channel.
  Future<void> deleteOriginEndpoint({
    required String channelGroupName,
    required String channelName,
    required String originEndpointName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel/${Uri.encodeQueryComponent(channelName).replaceAll('+', '%20')}/originEndpoint/${Uri.encodeQueryComponent(originEndpointName).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete an origin endpoint policy.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [originEndpointName] :
  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your
  /// account in the AWS Region and channel.
  Future<void> deleteOriginEndpointPolicy({
    required String channelGroupName,
    required String channelName,
    required String originEndpointName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel/${Uri.encodeQueryComponent(channelName).replaceAll('+', '%20')}/originEndpoint/${Uri.encodeQueryComponent(originEndpointName).replaceAll('+', '%20')}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the specified channel that's configured in AWS Elemental
  /// MediaPackage, including the origin endpoints that are associated with it.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  Future<GetChannelResponse> getChannel({
    required String channelGroupName,
    required String channelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel/${Uri.encodeQueryComponent(channelName).replaceAll('+', '%20')}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetChannelResponse.fromJson(response);
  }

  /// Retrieves the specified channel group that's configured in AWS Elemental
  /// MediaPackage, including the channels and origin endpoints that are
  /// associated with it.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  Future<GetChannelGroupResponse> getChannelGroup({
    required String channelGroupName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetChannelGroupResponse.fromJson(response);
  }

  /// Retrieves the specified channel policy that's configured in AWS Elemental
  /// MediaPackage. With policies, you can specify who has access to AWS
  /// resources and what actions they can perform on those resources.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  Future<GetChannelPolicyResponse> getChannelPolicy({
    required String channelGroupName,
    required String channelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel/${Uri.encodeQueryComponent(channelName).replaceAll('+', '%20')}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetChannelPolicyResponse.fromJson(response);
  }

  /// Retrieves the specified origin endpoint that's configured in AWS Elemental
  /// MediaPackage to obtain its playback URL and to view the packaging settings
  /// that it's currently using.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [originEndpointName] :
  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your
  /// account in the AWS Region and channel.
  Future<GetOriginEndpointResponse> getOriginEndpoint({
    required String channelGroupName,
    required String channelName,
    required String originEndpointName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel/${Uri.encodeQueryComponent(channelName).replaceAll('+', '%20')}/originEndpoint/${Uri.encodeQueryComponent(originEndpointName).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetOriginEndpointResponse.fromJson(response);
  }

  /// Retrieves the specified origin endpoint policy that's configured in AWS
  /// Elemental MediaPackage.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [originEndpointName] :
  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your
  /// account in the AWS Region and channel.
  Future<GetOriginEndpointPolicyResponse> getOriginEndpointPolicy({
    required String channelGroupName,
    required String channelName,
    required String originEndpointName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel/${Uri.encodeQueryComponent(channelName).replaceAll('+', '%20')}/originEndpoint/${Uri.encodeQueryComponent(originEndpointName).replaceAll('+', '%20')}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetOriginEndpointPolicyResponse.fromJson(response);
  }

  /// Retrieves all channel groups that are configured in AWS Elemental
  /// MediaPackage, including the channels and origin endpoints that are
  /// associated with it.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the GET list request. Use the token to fetch the
  /// next page of results.
  Future<ListChannelGroupsResponse> listChannelGroups({
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
      requestUri: '/channelGroup',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelGroupsResponse.fromJson(response);
  }

  /// Retrieves all channels in a specific channel group that are configured in
  /// AWS Elemental MediaPackage, including the origin endpoints that are
  /// associated with it.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the GET list request. Use the token to fetch the
  /// next page of results.
  Future<ListChannelsResponse> listChannels({
    required String channelGroupName,
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
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelsResponse.fromJson(response);
  }

  /// Retrieves all origin endpoints in a specific channel that are configured
  /// in AWS Elemental MediaPackage.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the GET list request. Use the token to fetch the
  /// next page of results.
  Future<ListOriginEndpointsResponse> listOriginEndpoints({
    required String channelGroupName,
    required String channelName,
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
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel/${Uri.encodeQueryComponent(channelName).replaceAll('+', '%20')}/originEndpoint',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOriginEndpointsResponse.fromJson(response);
  }

  /// Lists the tags assigned to a resource.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the CloudWatch resource that you want to view tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/tags/${Uri.encodeQueryComponent(resourceArn).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Attaches an IAM policy to the specified channel. With policies, you can
  /// specify who has access to AWS resources and what actions they can perform
  /// on those resources. You can attach only one policy with each request.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [policy] :
  /// The policy to attach to the specified channel.
  Future<void> putChannelPolicy({
    required String channelGroupName,
    required String channelName,
    required String policy,
  }) async {
    final $payload = <String, dynamic>{
      'Policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel/${Uri.encodeQueryComponent(channelName).replaceAll('+', '%20')}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Attaches an IAM policy to the specified origin endpoint. You can attach
  /// only one policy with each request.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [originEndpointName] :
  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your
  /// account in the AWS Region and channel.
  ///
  /// Parameter [policy] :
  /// The policy to attach to the specified origin endpoint.
  Future<void> putOriginEndpointPolicy({
    required String channelGroupName,
    required String channelName,
    required String originEndpointName,
    required String policy,
  }) async {
    final $payload = <String, dynamic>{
      'Policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel/${Uri.encodeQueryComponent(channelName).replaceAll('+', '%20')}/originEndpoint/${Uri.encodeQueryComponent(originEndpointName).replaceAll('+', '%20')}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns one of more tags (key-value pairs) to the specified MediaPackage
  /// resource.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions, by granting a user permission to access or
  /// change only resources with certain tag values. You can use the TagResource
  /// operation with a resource that already has tags. If you specify a new tag
  /// key for the resource, this tag is appended to the list of tags associated
  /// with the resource. If you specify a tag key that is already associated
  /// with the resource, the new tag value that you specify replaces the
  /// previous value for that tag.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the MediaPackage resource that you're adding tags to.
  ///
  /// Parameter [tags] :
  /// Contains a map of the key-value pairs for the resource tag or tags
  /// assigned to the resource.
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
          '/tags/${Uri.encodeQueryComponent(resourceArn).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from the specified resource.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the MediaPackage resource that you're removing tags from.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
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
          '/tags/${Uri.encodeQueryComponent(resourceArn).replaceAll('+', '%20')}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update the specified channel. You can edit if MediaPackage sends ingest or
  /// egress access logs to the CloudWatch log group, if content will be
  /// encrypted, the description on a channel, and your channel's policy
  /// settings. You can't edit the name of the channel or CloudFront
  /// distribution details.
  ///
  /// Any edits you make that impact the video output may not be reflected for a
  /// few minutes.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [description] :
  /// Any descriptive information that you want to add to the channel for future
  /// identification purposes.
  Future<UpdateChannelResponse> updateChannel({
    required String channelGroupName,
    required String channelName,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel/${Uri.encodeQueryComponent(channelName).replaceAll('+', '%20')}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChannelResponse.fromJson(response);
  }

  /// Update the specified channel group. You can edit the description on a
  /// channel group for easier identification later from the AWS Elemental
  /// MediaPackage console. You can't edit the name of the channel group.
  ///
  /// Any edits you make that impact the video output may not be reflected for a
  /// few minutes.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [description] :
  /// Any descriptive information that you want to add to the channel group for
  /// future identification purposes.
  Future<UpdateChannelGroupResponse> updateChannelGroup({
    required String channelGroupName,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChannelGroupResponse.fromJson(response);
  }

  /// Update the specified origin endpoint. Edit the packaging preferences on an
  /// endpoint to optimize the viewing experience. You can't edit the name of
  /// the endpoint.
  ///
  /// Any edits you make that impact the video output may not be reflected for a
  /// few minutes.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [containerType] :
  /// The type of container attached to this origin endpoint. A container type
  /// is a file format that encapsulates one or more media streams, such as
  /// audio and video, into a single file.
  ///
  /// Parameter [originEndpointName] :
  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your
  /// account in the AWS Region and channel.
  ///
  /// Parameter [description] :
  /// Any descriptive information that you want to add to the origin endpoint
  /// for future identification purposes.
  ///
  /// Parameter [hlsManifests] :
  /// An HTTP live streaming (HLS) manifest configuration.
  ///
  /// Parameter [lowLatencyHlsManifests] :
  /// A low-latency HLS manifest configuration.
  ///
  /// Parameter [segment] :
  /// The segment configuration, including the segment name, duration, and other
  /// configuration values.
  ///
  /// Parameter [startoverWindowSeconds] :
  /// The size of the window (in seconds) to create a window of the live stream
  /// that's available for on-demand viewing. Viewers can start-over or catch-up
  /// on content that falls within the window. The maximum startover window is
  /// 1,209,600 seconds (14 days).
  Future<UpdateOriginEndpointResponse> updateOriginEndpoint({
    required String channelGroupName,
    required String channelName,
    required ContainerType containerType,
    required String originEndpointName,
    String? description,
    List<CreateHlsManifestConfiguration>? hlsManifests,
    List<CreateLowLatencyHlsManifestConfiguration>? lowLatencyHlsManifests,
    Segment? segment,
    int? startoverWindowSeconds,
  }) async {
    _s.validateNumRange(
      'startoverWindowSeconds',
      startoverWindowSeconds,
      60,
      1209600,
    );
    final $payload = <String, dynamic>{
      'ContainerType': containerType.toValue(),
      if (description != null) 'Description': description,
      if (hlsManifests != null) 'HlsManifests': hlsManifests,
      if (lowLatencyHlsManifests != null)
        'LowLatencyHlsManifests': lowLatencyHlsManifests,
      if (segment != null) 'Segment': segment,
      if (startoverWindowSeconds != null)
        'StartoverWindowSeconds': startoverWindowSeconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/channelGroup/${Uri.encodeQueryComponent(channelGroupName).replaceAll('+', '%20')}/channel/${Uri.encodeQueryComponent(channelName).replaceAll('+', '%20')}/originEndpoint/${Uri.encodeQueryComponent(originEndpointName).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateOriginEndpointResponse.fromJson(response);
  }
}

enum AdMarkerHls {
  daterange,
}

extension AdMarkerHlsValueExtension on AdMarkerHls {
  String toValue() {
    switch (this) {
      case AdMarkerHls.daterange:
        return 'DATERANGE';
    }
  }
}

extension AdMarkerHlsFromString on String {
  AdMarkerHls toAdMarkerHls() {
    switch (this) {
      case 'DATERANGE':
        return AdMarkerHls.daterange;
    }
    throw Exception('$this is not known in enum AdMarkerHls');
  }
}

/// The configuration of the channel group.
class ChannelGroupListConfiguration {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The date and time the channel group was created.
  final DateTime createdAt;

  /// The date and time the channel group was modified.
  final DateTime modifiedAt;

  /// Any descriptive information that you want to add to the channel group for
  /// future identification purposes.
  final String? description;

  ChannelGroupListConfiguration({
    required this.arn,
    required this.channelGroupName,
    required this.createdAt,
    required this.modifiedAt,
    this.description,
  });

  factory ChannelGroupListConfiguration.fromJson(Map<String, dynamic> json) {
    return ChannelGroupListConfiguration(
      arn: json['Arn'] as String,
      channelGroupName: json['ChannelGroupName'] as String,
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] as Object),
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
    };
  }
}

/// The configuration of the channel.
class ChannelListConfiguration {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The date and time the channel was created.
  final DateTime createdAt;

  /// The date and time the channel was modified.
  final DateTime modifiedAt;

  /// Any descriptive information that you want to add to the channel for future
  /// identification purposes.
  final String? description;

  ChannelListConfiguration({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.createdAt,
    required this.modifiedAt,
    this.description,
  });

  factory ChannelListConfiguration.fromJson(Map<String, dynamic> json) {
    return ChannelListConfiguration(
      arn: json['Arn'] as String,
      channelGroupName: json['ChannelGroupName'] as String,
      channelName: json['ChannelName'] as String,
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] as Object),
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
    };
  }
}

enum CmafEncryptionMethod {
  cenc,
  cbcs,
}

extension CmafEncryptionMethodValueExtension on CmafEncryptionMethod {
  String toValue() {
    switch (this) {
      case CmafEncryptionMethod.cenc:
        return 'CENC';
      case CmafEncryptionMethod.cbcs:
        return 'CBCS';
    }
  }
}

extension CmafEncryptionMethodFromString on String {
  CmafEncryptionMethod toCmafEncryptionMethod() {
    switch (this) {
      case 'CENC':
        return CmafEncryptionMethod.cenc;
      case 'CBCS':
        return CmafEncryptionMethod.cbcs;
    }
    throw Exception('$this is not known in enum CmafEncryptionMethod');
  }
}

enum ContainerType {
  ts,
  cmaf,
}

extension ContainerTypeValueExtension on ContainerType {
  String toValue() {
    switch (this) {
      case ContainerType.ts:
        return 'TS';
      case ContainerType.cmaf:
        return 'CMAF';
    }
  }
}

extension ContainerTypeFromString on String {
  ContainerType toContainerType() {
    switch (this) {
      case 'TS':
        return ContainerType.ts;
      case 'CMAF':
        return ContainerType.cmaf;
    }
    throw Exception('$this is not known in enum ContainerType');
  }
}

class CreateChannelGroupResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The date and time the channel group was created.
  final DateTime createdAt;

  /// The output domain where the source stream should be sent. Integrate the
  /// egress domain with a downstream CDN (such as Amazon CloudFront) or playback
  /// device.
  final String egressDomain;

  /// The date and time the channel group was modified.
  final DateTime modifiedAt;

  /// The description for your channel group.
  final String? description;

  /// The comma-separated list of tag key:value pairs assigned to the channel
  /// group.
  final Map<String, String>? tags;

  CreateChannelGroupResponse({
    required this.arn,
    required this.channelGroupName,
    required this.createdAt,
    required this.egressDomain,
    required this.modifiedAt,
    this.description,
    this.tags,
  });

  factory CreateChannelGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelGroupResponse(
      arn: json['Arn'] as String,
      channelGroupName: json['ChannelGroupName'] as String,
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      egressDomain: json['EgressDomain'] as String,
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] as Object),
      description: json['Description'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final createdAt = this.createdAt;
    final egressDomain = this.egressDomain;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'EgressDomain': egressDomain,
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateChannelResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The date and time the channel was created.
  final DateTime createdAt;

  /// The date and time the channel was modified.
  final DateTime modifiedAt;

  /// The description for your channel.
  final String? description;
  final List<IngestEndpoint>? ingestEndpoints;

  /// The comma-separated list of tag key:value pairs assigned to the channel.
  final Map<String, String>? tags;

  CreateChannelResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.createdAt,
    required this.modifiedAt,
    this.description,
    this.ingestEndpoints,
    this.tags,
  });

  factory CreateChannelResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelResponse(
      arn: json['Arn'] as String,
      channelGroupName: json['ChannelGroupName'] as String,
      channelName: json['ChannelName'] as String,
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] as Object),
      description: json['Description'] as String?,
      ingestEndpoints: (json['IngestEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => IngestEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    final ingestEndpoints = this.ingestEndpoints;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
      if (ingestEndpoints != null) 'IngestEndpoints': ingestEndpoints,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Create an HTTP live streaming (HLS) manifest configuration.
class CreateHlsManifestConfiguration {
  /// A short short string that's appended to the endpoint URL. The manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index. MediaPackage
  /// automatically inserts the format extension, such as .m3u8. You can't use the
  /// same manifest name if you use HLS manifest and low-latency HLS manifest. The
  /// manifestName on the HLSManifest object overrides the manifestName you
  /// provided on the originEndpoint object.
  final String manifestName;

  /// A short string that's appended to the endpoint URL. The child manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index, with an added suffix to
  /// distinguish it from the manifest name. The manifestName on the HLSManifest
  /// object overrides the manifestName you provided on the originEndpoint object.
  final String? childManifestName;

  /// The total duration (in seconds) of the manifest's content.
  final int? manifestWindowSeconds;

  /// Inserts EXT-X-PROGRAM-DATE-TIME tags in the output manifest at the interval
  /// that you specify. If you don't enter an interval, EXT-X-PROGRAM-DATE-TIME
  /// tags aren't included in the manifest. The tags sync the stream to the wall
  /// clock so that viewers can seek to a specific time in the playback timeline
  /// on the player. ID3Timed metadata messages generate every 5 seconds whenever
  /// the content is ingested.
  ///
  /// Irrespective of this parameter, if any ID3Timed metadata is in the HLS
  /// input, it is passed through to the HLS output.
  final int? programDateTimeIntervalSeconds;
  final ScteHls? scteHls;

  CreateHlsManifestConfiguration({
    required this.manifestName,
    this.childManifestName,
    this.manifestWindowSeconds,
    this.programDateTimeIntervalSeconds,
    this.scteHls,
  });

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final childManifestName = this.childManifestName;
    final manifestWindowSeconds = this.manifestWindowSeconds;
    final programDateTimeIntervalSeconds = this.programDateTimeIntervalSeconds;
    final scteHls = this.scteHls;
    return {
      'ManifestName': manifestName,
      if (childManifestName != null) 'ChildManifestName': childManifestName,
      if (manifestWindowSeconds != null)
        'ManifestWindowSeconds': manifestWindowSeconds,
      if (programDateTimeIntervalSeconds != null)
        'ProgramDateTimeIntervalSeconds': programDateTimeIntervalSeconds,
      if (scteHls != null) 'ScteHls': scteHls,
    };
  }
}

/// Create a low-latency HTTP live streaming (HLS) manifest configuration.
class CreateLowLatencyHlsManifestConfiguration {
  /// A short short string that's appended to the endpoint URL. The manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index. MediaPackage
  /// automatically inserts the format extension, such as .m3u8. You can't use the
  /// same manifest name if you use HLS manifest and low-latency HLS manifest. The
  /// manifestName on the HLSManifest object overrides the manifestName you
  /// provided on the originEndpoint object.
  final String manifestName;

  /// A short string that's appended to the endpoint URL. The child manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index, with an added suffix to
  /// distinguish it from the manifest name. The manifestName on the HLSManifest
  /// object overrides the manifestName you provided on the originEndpoint object.
  final String? childManifestName;

  /// The total duration (in seconds) of the manifest's content.
  final int? manifestWindowSeconds;

  /// Inserts EXT-X-PROGRAM-DATE-TIME tags in the output manifest at the interval
  /// that you specify. If you don't enter an interval, EXT-X-PROGRAM-DATE-TIME
  /// tags aren't included in the manifest. The tags sync the stream to the wall
  /// clock so that viewers can seek to a specific time in the playback timeline
  /// on the player. ID3Timed metadata messages generate every 5 seconds whenever
  /// the content is ingested.
  ///
  /// Irrespective of this parameter, if any ID3Timed metadata is in the HLS
  /// input, it is passed through to the HLS output.
  final int? programDateTimeIntervalSeconds;
  final ScteHls? scteHls;

  CreateLowLatencyHlsManifestConfiguration({
    required this.manifestName,
    this.childManifestName,
    this.manifestWindowSeconds,
    this.programDateTimeIntervalSeconds,
    this.scteHls,
  });

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final childManifestName = this.childManifestName;
    final manifestWindowSeconds = this.manifestWindowSeconds;
    final programDateTimeIntervalSeconds = this.programDateTimeIntervalSeconds;
    final scteHls = this.scteHls;
    return {
      'ManifestName': manifestName,
      if (childManifestName != null) 'ChildManifestName': childManifestName,
      if (manifestWindowSeconds != null)
        'ManifestWindowSeconds': manifestWindowSeconds,
      if (programDateTimeIntervalSeconds != null)
        'ProgramDateTimeIntervalSeconds': programDateTimeIntervalSeconds,
      if (scteHls != null) 'ScteHls': scteHls,
    };
  }
}

class CreateOriginEndpointResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The type of container attached to this origin endpoint.
  final ContainerType containerType;

  /// The date and time the origin endpoint was created.
  final DateTime createdAt;

  /// The date and time the origin endpoint was modified.
  final DateTime modifiedAt;

  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your account
  /// in the AWS Region and channel.
  final String originEndpointName;

  /// The segment configuration, including the segment name, duration, and other
  /// configuration values.
  final Segment segment;

  /// The description for your origin endpoint.
  final String? description;

  /// An HTTP live streaming (HLS) manifest configuration.
  final List<GetHlsManifestConfiguration>? hlsManifests;

  /// A low-latency HLS manifest configuration.
  final List<GetLowLatencyHlsManifestConfiguration>? lowLatencyHlsManifests;

  /// The size of the window (in seconds) to create a window of the live stream
  /// that's available for on-demand viewing. Viewers can start-over or catch-up
  /// on content that falls within the window.
  final int? startoverWindowSeconds;

  /// The comma-separated list of tag key:value pairs assigned to the origin
  /// endpoint.
  final Map<String, String>? tags;

  CreateOriginEndpointResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.containerType,
    required this.createdAt,
    required this.modifiedAt,
    required this.originEndpointName,
    required this.segment,
    this.description,
    this.hlsManifests,
    this.lowLatencyHlsManifests,
    this.startoverWindowSeconds,
    this.tags,
  });

  factory CreateOriginEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreateOriginEndpointResponse(
      arn: json['Arn'] as String,
      channelGroupName: json['ChannelGroupName'] as String,
      channelName: json['ChannelName'] as String,
      containerType: (json['ContainerType'] as String).toContainerType(),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] as Object),
      originEndpointName: json['OriginEndpointName'] as String,
      segment: Segment.fromJson(json['Segment'] as Map<String, dynamic>),
      description: json['Description'] as String?,
      hlsManifests: (json['HlsManifests'] as List?)
          ?.whereNotNull()
          .map((e) =>
              GetHlsManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      lowLatencyHlsManifests: (json['LowLatencyHlsManifests'] as List?)
          ?.whereNotNull()
          .map((e) => GetLowLatencyHlsManifestConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      startoverWindowSeconds: json['StartoverWindowSeconds'] as int?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final containerType = this.containerType;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final originEndpointName = this.originEndpointName;
    final segment = this.segment;
    final description = this.description;
    final hlsManifests = this.hlsManifests;
    final lowLatencyHlsManifests = this.lowLatencyHlsManifests;
    final startoverWindowSeconds = this.startoverWindowSeconds;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'ContainerType': containerType.toValue(),
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      'OriginEndpointName': originEndpointName,
      'Segment': segment,
      if (description != null) 'Description': description,
      if (hlsManifests != null) 'HlsManifests': hlsManifests,
      if (lowLatencyHlsManifests != null)
        'LowLatencyHlsManifests': lowLatencyHlsManifests,
      if (startoverWindowSeconds != null)
        'StartoverWindowSeconds': startoverWindowSeconds,
      if (tags != null) 'Tags': tags,
    };
  }
}

class DeleteChannelGroupResponse {
  DeleteChannelGroupResponse();

  factory DeleteChannelGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteChannelGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteChannelPolicyResponse {
  DeleteChannelPolicyResponse();

  factory DeleteChannelPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteChannelPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteChannelResponse {
  DeleteChannelResponse();

  factory DeleteChannelResponse.fromJson(Map<String, dynamic> _) {
    return DeleteChannelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteOriginEndpointPolicyResponse {
  DeleteOriginEndpointPolicyResponse();

  factory DeleteOriginEndpointPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteOriginEndpointPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteOriginEndpointResponse {
  DeleteOriginEndpointResponse();

  factory DeleteOriginEndpointResponse.fromJson(Map<String, dynamic> _) {
    return DeleteOriginEndpointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum DrmSystem {
  clearKeyAes_128,
  fairplay,
  playready,
  widevine,
}

extension DrmSystemValueExtension on DrmSystem {
  String toValue() {
    switch (this) {
      case DrmSystem.clearKeyAes_128:
        return 'CLEAR_KEY_AES_128';
      case DrmSystem.fairplay:
        return 'FAIRPLAY';
      case DrmSystem.playready:
        return 'PLAYREADY';
      case DrmSystem.widevine:
        return 'WIDEVINE';
    }
  }
}

extension DrmSystemFromString on String {
  DrmSystem toDrmSystem() {
    switch (this) {
      case 'CLEAR_KEY_AES_128':
        return DrmSystem.clearKeyAes_128;
      case 'FAIRPLAY':
        return DrmSystem.fairplay;
      case 'PLAYREADY':
        return DrmSystem.playready;
      case 'WIDEVINE':
        return DrmSystem.widevine;
    }
    throw Exception('$this is not known in enum DrmSystem');
  }
}

/// The parameters for encrypting content.
class Encryption {
  /// The encryption method to use.
  final EncryptionMethod encryptionMethod;

  /// The parameters for the SPEKE key provider.
  final SpekeKeyProvider spekeKeyProvider;

  /// A 128-bit, 16-byte hex value represented by a 32-character string, used in
  /// conjunction with the key for encrypting content. If you don't specify a
  /// value, then MediaPackage creates the constant initialization vector (IV).
  final String? constantInitializationVector;

  /// The frequency (in seconds) of key changes for live workflows, in which
  /// content is streamed real time. The service retrieves content keys before the
  /// live content begins streaming, and then retrieves them as needed over the
  /// lifetime of the workflow. By default, key rotation is set to 300 seconds (5
  /// minutes), the minimum rotation interval, which is equivalent to setting it
  /// to 300. If you don't enter an interval, content keys aren't rotated.
  ///
  /// The following example setting causes the service to rotate keys every thirty
  /// minutes: <code>1800</code>
  final int? keyRotationIntervalSeconds;

  Encryption({
    required this.encryptionMethod,
    required this.spekeKeyProvider,
    this.constantInitializationVector,
    this.keyRotationIntervalSeconds,
  });

  factory Encryption.fromJson(Map<String, dynamic> json) {
    return Encryption(
      encryptionMethod: EncryptionMethod.fromJson(
          json['EncryptionMethod'] as Map<String, dynamic>),
      spekeKeyProvider: SpekeKeyProvider.fromJson(
          json['SpekeKeyProvider'] as Map<String, dynamic>),
      constantInitializationVector:
          json['ConstantInitializationVector'] as String?,
      keyRotationIntervalSeconds: json['KeyRotationIntervalSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionMethod = this.encryptionMethod;
    final spekeKeyProvider = this.spekeKeyProvider;
    final constantInitializationVector = this.constantInitializationVector;
    final keyRotationIntervalSeconds = this.keyRotationIntervalSeconds;
    return {
      'EncryptionMethod': encryptionMethod,
      'SpekeKeyProvider': spekeKeyProvider,
      if (constantInitializationVector != null)
        'ConstantInitializationVector': constantInitializationVector,
      if (keyRotationIntervalSeconds != null)
        'KeyRotationIntervalSeconds': keyRotationIntervalSeconds,
    };
  }
}

/// Configure one or more content encryption keys for your endpoints that use
/// SPEKE Version 2.0. The encryption contract defines which content keys are
/// used to encrypt the audio and video tracks in your stream. To configure the
/// encryption contract, specify which audio and video encryption presets to
/// use.
class EncryptionContractConfiguration {
  /// A collection of audio encryption presets.
  ///
  /// Value description:
  ///
  /// <ul>
  /// <li>
  /// PRESET-AUDIO-1 - Use one content key to encrypt all of the audio tracks in
  /// your stream.
  /// </li>
  /// <li>
  /// PRESET-AUDIO-2 - Use one content key to encrypt all of the stereo audio
  /// tracks and one content key to encrypt all of the multichannel audio tracks.
  /// </li>
  /// <li>
  /// PRESET-AUDIO-3 - Use one content key to encrypt all of the stereo audio
  /// tracks, one content key to encrypt all of the multichannel audio tracks with
  /// 3 to 6 channels, and one content key to encrypt all of the multichannel
  /// audio tracks with more than 6 channels.
  /// </li>
  /// <li>
  /// SHARED - Use the same content key for all of the audio and video tracks in
  /// your stream.
  /// </li>
  /// <li>
  /// UNENCRYPTED - Don't encrypt any of the audio tracks in your stream.
  /// </li>
  /// </ul>
  final PresetSpeke20Audio presetSpeke20Audio;

  /// A collection of video encryption presets.
  ///
  /// Value description:
  ///
  /// <ul>
  /// <li>
  /// PRESET-VIDEO-1 - Use one content key to encrypt all of the video tracks in
  /// your stream.
  /// </li>
  /// <li>
  /// PRESET-VIDEO-2 - Use one content key to encrypt all of the SD video tracks
  /// and one content key for all HD and higher resolutions video tracks.
  /// </li>
  /// <li>
  /// PRESET-VIDEO-3 - Use one content key to encrypt all of the SD video tracks,
  /// one content key for HD video tracks and one content key for all UHD video
  /// tracks.
  /// </li>
  /// <li>
  /// PRESET-VIDEO-4 - Use one content key to encrypt all of the SD video tracks,
  /// one content key for HD video tracks, one content key for all UHD1 video
  /// tracks and one content key for all UHD2 video tracks.
  /// </li>
  /// <li>
  /// PRESET-VIDEO-5 - Use one content key to encrypt all of the SD video tracks,
  /// one content key for HD1 video tracks, one content key for HD2 video tracks,
  /// one content key for all UHD1 video tracks and one content key for all UHD2
  /// video tracks.
  /// </li>
  /// <li>
  /// PRESET-VIDEO-6 - Use one content key to encrypt all of the SD video tracks,
  /// one content key for HD1 video tracks, one content key for HD2 video tracks
  /// and one content key for all UHD video tracks.
  /// </li>
  /// <li>
  /// PRESET-VIDEO-7 - Use one content key to encrypt all of the SD+HD1 video
  /// tracks, one content key for HD2 video tracks and one content key for all UHD
  /// video tracks.
  /// </li>
  /// <li>
  /// PRESET-VIDEO-8 - Use one content key to encrypt all of the SD+HD1 video
  /// tracks, one content key for HD2 video tracks, one content key for all UHD1
  /// video tracks and one content key for all UHD2 video tracks.
  /// </li>
  /// <li>
  /// SHARED - Use the same content key for all of the video and audio tracks in
  /// your stream.
  /// </li>
  /// <li>
  /// UNENCRYPTED - Don't encrypt any of the video tracks in your stream.
  /// </li>
  /// </ul>
  final PresetSpeke20Video presetSpeke20Video;

  EncryptionContractConfiguration({
    required this.presetSpeke20Audio,
    required this.presetSpeke20Video,
  });

  factory EncryptionContractConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionContractConfiguration(
      presetSpeke20Audio:
          (json['PresetSpeke20Audio'] as String).toPresetSpeke20Audio(),
      presetSpeke20Video:
          (json['PresetSpeke20Video'] as String).toPresetSpeke20Video(),
    );
  }

  Map<String, dynamic> toJson() {
    final presetSpeke20Audio = this.presetSpeke20Audio;
    final presetSpeke20Video = this.presetSpeke20Video;
    return {
      'PresetSpeke20Audio': presetSpeke20Audio.toValue(),
      'PresetSpeke20Video': presetSpeke20Video.toValue(),
    };
  }
}

/// The encryption type.
class EncryptionMethod {
  /// The encryption method to use.
  final CmafEncryptionMethod? cmafEncryptionMethod;

  /// The encryption method to use.
  final TsEncryptionMethod? tsEncryptionMethod;

  EncryptionMethod({
    this.cmafEncryptionMethod,
    this.tsEncryptionMethod,
  });

  factory EncryptionMethod.fromJson(Map<String, dynamic> json) {
    return EncryptionMethod(
      cmafEncryptionMethod:
          (json['CmafEncryptionMethod'] as String?)?.toCmafEncryptionMethod(),
      tsEncryptionMethod:
          (json['TsEncryptionMethod'] as String?)?.toTsEncryptionMethod(),
    );
  }

  Map<String, dynamic> toJson() {
    final cmafEncryptionMethod = this.cmafEncryptionMethod;
    final tsEncryptionMethod = this.tsEncryptionMethod;
    return {
      if (cmafEncryptionMethod != null)
        'CmafEncryptionMethod': cmafEncryptionMethod.toValue(),
      if (tsEncryptionMethod != null)
        'TsEncryptionMethod': tsEncryptionMethod.toValue(),
    };
  }
}

class GetChannelGroupResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The date and time the channel group was created.
  final DateTime createdAt;

  /// The output domain where the source stream should be sent. Integrate the
  /// domain with a downstream CDN (such as Amazon CloudFront) or playback device.
  final String egressDomain;

  /// The date and time the channel group was modified.
  final DateTime modifiedAt;

  /// The description for your channel group.
  final String? description;

  /// The comma-separated list of tag key:value pairs assigned to the channel
  /// group.
  final Map<String, String>? tags;

  GetChannelGroupResponse({
    required this.arn,
    required this.channelGroupName,
    required this.createdAt,
    required this.egressDomain,
    required this.modifiedAt,
    this.description,
    this.tags,
  });

  factory GetChannelGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetChannelGroupResponse(
      arn: json['Arn'] as String,
      channelGroupName: json['ChannelGroupName'] as String,
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      egressDomain: json['EgressDomain'] as String,
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] as Object),
      description: json['Description'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final createdAt = this.createdAt;
    final egressDomain = this.egressDomain;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'EgressDomain': egressDomain,
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetChannelPolicyResponse {
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The policy assigned to the channel.
  final String policy;

  GetChannelPolicyResponse({
    required this.channelGroupName,
    required this.channelName,
    required this.policy,
  });

  factory GetChannelPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetChannelPolicyResponse(
      channelGroupName: json['ChannelGroupName'] as String,
      channelName: json['ChannelName'] as String,
      policy: json['Policy'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final policy = this.policy;
    return {
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'Policy': policy,
    };
  }
}

class GetChannelResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The date and time the channel was created.
  final DateTime createdAt;

  /// The date and time the channel was modified.
  final DateTime modifiedAt;

  /// The description for your channel.
  final String? description;
  final List<IngestEndpoint>? ingestEndpoints;

  /// The comma-separated list of tag key:value pairs assigned to the channel.
  final Map<String, String>? tags;

  GetChannelResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.createdAt,
    required this.modifiedAt,
    this.description,
    this.ingestEndpoints,
    this.tags,
  });

  factory GetChannelResponse.fromJson(Map<String, dynamic> json) {
    return GetChannelResponse(
      arn: json['Arn'] as String,
      channelGroupName: json['ChannelGroupName'] as String,
      channelName: json['ChannelName'] as String,
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] as Object),
      description: json['Description'] as String?,
      ingestEndpoints: (json['IngestEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => IngestEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    final ingestEndpoints = this.ingestEndpoints;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
      if (ingestEndpoints != null) 'IngestEndpoints': ingestEndpoints,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Retrieve the HTTP live streaming (HLS) manifest configuration.
class GetHlsManifestConfiguration {
  /// A short short string that's appended to the endpoint URL. The manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index. MediaPackage
  /// automatically inserts the format extension, such as .m3u8. You can't use the
  /// same manifest name if you use HLS manifest and low-latency HLS manifest. The
  /// manifestName on the HLSManifest object overrides the manifestName you
  /// provided on the originEndpoint object.
  final String manifestName;

  /// The egress domain URL for stream delivery from MediaPackage.
  final String url;

  /// A short string that's appended to the endpoint URL. The child manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default child manifest name, index_1. The manifestName
  /// on the HLSManifest object overrides the manifestName you provided on the
  /// originEndpoint object.
  final String? childManifestName;

  /// The total duration (in seconds) of the manifest's content.
  final int? manifestWindowSeconds;

  /// Inserts EXT-X-PROGRAM-DATE-TIME tags in the output manifest at the interval
  /// that you specify. If you don't enter an interval, EXT-X-PROGRAM-DATE-TIME
  /// tags aren't included in the manifest. The tags sync the stream to the wall
  /// clock so that viewers can seek to a specific time in the playback timeline
  /// on the player. ID3Timed metadata messages generate every 5 seconds whenever
  /// the content is ingested.
  ///
  /// Irrespective of this parameter, if any ID3Timed metadata is in the HLS
  /// input, it is passed through to the HLS output.
  final int? programDateTimeIntervalSeconds;
  final ScteHls? scteHls;

  GetHlsManifestConfiguration({
    required this.manifestName,
    required this.url,
    this.childManifestName,
    this.manifestWindowSeconds,
    this.programDateTimeIntervalSeconds,
    this.scteHls,
  });

  factory GetHlsManifestConfiguration.fromJson(Map<String, dynamic> json) {
    return GetHlsManifestConfiguration(
      manifestName: json['ManifestName'] as String,
      url: json['Url'] as String,
      childManifestName: json['ChildManifestName'] as String?,
      manifestWindowSeconds: json['ManifestWindowSeconds'] as int?,
      programDateTimeIntervalSeconds:
          json['ProgramDateTimeIntervalSeconds'] as int?,
      scteHls: json['ScteHls'] != null
          ? ScteHls.fromJson(json['ScteHls'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final url = this.url;
    final childManifestName = this.childManifestName;
    final manifestWindowSeconds = this.manifestWindowSeconds;
    final programDateTimeIntervalSeconds = this.programDateTimeIntervalSeconds;
    final scteHls = this.scteHls;
    return {
      'ManifestName': manifestName,
      'Url': url,
      if (childManifestName != null) 'ChildManifestName': childManifestName,
      if (manifestWindowSeconds != null)
        'ManifestWindowSeconds': manifestWindowSeconds,
      if (programDateTimeIntervalSeconds != null)
        'ProgramDateTimeIntervalSeconds': programDateTimeIntervalSeconds,
      if (scteHls != null) 'ScteHls': scteHls,
    };
  }
}

/// Retrieve the low-latency HTTP live streaming (HLS) manifest configuration.
class GetLowLatencyHlsManifestConfiguration {
  /// A short short string that's appended to the endpoint URL. The manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index. MediaPackage
  /// automatically inserts the format extension, such as .m3u8. You can't use the
  /// same manifest name if you use HLS manifest and low-latency HLS manifest. The
  /// manifestName on the HLSManifest object overrides the manifestName you
  /// provided on the originEndpoint object.
  final String manifestName;

  /// The egress domain URL for stream delivery from MediaPackage.
  final String url;

  /// A short string that's appended to the endpoint URL. The child manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default child manifest name, index_1. The manifestName
  /// on the HLSManifest object overrides the manifestName you provided on the
  /// originEndpoint object.
  final String? childManifestName;

  /// The total duration (in seconds) of the manifest's content.
  final int? manifestWindowSeconds;

  /// Inserts EXT-X-PROGRAM-DATE-TIME tags in the output manifest at the interval
  /// that you specify. If you don't enter an interval, EXT-X-PROGRAM-DATE-TIME
  /// tags aren't included in the manifest. The tags sync the stream to the wall
  /// clock so that viewers can seek to a specific time in the playback timeline
  /// on the player. ID3Timed metadata messages generate every 5 seconds whenever
  /// the content is ingested.
  ///
  /// Irrespective of this parameter, if any ID3Timed metadata is in the HLS
  /// input, it is passed through to the HLS output.
  final int? programDateTimeIntervalSeconds;
  final ScteHls? scteHls;

  GetLowLatencyHlsManifestConfiguration({
    required this.manifestName,
    required this.url,
    this.childManifestName,
    this.manifestWindowSeconds,
    this.programDateTimeIntervalSeconds,
    this.scteHls,
  });

  factory GetLowLatencyHlsManifestConfiguration.fromJson(
      Map<String, dynamic> json) {
    return GetLowLatencyHlsManifestConfiguration(
      manifestName: json['ManifestName'] as String,
      url: json['Url'] as String,
      childManifestName: json['ChildManifestName'] as String?,
      manifestWindowSeconds: json['ManifestWindowSeconds'] as int?,
      programDateTimeIntervalSeconds:
          json['ProgramDateTimeIntervalSeconds'] as int?,
      scteHls: json['ScteHls'] != null
          ? ScteHls.fromJson(json['ScteHls'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final url = this.url;
    final childManifestName = this.childManifestName;
    final manifestWindowSeconds = this.manifestWindowSeconds;
    final programDateTimeIntervalSeconds = this.programDateTimeIntervalSeconds;
    final scteHls = this.scteHls;
    return {
      'ManifestName': manifestName,
      'Url': url,
      if (childManifestName != null) 'ChildManifestName': childManifestName,
      if (manifestWindowSeconds != null)
        'ManifestWindowSeconds': manifestWindowSeconds,
      if (programDateTimeIntervalSeconds != null)
        'ProgramDateTimeIntervalSeconds': programDateTimeIntervalSeconds,
      if (scteHls != null) 'ScteHls': scteHls,
    };
  }
}

class GetOriginEndpointPolicyResponse {
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your account
  /// in the AWS Region and channel.
  final String originEndpointName;

  /// The policy assigned to the origin endpoint.
  final String policy;

  GetOriginEndpointPolicyResponse({
    required this.channelGroupName,
    required this.channelName,
    required this.originEndpointName,
    required this.policy,
  });

  factory GetOriginEndpointPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetOriginEndpointPolicyResponse(
      channelGroupName: json['ChannelGroupName'] as String,
      channelName: json['ChannelName'] as String,
      originEndpointName: json['OriginEndpointName'] as String,
      policy: json['Policy'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final originEndpointName = this.originEndpointName;
    final policy = this.policy;
    return {
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'OriginEndpointName': originEndpointName,
      'Policy': policy,
    };
  }
}

class GetOriginEndpointResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The type of container attached to this origin endpoint.
  final ContainerType containerType;

  /// The date and time the origin endpoint was created.
  final DateTime createdAt;

  /// The date and time the origin endpoint was modified.
  final DateTime modifiedAt;

  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your account
  /// in the AWS Region and channel.
  final String originEndpointName;
  final Segment segment;

  /// The description for your origin endpoint.
  final String? description;

  /// An HTTP live streaming (HLS) manifest configuration.
  final List<GetHlsManifestConfiguration>? hlsManifests;

  /// A low-latency HLS manifest configuration.
  final List<GetLowLatencyHlsManifestConfiguration>? lowLatencyHlsManifests;

  /// The size of the window (in seconds) to create a window of the live stream
  /// that's available for on-demand viewing. Viewers can start-over or catch-up
  /// on content that falls within the window.
  final int? startoverWindowSeconds;

  /// The comma-separated list of tag key:value pairs assigned to the origin
  /// endpoint.
  final Map<String, String>? tags;

  GetOriginEndpointResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.containerType,
    required this.createdAt,
    required this.modifiedAt,
    required this.originEndpointName,
    required this.segment,
    this.description,
    this.hlsManifests,
    this.lowLatencyHlsManifests,
    this.startoverWindowSeconds,
    this.tags,
  });

  factory GetOriginEndpointResponse.fromJson(Map<String, dynamic> json) {
    return GetOriginEndpointResponse(
      arn: json['Arn'] as String,
      channelGroupName: json['ChannelGroupName'] as String,
      channelName: json['ChannelName'] as String,
      containerType: (json['ContainerType'] as String).toContainerType(),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] as Object),
      originEndpointName: json['OriginEndpointName'] as String,
      segment: Segment.fromJson(json['Segment'] as Map<String, dynamic>),
      description: json['Description'] as String?,
      hlsManifests: (json['HlsManifests'] as List?)
          ?.whereNotNull()
          .map((e) =>
              GetHlsManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      lowLatencyHlsManifests: (json['LowLatencyHlsManifests'] as List?)
          ?.whereNotNull()
          .map((e) => GetLowLatencyHlsManifestConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      startoverWindowSeconds: json['StartoverWindowSeconds'] as int?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final containerType = this.containerType;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final originEndpointName = this.originEndpointName;
    final segment = this.segment;
    final description = this.description;
    final hlsManifests = this.hlsManifests;
    final lowLatencyHlsManifests = this.lowLatencyHlsManifests;
    final startoverWindowSeconds = this.startoverWindowSeconds;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'ContainerType': containerType.toValue(),
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      'OriginEndpointName': originEndpointName,
      'Segment': segment,
      if (description != null) 'Description': description,
      if (hlsManifests != null) 'HlsManifests': hlsManifests,
      if (lowLatencyHlsManifests != null)
        'LowLatencyHlsManifests': lowLatencyHlsManifests,
      if (startoverWindowSeconds != null)
        'StartoverWindowSeconds': startoverWindowSeconds,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// The ingest domain URL where the source stream should be sent.
class IngestEndpoint {
  /// The system-generated unique identifier for the IngestEndpoint.
  final String? id;

  /// The ingest domain URL where the source stream should be sent.
  final String? url;

  IngestEndpoint({
    this.id,
    this.url,
  });

  factory IngestEndpoint.fromJson(Map<String, dynamic> json) {
    return IngestEndpoint(
      id: json['Id'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final url = this.url;
    return {
      if (id != null) 'Id': id,
      if (url != null) 'Url': url,
    };
  }
}

class ListChannelGroupsResponse {
  /// The objects being returned.
  final List<ChannelGroupListConfiguration>? items;

  /// The pagination token from the GET list request. Use the token to fetch the
  /// next page of results.
  final String? nextToken;

  ListChannelGroupsResponse({
    this.items,
    this.nextToken,
  });

  factory ListChannelGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelGroupsResponse(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ChannelGroupListConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListChannelsResponse {
  /// The objects being returned.
  final List<ChannelListConfiguration>? items;

  /// The pagination token from the GET list request.
  final String? nextToken;

  ListChannelsResponse({
    this.items,
    this.nextToken,
  });

  factory ListChannelsResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelsResponse(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ChannelListConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// List the HTTP live streaming (HLS) manifest configuration.
class ListHlsManifestConfiguration {
  /// A short short string that's appended to the endpoint URL. The manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index. MediaPackage
  /// automatically inserts the format extension, such as .m3u8. You can't use the
  /// same manifest name if you use HLS manifest and low-latency HLS manifest. The
  /// manifestName on the HLSManifest object overrides the manifestName you
  /// provided on the originEndpoint object.
  final String manifestName;

  /// A short string that's appended to the endpoint URL. The child manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default child manifest name, index_1. The manifestName
  /// on the HLSManifest object overrides the manifestName you provided on the
  /// originEndpoint object.
  final String? childManifestName;

  /// The egress domain URL for stream delivery from MediaPackage.
  final String? url;

  ListHlsManifestConfiguration({
    required this.manifestName,
    this.childManifestName,
    this.url,
  });

  factory ListHlsManifestConfiguration.fromJson(Map<String, dynamic> json) {
    return ListHlsManifestConfiguration(
      manifestName: json['ManifestName'] as String,
      childManifestName: json['ChildManifestName'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final childManifestName = this.childManifestName;
    final url = this.url;
    return {
      'ManifestName': manifestName,
      if (childManifestName != null) 'ChildManifestName': childManifestName,
      if (url != null) 'Url': url,
    };
  }
}

/// List the low-latency HTTP live streaming (HLS) manifest configuration.
class ListLowLatencyHlsManifestConfiguration {
  /// A short short string that's appended to the endpoint URL. The manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index. MediaPackage
  /// automatically inserts the format extension, such as .m3u8. You can't use the
  /// same manifest name if you use HLS manifest and low-latency HLS manifest. The
  /// manifestName on the HLSManifest object overrides the manifestName you
  /// provided on the originEndpoint object.
  final String manifestName;

  /// A short string that's appended to the endpoint URL. The child manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default child manifest name, index_1. The manifestName
  /// on the HLSManifest object overrides the manifestName you provided on the
  /// originEndpoint object.
  final String? childManifestName;

  /// The egress domain URL for stream delivery from MediaPackage.
  final String? url;

  ListLowLatencyHlsManifestConfiguration({
    required this.manifestName,
    this.childManifestName,
    this.url,
  });

  factory ListLowLatencyHlsManifestConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ListLowLatencyHlsManifestConfiguration(
      manifestName: json['ManifestName'] as String,
      childManifestName: json['ChildManifestName'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final childManifestName = this.childManifestName;
    final url = this.url;
    return {
      'ManifestName': manifestName,
      if (childManifestName != null) 'ChildManifestName': childManifestName,
      if (url != null) 'Url': url,
    };
  }
}

class ListOriginEndpointsResponse {
  /// The objects being returned.
  final List<OriginEndpointListConfiguration>? items;

  /// The pagination token from the GET list request. Use the token to fetch the
  /// next page of results.
  final String? nextToken;

  ListOriginEndpointsResponse({
    this.items,
    this.nextToken,
  });

  factory ListOriginEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return ListOriginEndpointsResponse(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => OriginEndpointListConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// Contains a map of the key-value pairs for the resource tag or tags assigned
  /// to the resource.
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

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// The configuration of the origin endpoint.
class OriginEndpointListConfiguration {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The type of container attached to this origin endpoint. A container type is
  /// a file format that encapsulates one or more media streams, such as audio and
  /// video, into a single file.
  final ContainerType containerType;

  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your account
  /// in the AWS Region and channel.
  final String originEndpointName;

  /// The date and time the origin endpoint was created.
  final DateTime? createdAt;

  /// Any descriptive information that you want to add to the origin endpoint for
  /// future identification purposes.
  final String? description;

  /// An HTTP live streaming (HLS) manifest configuration.
  final List<ListHlsManifestConfiguration>? hlsManifests;

  /// A low-latency HLS manifest configuration.
  final List<ListLowLatencyHlsManifestConfiguration>? lowLatencyHlsManifests;

  /// The date and time the origin endpoint was modified.
  final DateTime? modifiedAt;

  OriginEndpointListConfiguration({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.containerType,
    required this.originEndpointName,
    this.createdAt,
    this.description,
    this.hlsManifests,
    this.lowLatencyHlsManifests,
    this.modifiedAt,
  });

  factory OriginEndpointListConfiguration.fromJson(Map<String, dynamic> json) {
    return OriginEndpointListConfiguration(
      arn: json['Arn'] as String,
      channelGroupName: json['ChannelGroupName'] as String,
      channelName: json['ChannelName'] as String,
      containerType: (json['ContainerType'] as String).toContainerType(),
      originEndpointName: json['OriginEndpointName'] as String,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      hlsManifests: (json['HlsManifests'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ListHlsManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      lowLatencyHlsManifests: (json['LowLatencyHlsManifests'] as List?)
          ?.whereNotNull()
          .map((e) => ListLowLatencyHlsManifestConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      modifiedAt: timeStampFromJson(json['ModifiedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final containerType = this.containerType;
    final originEndpointName = this.originEndpointName;
    final createdAt = this.createdAt;
    final description = this.description;
    final hlsManifests = this.hlsManifests;
    final lowLatencyHlsManifests = this.lowLatencyHlsManifests;
    final modifiedAt = this.modifiedAt;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'ContainerType': containerType.toValue(),
      'OriginEndpointName': originEndpointName,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (hlsManifests != null) 'HlsManifests': hlsManifests,
      if (lowLatencyHlsManifests != null)
        'LowLatencyHlsManifests': lowLatencyHlsManifests,
      if (modifiedAt != null) 'ModifiedAt': unixTimestampToJson(modifiedAt),
    };
  }
}

enum PresetSpeke20Audio {
  presetAudio_1,
  presetAudio_2,
  presetAudio_3,
  shared,
  unencrypted,
}

extension PresetSpeke20AudioValueExtension on PresetSpeke20Audio {
  String toValue() {
    switch (this) {
      case PresetSpeke20Audio.presetAudio_1:
        return 'PRESET_AUDIO_1';
      case PresetSpeke20Audio.presetAudio_2:
        return 'PRESET_AUDIO_2';
      case PresetSpeke20Audio.presetAudio_3:
        return 'PRESET_AUDIO_3';
      case PresetSpeke20Audio.shared:
        return 'SHARED';
      case PresetSpeke20Audio.unencrypted:
        return 'UNENCRYPTED';
    }
  }
}

extension PresetSpeke20AudioFromString on String {
  PresetSpeke20Audio toPresetSpeke20Audio() {
    switch (this) {
      case 'PRESET_AUDIO_1':
        return PresetSpeke20Audio.presetAudio_1;
      case 'PRESET_AUDIO_2':
        return PresetSpeke20Audio.presetAudio_2;
      case 'PRESET_AUDIO_3':
        return PresetSpeke20Audio.presetAudio_3;
      case 'SHARED':
        return PresetSpeke20Audio.shared;
      case 'UNENCRYPTED':
        return PresetSpeke20Audio.unencrypted;
    }
    throw Exception('$this is not known in enum PresetSpeke20Audio');
  }
}

enum PresetSpeke20Video {
  presetVideo_1,
  presetVideo_2,
  presetVideo_3,
  presetVideo_4,
  presetVideo_5,
  presetVideo_6,
  presetVideo_7,
  presetVideo_8,
  shared,
  unencrypted,
}

extension PresetSpeke20VideoValueExtension on PresetSpeke20Video {
  String toValue() {
    switch (this) {
      case PresetSpeke20Video.presetVideo_1:
        return 'PRESET_VIDEO_1';
      case PresetSpeke20Video.presetVideo_2:
        return 'PRESET_VIDEO_2';
      case PresetSpeke20Video.presetVideo_3:
        return 'PRESET_VIDEO_3';
      case PresetSpeke20Video.presetVideo_4:
        return 'PRESET_VIDEO_4';
      case PresetSpeke20Video.presetVideo_5:
        return 'PRESET_VIDEO_5';
      case PresetSpeke20Video.presetVideo_6:
        return 'PRESET_VIDEO_6';
      case PresetSpeke20Video.presetVideo_7:
        return 'PRESET_VIDEO_7';
      case PresetSpeke20Video.presetVideo_8:
        return 'PRESET_VIDEO_8';
      case PresetSpeke20Video.shared:
        return 'SHARED';
      case PresetSpeke20Video.unencrypted:
        return 'UNENCRYPTED';
    }
  }
}

extension PresetSpeke20VideoFromString on String {
  PresetSpeke20Video toPresetSpeke20Video() {
    switch (this) {
      case 'PRESET_VIDEO_1':
        return PresetSpeke20Video.presetVideo_1;
      case 'PRESET_VIDEO_2':
        return PresetSpeke20Video.presetVideo_2;
      case 'PRESET_VIDEO_3':
        return PresetSpeke20Video.presetVideo_3;
      case 'PRESET_VIDEO_4':
        return PresetSpeke20Video.presetVideo_4;
      case 'PRESET_VIDEO_5':
        return PresetSpeke20Video.presetVideo_5;
      case 'PRESET_VIDEO_6':
        return PresetSpeke20Video.presetVideo_6;
      case 'PRESET_VIDEO_7':
        return PresetSpeke20Video.presetVideo_7;
      case 'PRESET_VIDEO_8':
        return PresetSpeke20Video.presetVideo_8;
      case 'SHARED':
        return PresetSpeke20Video.shared;
      case 'UNENCRYPTED':
        return PresetSpeke20Video.unencrypted;
    }
    throw Exception('$this is not known in enum PresetSpeke20Video');
  }
}

class PutChannelPolicyResponse {
  PutChannelPolicyResponse();

  factory PutChannelPolicyResponse.fromJson(Map<String, dynamic> _) {
    return PutChannelPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutOriginEndpointPolicyResponse {
  PutOriginEndpointPolicyResponse();

  factory PutOriginEndpointPolicyResponse.fromJson(Map<String, dynamic> _) {
    return PutOriginEndpointPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The SCTE configuration.
class Scte {
  /// The SCTE-35 message types that you want to be treated as ad markers in the
  /// output.
  final List<ScteFilter>? scteFilter;

  Scte({
    this.scteFilter,
  });

  factory Scte.fromJson(Map<String, dynamic> json) {
    return Scte(
      scteFilter: (json['ScteFilter'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toScteFilter())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final scteFilter = this.scteFilter;
    return {
      if (scteFilter != null)
        'ScteFilter': scteFilter.map((e) => e.toValue()).toList(),
    };
  }
}

enum ScteFilter {
  spliceInsert,
  $break,
  providerAdvertisement,
  distributorAdvertisement,
  providerPlacementOpportunity,
  distributorPlacementOpportunity,
  providerOverlayPlacementOpportunity,
  distributorOverlayPlacementOpportunity,
  program,
}

extension ScteFilterValueExtension on ScteFilter {
  String toValue() {
    switch (this) {
      case ScteFilter.spliceInsert:
        return 'SPLICE_INSERT';
      case ScteFilter.$break:
        return 'BREAK';
      case ScteFilter.providerAdvertisement:
        return 'PROVIDER_ADVERTISEMENT';
      case ScteFilter.distributorAdvertisement:
        return 'DISTRIBUTOR_ADVERTISEMENT';
      case ScteFilter.providerPlacementOpportunity:
        return 'PROVIDER_PLACEMENT_OPPORTUNITY';
      case ScteFilter.distributorPlacementOpportunity:
        return 'DISTRIBUTOR_PLACEMENT_OPPORTUNITY';
      case ScteFilter.providerOverlayPlacementOpportunity:
        return 'PROVIDER_OVERLAY_PLACEMENT_OPPORTUNITY';
      case ScteFilter.distributorOverlayPlacementOpportunity:
        return 'DISTRIBUTOR_OVERLAY_PLACEMENT_OPPORTUNITY';
      case ScteFilter.program:
        return 'PROGRAM';
    }
  }
}

extension ScteFilterFromString on String {
  ScteFilter toScteFilter() {
    switch (this) {
      case 'SPLICE_INSERT':
        return ScteFilter.spliceInsert;
      case 'BREAK':
        return ScteFilter.$break;
      case 'PROVIDER_ADVERTISEMENT':
        return ScteFilter.providerAdvertisement;
      case 'DISTRIBUTOR_ADVERTISEMENT':
        return ScteFilter.distributorAdvertisement;
      case 'PROVIDER_PLACEMENT_OPPORTUNITY':
        return ScteFilter.providerPlacementOpportunity;
      case 'DISTRIBUTOR_PLACEMENT_OPPORTUNITY':
        return ScteFilter.distributorPlacementOpportunity;
      case 'PROVIDER_OVERLAY_PLACEMENT_OPPORTUNITY':
        return ScteFilter.providerOverlayPlacementOpportunity;
      case 'DISTRIBUTOR_OVERLAY_PLACEMENT_OPPORTUNITY':
        return ScteFilter.distributorOverlayPlacementOpportunity;
      case 'PROGRAM':
        return ScteFilter.program;
    }
    throw Exception('$this is not known in enum ScteFilter');
  }
}

/// The SCTE configuration.
class ScteHls {
  /// Ad markers indicate when ads should be inserted during playback. If you
  /// include ad markers in the content stream in your upstream encoders, then you
  /// need to inform MediaPackage what to do with the ad markers in the output.
  /// Choose what you want MediaPackage to do with the ad markers.
  ///
  /// Value description:
  ///
  /// <ul>
  /// <li>
  /// DATERANGE - Insert EXT-X-DATERANGE tags to signal ad and program transition
  /// events in TS and CMAF manifests. If you use DATERANGE, you must set a
  /// programDateTimeIntervalSeconds value of 1 or higher. To learn more about
  /// DATERANGE, see <a
  /// href="http://docs.aws.amazon.com/mediapackage/latest/ug/scte-35-ad-marker-ext-x-daterange.html">SCTE-35
  /// Ad Marker EXT-X-DATERANGE</a>.
  /// </li>
  /// </ul>
  final AdMarkerHls? adMarkerHls;

  ScteHls({
    this.adMarkerHls,
  });

  factory ScteHls.fromJson(Map<String, dynamic> json) {
    return ScteHls(
      adMarkerHls: (json['AdMarkerHls'] as String?)?.toAdMarkerHls(),
    );
  }

  Map<String, dynamic> toJson() {
    final adMarkerHls = this.adMarkerHls;
    return {
      if (adMarkerHls != null) 'AdMarkerHls': adMarkerHls.toValue(),
    };
  }
}

/// The segment configuration, including the segment name, duration, and other
/// configuration values.
class Segment {
  final Encryption? encryption;

  /// When selected, the stream set includes an additional I-frame only stream,
  /// along with the other tracks. If false, this extra stream is not included.
  /// MediaPackage generates an I-frame only stream from the first rendition in
  /// the manifest. The service inserts EXT-I-FRAMES-ONLY tags in the output
  /// manifest, and then generates and includes an I-frames only playlist in the
  /// stream. This playlist permits player functionality like fast forward and
  /// rewind.
  final bool? includeIframeOnlyStreams;

  /// The SCTE configuration options in the segment settings.
  final Scte? scte;

  /// The duration (in seconds) of each segment. Enter a value equal to, or a
  /// multiple of, the input segment duration. If the value that you enter is
  /// different from the input segment duration, MediaPackage rounds segments to
  /// the nearest multiple of the input segment duration.
  final int? segmentDurationSeconds;

  /// The name that describes the segment. The name is the base name of the
  /// segment used in all content manifests inside of the endpoint. You can't use
  /// spaces in the name.
  final String? segmentName;

  /// By default, MediaPackage excludes all digital video broadcasting (DVB)
  /// subtitles from the output. When selected, MediaPackage passes through DVB
  /// subtitles into the output.
  final bool? tsIncludeDvbSubtitles;

  /// When selected, MediaPackage bundles all audio tracks in a rendition group.
  /// All other tracks in the stream can be used with any audio rendition from the
  /// group.
  final bool? tsUseAudioRenditionGroup;

  Segment({
    this.encryption,
    this.includeIframeOnlyStreams,
    this.scte,
    this.segmentDurationSeconds,
    this.segmentName,
    this.tsIncludeDvbSubtitles,
    this.tsUseAudioRenditionGroup,
  });

  factory Segment.fromJson(Map<String, dynamic> json) {
    return Segment(
      encryption: json['Encryption'] != null
          ? Encryption.fromJson(json['Encryption'] as Map<String, dynamic>)
          : null,
      includeIframeOnlyStreams: json['IncludeIframeOnlyStreams'] as bool?,
      scte: json['Scte'] != null
          ? Scte.fromJson(json['Scte'] as Map<String, dynamic>)
          : null,
      segmentDurationSeconds: json['SegmentDurationSeconds'] as int?,
      segmentName: json['SegmentName'] as String?,
      tsIncludeDvbSubtitles: json['TsIncludeDvbSubtitles'] as bool?,
      tsUseAudioRenditionGroup: json['TsUseAudioRenditionGroup'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryption = this.encryption;
    final includeIframeOnlyStreams = this.includeIframeOnlyStreams;
    final scte = this.scte;
    final segmentDurationSeconds = this.segmentDurationSeconds;
    final segmentName = this.segmentName;
    final tsIncludeDvbSubtitles = this.tsIncludeDvbSubtitles;
    final tsUseAudioRenditionGroup = this.tsUseAudioRenditionGroup;
    return {
      if (encryption != null) 'Encryption': encryption,
      if (includeIframeOnlyStreams != null)
        'IncludeIframeOnlyStreams': includeIframeOnlyStreams,
      if (scte != null) 'Scte': scte,
      if (segmentDurationSeconds != null)
        'SegmentDurationSeconds': segmentDurationSeconds,
      if (segmentName != null) 'SegmentName': segmentName,
      if (tsIncludeDvbSubtitles != null)
        'TsIncludeDvbSubtitles': tsIncludeDvbSubtitles,
      if (tsUseAudioRenditionGroup != null)
        'TsUseAudioRenditionGroup': tsUseAudioRenditionGroup,
    };
  }
}

/// The parameters for the SPEKE key provider.
class SpekeKeyProvider {
  /// The DRM solution provider you're using to protect your content during
  /// distribution.
  final List<DrmSystem> drmSystems;

  /// Configure one or more content encryption keys for your endpoints that use
  /// SPEKE Version 2.0. The encryption contract defines which content keys are
  /// used to encrypt the audio and video tracks in your stream. To configure the
  /// encryption contract, specify which audio and video encryption presets to
  /// use.
  final EncryptionContractConfiguration encryptionContractConfiguration;

  /// The unique identifier for the content. The service sends this to the key
  /// server to identify the current endpoint. How unique you make this depends on
  /// how fine-grained you want access controls to be. The service does not permit
  /// you to use the same ID for two simultaneous encryption processes. The
  /// resource ID is also known as the content ID.
  ///
  /// The following example shows a resource ID:
  /// <code>MovieNight20171126093045</code>
  final String resourceId;

  /// The ARN for the IAM role granted by the key provider that provides access to
  /// the key provider API. This role must have a trust policy that allows
  /// MediaPackage to assume the role, and it must have a sufficient permissions
  /// policy to allow access to the specific key retrieval URL. Get this from your
  /// DRM solution provider.
  ///
  /// Valid format: <code>arn:aws:iam::{accountID}:role/{name}</code>. The
  /// following example shows a role ARN:
  /// <code>arn:aws:iam::444455556666:role/SpekeAccess</code>
  final String roleArn;

  /// The URL of the API Gateway proxy that you set up to talk to your key server.
  /// The API Gateway proxy must reside in the same AWS Region as MediaPackage and
  /// must start with https://.
  ///
  /// The following example shows a URL:
  /// <code>https://1wm2dx1f33.execute-api.us-west-2.amazonaws.com/SpekeSample/copyProtection</code>
  final String url;

  SpekeKeyProvider({
    required this.drmSystems,
    required this.encryptionContractConfiguration,
    required this.resourceId,
    required this.roleArn,
    required this.url,
  });

  factory SpekeKeyProvider.fromJson(Map<String, dynamic> json) {
    return SpekeKeyProvider(
      drmSystems: (json['DrmSystems'] as List)
          .whereNotNull()
          .map((e) => (e as String).toDrmSystem())
          .toList(),
      encryptionContractConfiguration: EncryptionContractConfiguration.fromJson(
          json['EncryptionContractConfiguration'] as Map<String, dynamic>),
      resourceId: json['ResourceId'] as String,
      roleArn: json['RoleArn'] as String,
      url: json['Url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final drmSystems = this.drmSystems;
    final encryptionContractConfiguration =
        this.encryptionContractConfiguration;
    final resourceId = this.resourceId;
    final roleArn = this.roleArn;
    final url = this.url;
    return {
      'DrmSystems': drmSystems.map((e) => e.toValue()).toList(),
      'EncryptionContractConfiguration': encryptionContractConfiguration,
      'ResourceId': resourceId,
      'RoleArn': roleArn,
      'Url': url,
    };
  }
}

enum TsEncryptionMethod {
  aes_128,
  sampleAes,
}

extension TsEncryptionMethodValueExtension on TsEncryptionMethod {
  String toValue() {
    switch (this) {
      case TsEncryptionMethod.aes_128:
        return 'AES_128';
      case TsEncryptionMethod.sampleAes:
        return 'SAMPLE_AES';
    }
  }
}

extension TsEncryptionMethodFromString on String {
  TsEncryptionMethod toTsEncryptionMethod() {
    switch (this) {
      case 'AES_128':
        return TsEncryptionMethod.aes_128;
      case 'SAMPLE_AES':
        return TsEncryptionMethod.sampleAes;
    }
    throw Exception('$this is not known in enum TsEncryptionMethod');
  }
}

class UpdateChannelGroupResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The date and time the channel group was created.
  final DateTime createdAt;

  /// The output domain where the source stream is sent. Integrate the domain with
  /// a downstream CDN (such as Amazon CloudFront) or playback device.
  final String egressDomain;

  /// The date and time the channel group was modified.
  final DateTime modifiedAt;

  /// The description for your channel group.
  final String? description;

  /// The comma-separated list of tag key:value pairs assigned to the channel
  /// group.
  final Map<String, String>? tags;

  UpdateChannelGroupResponse({
    required this.arn,
    required this.channelGroupName,
    required this.createdAt,
    required this.egressDomain,
    required this.modifiedAt,
    this.description,
    this.tags,
  });

  factory UpdateChannelGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChannelGroupResponse(
      arn: json['Arn'] as String,
      channelGroupName: json['ChannelGroupName'] as String,
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      egressDomain: json['EgressDomain'] as String,
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] as Object),
      description: json['Description'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final createdAt = this.createdAt;
    final egressDomain = this.egressDomain;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'EgressDomain': egressDomain,
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
      if (tags != null) 'tags': tags,
    };
  }
}

class UpdateChannelResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The date and time the channel was created.
  final DateTime createdAt;

  /// The date and time the channel was modified.
  final DateTime modifiedAt;

  /// The description for your channel.
  final String? description;
  final List<IngestEndpoint>? ingestEndpoints;

  /// The comma-separated list of tag key:value pairs assigned to the channel.
  final Map<String, String>? tags;

  UpdateChannelResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.createdAt,
    required this.modifiedAt,
    this.description,
    this.ingestEndpoints,
    this.tags,
  });

  factory UpdateChannelResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChannelResponse(
      arn: json['Arn'] as String,
      channelGroupName: json['ChannelGroupName'] as String,
      channelName: json['ChannelName'] as String,
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] as Object),
      description: json['Description'] as String?,
      ingestEndpoints: (json['IngestEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => IngestEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    final ingestEndpoints = this.ingestEndpoints;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
      if (ingestEndpoints != null) 'IngestEndpoints': ingestEndpoints,
      if (tags != null) 'tags': tags,
    };
  }
}

class UpdateOriginEndpointResponse {
  /// The ARN associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The type of container attached to this origin endpoint.
  final ContainerType containerType;

  /// The date and time the origin endpoint was created.
  final DateTime createdAt;

  /// The date and time the origin endpoint was modified.
  final DateTime modifiedAt;

  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your account
  /// in the AWS Region and channel.
  final String originEndpointName;

  /// The segment configuration, including the segment name, duration, and other
  /// configuration values.
  final Segment segment;

  /// The description of the origin endpoint.
  final String? description;

  /// An HTTP live streaming (HLS) manifest configuration.
  final List<GetHlsManifestConfiguration>? hlsManifests;

  /// A low-latency HLS manifest configuration.
  final List<GetLowLatencyHlsManifestConfiguration>? lowLatencyHlsManifests;

  /// The size of the window (in seconds) to create a window of the live stream
  /// that's available for on-demand viewing. Viewers can start-over or catch-up
  /// on content that falls within the window.
  final int? startoverWindowSeconds;

  /// The comma-separated list of tag key:value pairs assigned to the origin
  /// endpoint.
  final Map<String, String>? tags;

  UpdateOriginEndpointResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.containerType,
    required this.createdAt,
    required this.modifiedAt,
    required this.originEndpointName,
    required this.segment,
    this.description,
    this.hlsManifests,
    this.lowLatencyHlsManifests,
    this.startoverWindowSeconds,
    this.tags,
  });

  factory UpdateOriginEndpointResponse.fromJson(Map<String, dynamic> json) {
    return UpdateOriginEndpointResponse(
      arn: json['Arn'] as String,
      channelGroupName: json['ChannelGroupName'] as String,
      channelName: json['ChannelName'] as String,
      containerType: (json['ContainerType'] as String).toContainerType(),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] as Object),
      originEndpointName: json['OriginEndpointName'] as String,
      segment: Segment.fromJson(json['Segment'] as Map<String, dynamic>),
      description: json['Description'] as String?,
      hlsManifests: (json['HlsManifests'] as List?)
          ?.whereNotNull()
          .map((e) =>
              GetHlsManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      lowLatencyHlsManifests: (json['LowLatencyHlsManifests'] as List?)
          ?.whereNotNull()
          .map((e) => GetLowLatencyHlsManifestConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      startoverWindowSeconds: json['StartoverWindowSeconds'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final containerType = this.containerType;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final originEndpointName = this.originEndpointName;
    final segment = this.segment;
    final description = this.description;
    final hlsManifests = this.hlsManifests;
    final lowLatencyHlsManifests = this.lowLatencyHlsManifests;
    final startoverWindowSeconds = this.startoverWindowSeconds;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'ContainerType': containerType.toValue(),
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      'OriginEndpointName': originEndpointName,
      'Segment': segment,
      if (description != null) 'Description': description,
      if (hlsManifests != null) 'HlsManifests': hlsManifests,
      if (lowLatencyHlsManifests != null)
        'LowLatencyHlsManifests': lowLatencyHlsManifests,
      if (startoverWindowSeconds != null)
        'StartoverWindowSeconds': startoverWindowSeconds,
      if (tags != null) 'tags': tags,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
