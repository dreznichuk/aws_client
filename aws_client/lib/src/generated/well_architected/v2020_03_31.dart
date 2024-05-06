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

/// This is the <i>Well-Architected Tool API Reference</i>. The WA Tool API
/// provides programmatic access to the <a
/// href="http://aws.amazon.com/well-architected-tool">Well-Architected Tool</a>
/// in the <a href="https://console.aws.amazon.com/wellarchitected">Amazon Web
/// Services Management Console</a>. For information about the Well-Architected
/// Tool, see the <a
/// href="https://docs.aws.amazon.com/wellarchitected/latest/userguide/intro.html">Well-Architected
/// Tool User Guide</a>.
class WellArchitected {
  final _s.RestJsonProtocol _protocol;
  WellArchitected({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'wellarchitected',
            signingName: 'wellarchitected',
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

  /// Associate a lens to a workload.
  ///
  /// Up to 10 lenses can be associated with a workload in a single API
  /// operation. A maximum of 20 lenses can be associated with a workload.
  /// <note>
  /// <b>Disclaimer</b>
  ///
  /// By accessing and/or applying custom lenses created by another Amazon Web
  /// Services user or account, you acknowledge that custom lenses created by
  /// other users and shared with you are Third Party Content as defined in the
  /// Amazon Web Services Customer Agreement.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> associateLenses({
    required List<String> lensAliases,
    required String workloadId,
  }) async {
    final $payload = <String, dynamic>{
      'LensAliases': lensAliases,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/associateLenses',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Create a lens share.
  ///
  /// The owner of a lens can share it with other Amazon Web Services accounts,
  /// users, an organization, and organizational units (OUs) in the same Amazon
  /// Web Services Region. Lenses provided by Amazon Web Services (Amazon Web
  /// Services Official Content) cannot be shared.
  ///
  /// Shared access to a lens is not removed until the lens invitation is
  /// deleted.
  ///
  /// If you share a lens with an organization or OU, all accounts in the
  /// organization or OU are granted access to the lens.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/wellarchitected/latest/userguide/lenses-sharing.html">Sharing
  /// a custom lens</a> in the <i>Well-Architected Tool User Guide</i>.
  /// <note>
  /// <b>Disclaimer</b>
  ///
  /// By sharing your custom lenses with other Amazon Web Services accounts, you
  /// acknowledge that Amazon Web Services will make your custom lenses
  /// available to those other accounts. Those other accounts may continue to
  /// access and use your shared custom lenses even if you delete the custom
  /// lenses from your own Amazon Web Services account or terminate your Amazon
  /// Web Services account.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<CreateLensShareOutput> createLensShare({
    required String lensAlias,
    required String sharedWith,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'SharedWith': sharedWith,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/lenses/${Uri.encodeQueryComponent(lensAlias).replaceAll('+', '%20')}/shares',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLensShareOutput.fromJson(response);
  }

  /// Create a new lens version.
  ///
  /// A lens can have up to 100 versions.
  ///
  /// Use this operation to publish a new lens version after you have imported a
  /// lens. The <code>LensAlias</code> is used to identify the lens to be
  /// published. The owner of a lens can share the lens with other Amazon Web
  /// Services accounts and users in the same Amazon Web Services Region. Only
  /// the owner of a lens can delete it.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [lensVersion] :
  /// The version of the lens being created.
  ///
  /// Parameter [isMajorVersion] :
  /// Set to true if this new major lens version.
  Future<CreateLensVersionOutput> createLensVersion({
    required String lensAlias,
    required String lensVersion,
    String? clientRequestToken,
    bool? isMajorVersion,
  }) async {
    final $payload = <String, dynamic>{
      'LensVersion': lensVersion,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (isMajorVersion != null) 'IsMajorVersion': isMajorVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/lenses/${Uri.encodeQueryComponent(lensAlias).replaceAll('+', '%20')}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLensVersionOutput.fromJson(response);
  }

  /// Create a milestone for an existing workload.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<CreateMilestoneOutput> createMilestone({
    required String milestoneName,
    required String workloadId,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'MilestoneName': milestoneName,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/milestones',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMilestoneOutput.fromJson(response);
  }

  /// Create a new workload.
  ///
  /// The owner of a workload can share the workload with other Amazon Web
  /// Services accounts, users, an organization, and organizational units (OUs)
  /// in the same Amazon Web Services Region. Only the owner of a workload can
  /// delete it.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/wellarchitected/latest/userguide/define-workload.html">Defining
  /// a Workload</a> in the <i>Well-Architected Tool User Guide</i>.
  /// <important>
  /// Either <code>AwsRegions</code>, <code>NonAwsRegions</code>, or both must
  /// be specified when creating a workload.
  ///
  /// You also must specify <code>ReviewOwner</code>, even though the parameter
  /// is listed as not being required in the following section.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [applications] :
  /// List of AppRegistry application ARNs associated to the workload.
  ///
  /// Parameter [discoveryConfig] :
  /// Well-Architected discovery configuration settings associated to the
  /// workload.
  ///
  /// Parameter [tags] :
  /// The tags to be associated with the workload.
  Future<CreateWorkloadOutput> createWorkload({
    required String description,
    required WorkloadEnvironment environment,
    required List<String> lenses,
    required String workloadName,
    List<String>? accountIds,
    List<String>? applications,
    String? architecturalDesign,
    List<String>? awsRegions,
    String? clientRequestToken,
    WorkloadDiscoveryConfig? discoveryConfig,
    String? industry,
    String? industryType,
    List<String>? nonAwsRegions,
    String? notes,
    List<String>? pillarPriorities,
    String? reviewOwner,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Description': description,
      'Environment': environment.toValue(),
      'Lenses': lenses,
      'WorkloadName': workloadName,
      if (accountIds != null) 'AccountIds': accountIds,
      if (applications != null) 'Applications': applications,
      if (architecturalDesign != null)
        'ArchitecturalDesign': architecturalDesign,
      if (awsRegions != null) 'AwsRegions': awsRegions,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (discoveryConfig != null) 'DiscoveryConfig': discoveryConfig,
      if (industry != null) 'Industry': industry,
      if (industryType != null) 'IndustryType': industryType,
      if (nonAwsRegions != null) 'NonAwsRegions': nonAwsRegions,
      if (notes != null) 'Notes': notes,
      if (pillarPriorities != null) 'PillarPriorities': pillarPriorities,
      if (reviewOwner != null) 'ReviewOwner': reviewOwner,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workloads',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkloadOutput.fromJson(response);
  }

  /// Create a workload share.
  ///
  /// The owner of a workload can share it with other Amazon Web Services
  /// accounts and users in the same Amazon Web Services Region. Shared access
  /// to a workload is not removed until the workload invitation is deleted.
  ///
  /// If you share a workload with an organization or OU, all accounts in the
  /// organization or OU are granted access to the workload.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/wellarchitected/latest/userguide/workloads-sharing.html">Sharing
  /// a workload</a> in the <i>Well-Architected Tool User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<CreateWorkloadShareOutput> createWorkloadShare({
    required PermissionType permissionType,
    required String sharedWith,
    required String workloadId,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'PermissionType': permissionType.toValue(),
      'SharedWith': sharedWith,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/shares',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkloadShareOutput.fromJson(response);
  }

  /// Delete an existing lens.
  ///
  /// Only the owner of a lens can delete it. After the lens is deleted, Amazon
  /// Web Services accounts and users that you shared the lens with can continue
  /// to use it, but they will no longer be able to apply it to new workloads.
  /// <note>
  /// <b>Disclaimer</b>
  ///
  /// By sharing your custom lenses with other Amazon Web Services accounts, you
  /// acknowledge that Amazon Web Services will make your custom lenses
  /// available to those other accounts. Those other accounts may continue to
  /// access and use your shared custom lenses even if you delete the custom
  /// lenses from your own Amazon Web Services account or terminate your Amazon
  /// Web Services account.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [lensStatus] :
  /// The status of the lens to be deleted.
  Future<void> deleteLens({
    required String lensAlias,
    required LensStatusType lensStatus,
    String? clientRequestToken,
  }) async {
    final $query = <String, List<String>>{
      'LensStatus': [lensStatus.toValue()],
      if (clientRequestToken != null)
        'ClientRequestToken': [clientRequestToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/lenses/${Uri.encodeQueryComponent(lensAlias).replaceAll('+', '%20')}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a lens share.
  ///
  /// After the lens share is deleted, Amazon Web Services accounts, users,
  /// organizations, and organizational units (OUs) that you shared the lens
  /// with can continue to use it, but they will no longer be able to apply it
  /// to new workloads.
  /// <note>
  /// <b>Disclaimer</b>
  ///
  /// By sharing your custom lenses with other Amazon Web Services accounts, you
  /// acknowledge that Amazon Web Services will make your custom lenses
  /// available to those other accounts. Those other accounts may continue to
  /// access and use your shared custom lenses even if you delete the custom
  /// lenses from your own Amazon Web Services account or terminate your Amazon
  /// Web Services account.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> deleteLensShare({
    required String lensAlias,
    required String shareId,
    String? clientRequestToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientRequestToken != null)
        'ClientRequestToken': [clientRequestToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/lenses/%24%7BUri.encodeQueryComponent%28lensAlias%29.replaceAll%28%27%2B%27%2C%20%27%2520%27%29%7D/shares/${Uri.encodeQueryComponent(shareId).replaceAll('+', '%20')}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete an existing workload.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> deleteWorkload({
    required String workloadId,
    String? clientRequestToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientRequestToken != null)
        'ClientRequestToken': [clientRequestToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a workload share.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> deleteWorkloadShare({
    required String shareId,
    required String workloadId,
    String? clientRequestToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientRequestToken != null)
        'ClientRequestToken': [clientRequestToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/shares/%24%7BUri.encodeQueryComponent%28shareId%29.replaceAll%28%27%2B%27%2C%20%27%2520%27%29%7D',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociate a lens from a workload.
  ///
  /// Up to 10 lenses can be disassociated from a workload in a single API
  /// operation.
  /// <note>
  /// The Amazon Web Services Well-Architected Framework lens
  /// (<code>wellarchitected</code>) cannot be removed from a workload.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> disassociateLenses({
    required List<String> lensAliases,
    required String workloadId,
  }) async {
    final $payload = <String, dynamic>{
      'LensAliases': lensAliases,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/disassociateLenses',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Export an existing lens.
  ///
  /// Only the owner of a lens can export it. Lenses provided by Amazon Web
  /// Services (Amazon Web Services Official Content) cannot be exported.
  ///
  /// Lenses are defined in JSON. For more information, see <a
  /// href="https://docs.aws.amazon.com/wellarchitected/latest/userguide/lenses-format-specification.html">JSON
  /// format specification</a> in the <i>Well-Architected Tool User Guide</i>.
  /// <note>
  /// <b>Disclaimer</b>
  ///
  /// Do not include or gather personal identifiable information (PII) of end
  /// users or other identifiable individuals in or via your custom lenses. If
  /// your custom lens or those shared with you and used in your account do
  /// include or collect PII you are responsible for: ensuring that the included
  /// PII is processed in accordance with applicable law, providing adequate
  /// privacy notices, and obtaining necessary consents for processing such
  /// data.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [lensVersion] :
  /// The lens version to be exported.
  Future<ExportLensOutput> exportLens({
    required String lensAlias,
    String? lensVersion,
  }) async {
    final $query = <String, List<String>>{
      if (lensVersion != null) 'LensVersion': [lensVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/lenses/${Uri.encodeQueryComponent(lensAlias).replaceAll('+', '%20')}/export',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ExportLensOutput.fromJson(response);
  }

  /// Get the answer to a specific question in a workload review.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<GetAnswerOutput> getAnswer({
    required String lensAlias,
    required String questionId,
    required String workloadId,
    int? milestoneNumber,
  }) async {
    _s.validateNumRange(
      'milestoneNumber',
      milestoneNumber,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (milestoneNumber != null)
        'MilestoneNumber': [milestoneNumber.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/lensReviews/%2524%257BUri.encodeQueryComponent%2528lensAlias%2529.replaceAll%2528%2527%252B%2527%252C%2520%2527%252520%2527%2529%257D/answers/%24%7BUri.encodeQueryComponent%28questionId%29.replaceAll%28%27%2B%27%2C%20%27%2520%27%29%7D',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAnswerOutput.fromJson(response);
  }

  /// Get a consolidated report of your workloads.
  ///
  /// You can optionally choose to include workloads that have been shared with
  /// you.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [format] :
  /// The format of the consolidated report.
  ///
  /// For <code>PDF</code>, <code>Base64String</code> is returned. For
  /// <code>JSON</code>, <code>Metrics</code> is returned.
  ///
  /// Parameter [includeSharedResources] :
  /// Set to <code>true</code> to have shared resources included in the report.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for this request.
  Future<GetConsolidatedReportOutput> getConsolidatedReport({
    required ReportFormat format,
    bool? includeSharedResources,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      15,
    );
    final $query = <String, List<String>>{
      'Format': [format.toValue()],
      if (includeSharedResources != null)
        'IncludeSharedResources': [includeSharedResources.toString()],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/consolidatedReport',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetConsolidatedReportOutput.fromJson(response);
  }

  /// Get an existing lens.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [lensVersion] :
  /// The lens version to be retrieved.
  Future<GetLensOutput> getLens({
    required String lensAlias,
    String? lensVersion,
  }) async {
    final $query = <String, List<String>>{
      if (lensVersion != null) 'LensVersion': [lensVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/lenses/${Uri.encodeQueryComponent(lensAlias).replaceAll('+', '%20')}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLensOutput.fromJson(response);
  }

  /// Get lens review.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<GetLensReviewOutput> getLensReview({
    required String lensAlias,
    required String workloadId,
    int? milestoneNumber,
  }) async {
    _s.validateNumRange(
      'milestoneNumber',
      milestoneNumber,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (milestoneNumber != null)
        'MilestoneNumber': [milestoneNumber.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/lensReviews/%24%7BUri.encodeQueryComponent%28lensAlias%29.replaceAll%28%27%2B%27%2C%20%27%2520%27%29%7D',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLensReviewOutput.fromJson(response);
  }

  /// Get lens review report.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<GetLensReviewReportOutput> getLensReviewReport({
    required String lensAlias,
    required String workloadId,
    int? milestoneNumber,
  }) async {
    _s.validateNumRange(
      'milestoneNumber',
      milestoneNumber,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (milestoneNumber != null)
        'MilestoneNumber': [milestoneNumber.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/lensReviews/%24%7BUri.encodeQueryComponent%28lensAlias%29.replaceAll%28%27%2B%27%2C%20%27%2520%27%29%7D/report',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLensReviewReportOutput.fromJson(response);
  }

  /// Get lens version differences.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [baseLensVersion] :
  /// The base version of the lens.
  ///
  /// Parameter [targetLensVersion] :
  /// The lens version to target a difference for.
  Future<GetLensVersionDifferenceOutput> getLensVersionDifference({
    required String lensAlias,
    String? baseLensVersion,
    String? targetLensVersion,
  }) async {
    final $query = <String, List<String>>{
      if (baseLensVersion != null) 'BaseLensVersion': [baseLensVersion],
      if (targetLensVersion != null) 'TargetLensVersion': [targetLensVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/lenses/${Uri.encodeQueryComponent(lensAlias).replaceAll('+', '%20')}/versionDifference',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLensVersionDifferenceOutput.fromJson(response);
  }

  /// Get a milestone for an existing workload.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<GetMilestoneOutput> getMilestone({
    required int milestoneNumber,
    required String workloadId,
  }) async {
    _s.validateNumRange(
      'milestoneNumber',
      milestoneNumber,
      1,
      100,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/milestones/%24%7BUri.encodeQueryComponent%28milestoneNumber.toString%28%29%29.replaceAll%28%27%2B%27%2C%20%27%2520%27%29%7D',
      exceptionFnMap: _exceptionFns,
    );
    return GetMilestoneOutput.fromJson(response);
  }

  /// Get an existing workload.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<GetWorkloadOutput> getWorkload({
    required String workloadId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkloadOutput.fromJson(response);
  }

  /// Import a new custom lens or update an existing custom lens.
  ///
  /// To update an existing custom lens, specify its ARN as the
  /// <code>LensAlias</code>. If no ARN is specified, a new custom lens is
  /// created.
  ///
  /// The new or updated lens will have a status of <code>DRAFT</code>. The lens
  /// cannot be applied to workloads or shared with other Amazon Web Services
  /// accounts until it's published with <a>CreateLensVersion</a>.
  ///
  /// Lenses are defined in JSON. For more information, see <a
  /// href="https://docs.aws.amazon.com/wellarchitected/latest/userguide/lenses-format-specification.html">JSON
  /// format specification</a> in the <i>Well-Architected Tool User Guide</i>.
  ///
  /// A custom lens cannot exceed 500 KB in size.
  /// <note>
  /// <b>Disclaimer</b>
  ///
  /// Do not include or gather personal identifiable information (PII) of end
  /// users or other identifiable individuals in or via your custom lenses. If
  /// your custom lens or those shared with you and used in your account do
  /// include or collect PII you are responsible for: ensuring that the included
  /// PII is processed in accordance with applicable law, providing adequate
  /// privacy notices, and obtaining necessary consents for processing such
  /// data.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jSONString] :
  /// The JSON representation of a lens.
  ///
  /// Parameter [tags] :
  /// Tags to associate to a lens.
  Future<ImportLensOutput> importLens({
    required String jSONString,
    String? clientRequestToken,
    String? lensAlias,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'JSONString': jSONString,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/importLens',
      exceptionFnMap: _exceptionFns,
    );
    return ImportLensOutput.fromJson(response);
  }

  /// List of answers for a particular workload and lens.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for this request.
  Future<ListAnswersOutput> listAnswers({
    required String lensAlias,
    required String workloadId,
    int? maxResults,
    int? milestoneNumber,
    String? nextToken,
    String? pillarId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateNumRange(
      'milestoneNumber',
      milestoneNumber,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (milestoneNumber != null)
        'MilestoneNumber': [milestoneNumber.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (pillarId != null) 'PillarId': [pillarId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/lensReviews/%24%7BUri.encodeQueryComponent%28lensAlias%29.replaceAll%28%27%2B%27%2C%20%27%2520%27%29%7D/answers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAnswersOutput.fromJson(response);
  }

  /// List of Trusted Advisor check details by account related to the workload.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [lensArn] :
  /// Well-Architected Lens ARN.
  Future<ListCheckDetailsOutput> listCheckDetails({
    required String choiceId,
    required String lensArn,
    required String pillarId,
    required String questionId,
    required String workloadId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      'ChoiceId': choiceId,
      'LensArn': lensArn,
      'PillarId': pillarId,
      'QuestionId': questionId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/checks',
      exceptionFnMap: _exceptionFns,
    );
    return ListCheckDetailsOutput.fromJson(response);
  }

  /// List of Trusted Advisor checks summarized for all accounts related to the
  /// workload.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [lensArn] :
  /// Well-Architected Lens ARN.
  Future<ListCheckSummariesOutput> listCheckSummaries({
    required String choiceId,
    required String lensArn,
    required String pillarId,
    required String questionId,
    required String workloadId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      'ChoiceId': choiceId,
      'LensArn': lensArn,
      'PillarId': pillarId,
      'QuestionId': questionId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/checkSummaries',
      exceptionFnMap: _exceptionFns,
    );
    return ListCheckSummariesOutput.fromJson(response);
  }

  /// List lens review improvements.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for this request.
  Future<ListLensReviewImprovementsOutput> listLensReviewImprovements({
    required String lensAlias,
    required String workloadId,
    int? maxResults,
    int? milestoneNumber,
    String? nextToken,
    String? pillarId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateNumRange(
      'milestoneNumber',
      milestoneNumber,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (milestoneNumber != null)
        'MilestoneNumber': [milestoneNumber.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (pillarId != null) 'PillarId': [pillarId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/lensReviews/%24%7BUri.encodeQueryComponent%28lensAlias%29.replaceAll%28%27%2B%27%2C%20%27%2520%27%29%7D/improvements',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLensReviewImprovementsOutput.fromJson(response);
  }

  /// List lens reviews for a particular workload.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<ListLensReviewsOutput> listLensReviews({
    required String workloadId,
    int? maxResults,
    int? milestoneNumber,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateNumRange(
      'milestoneNumber',
      milestoneNumber,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (milestoneNumber != null)
        'MilestoneNumber': [milestoneNumber.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/lensReviews',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLensReviewsOutput.fromJson(response);
  }

  /// List the lens shares associated with the lens.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for this request.
  ///
  /// Parameter [sharedWithPrefix] :
  /// The Amazon Web Services account ID, IAM role, organization ID, or
  /// organizational unit (OU) ID with which the lens is shared.
  Future<ListLensSharesOutput> listLensShares({
    required String lensAlias,
    int? maxResults,
    String? nextToken,
    String? sharedWithPrefix,
    ShareStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (sharedWithPrefix != null) 'SharedWithPrefix': [sharedWithPrefix],
      if (status != null) 'Status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/lenses/${Uri.encodeQueryComponent(lensAlias).replaceAll('+', '%20')}/shares',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLensSharesOutput.fromJson(response);
  }

  /// List the available lenses.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [lensStatus] :
  /// The status of lenses to be returned.
  ///
  /// Parameter [lensType] :
  /// The type of lenses to be returned.
  Future<ListLensesOutput> listLenses({
    String? lensName,
    LensStatusType? lensStatus,
    LensType? lensType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (lensName != null) 'LensName': [lensName],
      if (lensStatus != null) 'LensStatus': [lensStatus.toValue()],
      if (lensType != null) 'LensType': [lensType.toValue()],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/lenses',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLensesOutput.fromJson(response);
  }

  /// List all milestones for an existing workload.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<ListMilestonesOutput> listMilestones({
    required String workloadId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/milestonesSummaries',
      exceptionFnMap: _exceptionFns,
    );
    return ListMilestonesOutput.fromJson(response);
  }

  /// List lens notifications.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for this request.
  Future<ListNotificationsOutput> listNotifications({
    int? maxResults,
    String? nextToken,
    String? workloadId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/notifications',
      exceptionFnMap: _exceptionFns,
    );
    return ListNotificationsOutput.fromJson(response);
  }

  /// List the workload invitations.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [lensNamePrefix] :
  /// An optional string added to the beginning of each lens name returned in
  /// the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for this request.
  ///
  /// Parameter [shareResourceType] :
  /// The type of share invitations to be returned.
  Future<ListShareInvitationsOutput> listShareInvitations({
    String? lensNamePrefix,
    int? maxResults,
    String? nextToken,
    ShareResourceType? shareResourceType,
    String? workloadNamePrefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (lensNamePrefix != null) 'LensNamePrefix': [lensNamePrefix],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (shareResourceType != null)
        'ShareResourceType': [shareResourceType.toValue()],
      if (workloadNamePrefix != null)
        'WorkloadNamePrefix': [workloadNamePrefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/shareInvitations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListShareInvitationsOutput.fromJson(response);
  }

  /// List the tags for a resource.
  /// <note>
  /// The WorkloadArn parameter can be either a workload ARN or a custom lens
  /// ARN.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String workloadArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/tags/${Uri.encodeQueryComponent(workloadArn).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// List the workload shares associated with the workload.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for this request.
  ///
  /// Parameter [sharedWithPrefix] :
  /// The Amazon Web Services account ID, IAM role, organization ID, or
  /// organizational unit (OU) ID with which the workload is shared.
  Future<ListWorkloadSharesOutput> listWorkloadShares({
    required String workloadId,
    int? maxResults,
    String? nextToken,
    String? sharedWithPrefix,
    ShareStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (sharedWithPrefix != null) 'SharedWithPrefix': [sharedWithPrefix],
      if (status != null) 'Status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/shares',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkloadSharesOutput.fromJson(response);
  }

  /// Paginated list of workloads.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for this request.
  Future<ListWorkloadsOutput> listWorkloads({
    int? maxResults,
    String? nextToken,
    String? workloadNamePrefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadNamePrefix != null) 'WorkloadNamePrefix': workloadNamePrefix,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workloadsSummaries',
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkloadsOutput.fromJson(response);
  }

  /// Adds one or more tags to the specified resource.
  /// <note>
  /// The WorkloadArn parameter can be either a workload ARN or a custom lens
  /// ARN.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [tags] :
  /// The tags for the resource.
  Future<void> tagResource({
    required Map<String, String> tags,
    required String workloadArn,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tags/${Uri.encodeQueryComponent(workloadArn).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes specified tags from a resource.
  /// <note>
  /// The WorkloadArn parameter can be either a workload ARN or a custom lens
  /// ARN.
  /// </note>
  /// To specify multiple tags, use separate <b>tagKeys</b> parameters, for
  /// example:
  ///
  /// <code>DELETE /tags/WorkloadArn?tagKeys=key1&amp;tagKeys=key2</code>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys. Existing tags of the resource whose keys are members
  /// of this list are removed from the resource.
  Future<void> untagResource({
    required List<String> tagKeys,
    required String workloadArn,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/tags/${Uri.encodeQueryComponent(workloadArn).replaceAll('+', '%20')}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update the answer to a specific question in a workload review.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [choiceUpdates] :
  /// A list of choices to update on a question in your workload. The String key
  /// corresponds to the choice ID to be updated.
  ///
  /// Parameter [reason] :
  /// The reason why a question is not applicable to your workload.
  Future<UpdateAnswerOutput> updateAnswer({
    required String lensAlias,
    required String questionId,
    required String workloadId,
    Map<String, ChoiceUpdate>? choiceUpdates,
    bool? isApplicable,
    String? notes,
    AnswerReason? reason,
    List<String>? selectedChoices,
  }) async {
    final $payload = <String, dynamic>{
      if (choiceUpdates != null) 'ChoiceUpdates': choiceUpdates,
      if (isApplicable != null) 'IsApplicable': isApplicable,
      if (notes != null) 'Notes': notes,
      if (reason != null) 'Reason': reason.toValue(),
      if (selectedChoices != null) 'SelectedChoices': selectedChoices,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/lensReviews/%2524%257BUri.encodeQueryComponent%2528lensAlias%2529.replaceAll%2528%2527%252B%2527%252C%2520%2527%252520%2527%2529%257D/answers/%24%7BUri.encodeQueryComponent%28questionId%29.replaceAll%28%27%2B%27%2C%20%27%2520%27%29%7D',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAnswerOutput.fromJson(response);
  }

  /// Updates whether the Amazon Web Services account is opted into organization
  /// sharing and discovery integration features.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [discoveryIntegrationStatus] :
  /// The status of discovery support settings.
  ///
  /// Parameter [organizationSharingStatus] :
  /// The status of organization sharing settings.
  Future<void> updateGlobalSettings({
    DiscoveryIntegrationStatus? discoveryIntegrationStatus,
    OrganizationSharingStatus? organizationSharingStatus,
  }) async {
    final $payload = <String, dynamic>{
      if (discoveryIntegrationStatus != null)
        'DiscoveryIntegrationStatus': discoveryIntegrationStatus.toValue(),
      if (organizationSharingStatus != null)
        'OrganizationSharingStatus': organizationSharingStatus.toValue(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/global-settings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update lens review for a particular workload.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<UpdateLensReviewOutput> updateLensReview({
    required String lensAlias,
    required String workloadId,
    String? lensNotes,
    Map<String, String>? pillarNotes,
  }) async {
    final $payload = <String, dynamic>{
      if (lensNotes != null) 'LensNotes': lensNotes,
      if (pillarNotes != null) 'PillarNotes': pillarNotes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/lensReviews/%24%7BUri.encodeQueryComponent%28lensAlias%29.replaceAll%28%27%2B%27%2C%20%27%2520%27%29%7D',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLensReviewOutput.fromJson(response);
  }

  /// Update a workload or custom lens share invitation.
  /// <note>
  /// This API operation can be called independently of any resource. Previous
  /// documentation implied that a workload ARN must be specified.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [shareInvitationId] :
  /// The ID assigned to the share invitation.
  Future<UpdateShareInvitationOutput> updateShareInvitation({
    required ShareInvitationAction shareInvitationAction,
    required String shareInvitationId,
  }) async {
    final $payload = <String, dynamic>{
      'ShareInvitationAction': shareInvitationAction.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/shareInvitations/${Uri.encodeQueryComponent(shareInvitationId).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateShareInvitationOutput.fromJson(response);
  }

  /// Update an existing workload.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [applications] :
  /// List of AppRegistry application ARNs to associate to the workload.
  ///
  /// Parameter [discoveryConfig] :
  /// Well-Architected discovery configuration settings to associate to the
  /// workload.
  ///
  /// Parameter [isReviewOwnerUpdateAcknowledged] :
  /// Flag indicating whether the workload owner has acknowledged that the
  /// <i>Review owner</i> field is required.
  ///
  /// If a <b>Review owner</b> is not added to the workload within 60 days of
  /// acknowledgement, access to the workload is restricted until an owner is
  /// added.
  Future<UpdateWorkloadOutput> updateWorkload({
    required String workloadId,
    List<String>? accountIds,
    List<String>? applications,
    String? architecturalDesign,
    List<String>? awsRegions,
    String? description,
    WorkloadDiscoveryConfig? discoveryConfig,
    WorkloadEnvironment? environment,
    WorkloadImprovementStatus? improvementStatus,
    String? industry,
    String? industryType,
    bool? isReviewOwnerUpdateAcknowledged,
    List<String>? nonAwsRegions,
    String? notes,
    List<String>? pillarPriorities,
    String? reviewOwner,
    String? workloadName,
  }) async {
    final $payload = <String, dynamic>{
      if (accountIds != null) 'AccountIds': accountIds,
      if (applications != null) 'Applications': applications,
      if (architecturalDesign != null)
        'ArchitecturalDesign': architecturalDesign,
      if (awsRegions != null) 'AwsRegions': awsRegions,
      if (description != null) 'Description': description,
      if (discoveryConfig != null) 'DiscoveryConfig': discoveryConfig,
      if (environment != null) 'Environment': environment.toValue(),
      if (improvementStatus != null)
        'ImprovementStatus': improvementStatus.toValue(),
      if (industry != null) 'Industry': industry,
      if (industryType != null) 'IndustryType': industryType,
      if (isReviewOwnerUpdateAcknowledged != null)
        'IsReviewOwnerUpdateAcknowledged': isReviewOwnerUpdateAcknowledged,
      if (nonAwsRegions != null) 'NonAwsRegions': nonAwsRegions,
      if (notes != null) 'Notes': notes,
      if (pillarPriorities != null) 'PillarPriorities': pillarPriorities,
      if (reviewOwner != null) 'ReviewOwner': reviewOwner,
      if (workloadName != null) 'WorkloadName': workloadName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkloadOutput.fromJson(response);
  }

  /// Update a workload share.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<UpdateWorkloadShareOutput> updateWorkloadShare({
    required PermissionType permissionType,
    required String shareId,
    required String workloadId,
  }) async {
    final $payload = <String, dynamic>{
      'PermissionType': permissionType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/shares/%24%7BUri.encodeQueryComponent%28shareId%29.replaceAll%28%27%2B%27%2C%20%27%2520%27%29%7D',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkloadShareOutput.fromJson(response);
  }

  /// Upgrade lens review for a particular workload.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> upgradeLensReview({
    required String lensAlias,
    required String milestoneName,
    required String workloadId,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'MilestoneName': milestoneName,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workloads/${Uri.encodeQueryComponent(workloadId).replaceAll('+', '%20')}/lensReviews/%24%7BUri.encodeQueryComponent%28lensAlias%29.replaceAll%28%27%2B%27%2C%20%27%2520%27%29%7D/upgrade',
      exceptionFnMap: _exceptionFns,
    );
  }
}

enum AdditionalResourceType {
  helpfulResource,
  improvementPlan,
}

extension AdditionalResourceTypeValueExtension on AdditionalResourceType {
  String toValue() {
    switch (this) {
      case AdditionalResourceType.helpfulResource:
        return 'HELPFUL_RESOURCE';
      case AdditionalResourceType.improvementPlan:
        return 'IMPROVEMENT_PLAN';
    }
  }
}

extension AdditionalResourceTypeFromString on String {
  AdditionalResourceType toAdditionalResourceType() {
    switch (this) {
      case 'HELPFUL_RESOURCE':
        return AdditionalResourceType.helpfulResource;
      case 'IMPROVEMENT_PLAN':
        return AdditionalResourceType.improvementPlan;
    }
    throw Exception('$this is not known in enum AdditionalResourceType');
  }
}

/// The choice level additional resources for a custom lens.
///
/// This field does not apply to Amazon Web Services official lenses.
class AdditionalResources {
  /// The URLs for additional resources, either helpful resources or improvement
  /// plans, for a custom lens. Up to five additional URLs can be specified.
  final List<ChoiceContent>? content;

  /// Type of additional resource for a custom lens.
  final AdditionalResourceType? type;

  AdditionalResources({
    this.content,
    this.type,
  });

  factory AdditionalResources.fromJson(Map<String, dynamic> json) {
    return AdditionalResources(
      content: (json['Content'] as List?)
          ?.whereNotNull()
          .map((e) => ChoiceContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.toAdditionalResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final type = this.type;
    return {
      if (content != null) 'Content': content,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// An answer of the question.
class Answer {
  /// A list of selected choices to a question in your workload.
  final List<ChoiceAnswer>? choiceAnswers;
  final List<Choice>? choices;

  /// The helpful resource text to be displayed for a custom lens.
  ///
  /// This field does not apply to Amazon Web Services official lenses.
  final String? helpfulResourceDisplayText;
  final String? helpfulResourceUrl;
  final String? improvementPlanUrl;
  final bool? isApplicable;
  final String? notes;
  final String? pillarId;
  final String? questionDescription;
  final String? questionId;
  final String? questionTitle;

  /// The reason why the question is not applicable to your workload.
  final AnswerReason? reason;
  final Risk? risk;
  final List<String>? selectedChoices;

  Answer({
    this.choiceAnswers,
    this.choices,
    this.helpfulResourceDisplayText,
    this.helpfulResourceUrl,
    this.improvementPlanUrl,
    this.isApplicable,
    this.notes,
    this.pillarId,
    this.questionDescription,
    this.questionId,
    this.questionTitle,
    this.reason,
    this.risk,
    this.selectedChoices,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      choiceAnswers: (json['ChoiceAnswers'] as List?)
          ?.whereNotNull()
          .map((e) => ChoiceAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
      choices: (json['Choices'] as List?)
          ?.whereNotNull()
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      helpfulResourceDisplayText: json['HelpfulResourceDisplayText'] as String?,
      helpfulResourceUrl: json['HelpfulResourceUrl'] as String?,
      improvementPlanUrl: json['ImprovementPlanUrl'] as String?,
      isApplicable: json['IsApplicable'] as bool?,
      notes: json['Notes'] as String?,
      pillarId: json['PillarId'] as String?,
      questionDescription: json['QuestionDescription'] as String?,
      questionId: json['QuestionId'] as String?,
      questionTitle: json['QuestionTitle'] as String?,
      reason: (json['Reason'] as String?)?.toAnswerReason(),
      risk: (json['Risk'] as String?)?.toRisk(),
      selectedChoices: (json['SelectedChoices'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final choiceAnswers = this.choiceAnswers;
    final choices = this.choices;
    final helpfulResourceDisplayText = this.helpfulResourceDisplayText;
    final helpfulResourceUrl = this.helpfulResourceUrl;
    final improvementPlanUrl = this.improvementPlanUrl;
    final isApplicable = this.isApplicable;
    final notes = this.notes;
    final pillarId = this.pillarId;
    final questionDescription = this.questionDescription;
    final questionId = this.questionId;
    final questionTitle = this.questionTitle;
    final reason = this.reason;
    final risk = this.risk;
    final selectedChoices = this.selectedChoices;
    return {
      if (choiceAnswers != null) 'ChoiceAnswers': choiceAnswers,
      if (choices != null) 'Choices': choices,
      if (helpfulResourceDisplayText != null)
        'HelpfulResourceDisplayText': helpfulResourceDisplayText,
      if (helpfulResourceUrl != null) 'HelpfulResourceUrl': helpfulResourceUrl,
      if (improvementPlanUrl != null) 'ImprovementPlanUrl': improvementPlanUrl,
      if (isApplicable != null) 'IsApplicable': isApplicable,
      if (notes != null) 'Notes': notes,
      if (pillarId != null) 'PillarId': pillarId,
      if (questionDescription != null)
        'QuestionDescription': questionDescription,
      if (questionId != null) 'QuestionId': questionId,
      if (questionTitle != null) 'QuestionTitle': questionTitle,
      if (reason != null) 'Reason': reason.toValue(),
      if (risk != null) 'Risk': risk.toValue(),
      if (selectedChoices != null) 'SelectedChoices': selectedChoices,
    };
  }
}

enum AnswerReason {
  outOfScope,
  businessPriorities,
  architectureConstraints,
  other,
  none,
}

extension AnswerReasonValueExtension on AnswerReason {
  String toValue() {
    switch (this) {
      case AnswerReason.outOfScope:
        return 'OUT_OF_SCOPE';
      case AnswerReason.businessPriorities:
        return 'BUSINESS_PRIORITIES';
      case AnswerReason.architectureConstraints:
        return 'ARCHITECTURE_CONSTRAINTS';
      case AnswerReason.other:
        return 'OTHER';
      case AnswerReason.none:
        return 'NONE';
    }
  }
}

extension AnswerReasonFromString on String {
  AnswerReason toAnswerReason() {
    switch (this) {
      case 'OUT_OF_SCOPE':
        return AnswerReason.outOfScope;
      case 'BUSINESS_PRIORITIES':
        return AnswerReason.businessPriorities;
      case 'ARCHITECTURE_CONSTRAINTS':
        return AnswerReason.architectureConstraints;
      case 'OTHER':
        return AnswerReason.other;
      case 'NONE':
        return AnswerReason.none;
    }
    throw Exception('$this is not known in enum AnswerReason');
  }
}

/// An answer summary of a lens review in a workload.
class AnswerSummary {
  /// A list of selected choices to a question in your workload.
  final List<ChoiceAnswerSummary>? choiceAnswerSummaries;
  final List<Choice>? choices;
  final bool? isApplicable;
  final String? pillarId;
  final String? questionId;
  final String? questionTitle;

  /// The reason why a choice is non-applicable to a question in your workload.
  final AnswerReason? reason;
  final Risk? risk;
  final List<String>? selectedChoices;

  AnswerSummary({
    this.choiceAnswerSummaries,
    this.choices,
    this.isApplicable,
    this.pillarId,
    this.questionId,
    this.questionTitle,
    this.reason,
    this.risk,
    this.selectedChoices,
  });

  factory AnswerSummary.fromJson(Map<String, dynamic> json) {
    return AnswerSummary(
      choiceAnswerSummaries: (json['ChoiceAnswerSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ChoiceAnswerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      choices: (json['Choices'] as List?)
          ?.whereNotNull()
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      isApplicable: json['IsApplicable'] as bool?,
      pillarId: json['PillarId'] as String?,
      questionId: json['QuestionId'] as String?,
      questionTitle: json['QuestionTitle'] as String?,
      reason: (json['Reason'] as String?)?.toAnswerReason(),
      risk: (json['Risk'] as String?)?.toRisk(),
      selectedChoices: (json['SelectedChoices'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final choiceAnswerSummaries = this.choiceAnswerSummaries;
    final choices = this.choices;
    final isApplicable = this.isApplicable;
    final pillarId = this.pillarId;
    final questionId = this.questionId;
    final questionTitle = this.questionTitle;
    final reason = this.reason;
    final risk = this.risk;
    final selectedChoices = this.selectedChoices;
    return {
      if (choiceAnswerSummaries != null)
        'ChoiceAnswerSummaries': choiceAnswerSummaries,
      if (choices != null) 'Choices': choices,
      if (isApplicable != null) 'IsApplicable': isApplicable,
      if (pillarId != null) 'PillarId': pillarId,
      if (questionId != null) 'QuestionId': questionId,
      if (questionTitle != null) 'QuestionTitle': questionTitle,
      if (reason != null) 'Reason': reason.toValue(),
      if (risk != null) 'Risk': risk.toValue(),
      if (selectedChoices != null) 'SelectedChoices': selectedChoices,
    };
  }
}

/// A best practice, or question choice, that has been identified as a risk in
/// this question.
class BestPractice {
  final String? choiceId;
  final String? choiceTitle;

  BestPractice({
    this.choiceId,
    this.choiceTitle,
  });

  factory BestPractice.fromJson(Map<String, dynamic> json) {
    return BestPractice(
      choiceId: json['ChoiceId'] as String?,
      choiceTitle: json['ChoiceTitle'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final choiceId = this.choiceId;
    final choiceTitle = this.choiceTitle;
    return {
      if (choiceId != null) 'ChoiceId': choiceId,
      if (choiceTitle != null) 'ChoiceTitle': choiceTitle,
    };
  }
}

/// Account details for a Well-Architected best practice in relation to Trusted
/// Advisor checks.
class CheckDetail {
  final String? accountId;
  final String? choiceId;

  /// Trusted Advisor check description.
  final String? description;

  /// Count of flagged resources associated to the check.
  final int? flaggedResources;

  /// Trusted Advisor check ID.
  final String? id;

  /// Well-Architected Lens ARN associated to the check.
  final String? lensArn;

  /// Trusted Advisor check name.
  final String? name;
  final String? pillarId;

  /// Provider of the check related to the best practice.
  final CheckProvider? provider;
  final String? questionId;

  /// Reason associated to the check.
  final CheckFailureReason? reason;

  /// Status associated to the check.
  final CheckStatus? status;
  final DateTime? updatedAt;

  CheckDetail({
    this.accountId,
    this.choiceId,
    this.description,
    this.flaggedResources,
    this.id,
    this.lensArn,
    this.name,
    this.pillarId,
    this.provider,
    this.questionId,
    this.reason,
    this.status,
    this.updatedAt,
  });

  factory CheckDetail.fromJson(Map<String, dynamic> json) {
    return CheckDetail(
      accountId: json['AccountId'] as String?,
      choiceId: json['ChoiceId'] as String?,
      description: json['Description'] as String?,
      flaggedResources: json['FlaggedResources'] as int?,
      id: json['Id'] as String?,
      lensArn: json['LensArn'] as String?,
      name: json['Name'] as String?,
      pillarId: json['PillarId'] as String?,
      provider: (json['Provider'] as String?)?.toCheckProvider(),
      questionId: json['QuestionId'] as String?,
      reason: (json['Reason'] as String?)?.toCheckFailureReason(),
      status: (json['Status'] as String?)?.toCheckStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final choiceId = this.choiceId;
    final description = this.description;
    final flaggedResources = this.flaggedResources;
    final id = this.id;
    final lensArn = this.lensArn;
    final name = this.name;
    final pillarId = this.pillarId;
    final provider = this.provider;
    final questionId = this.questionId;
    final reason = this.reason;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (choiceId != null) 'ChoiceId': choiceId,
      if (description != null) 'Description': description,
      if (flaggedResources != null) 'FlaggedResources': flaggedResources,
      if (id != null) 'Id': id,
      if (lensArn != null) 'LensArn': lensArn,
      if (name != null) 'Name': name,
      if (pillarId != null) 'PillarId': pillarId,
      if (provider != null) 'Provider': provider.toValue(),
      if (questionId != null) 'QuestionId': questionId,
      if (reason != null) 'Reason': reason.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum CheckFailureReason {
  assumeRoleError,
  accessDenied,
  unknownError,
  premiumSupportRequired,
}

extension CheckFailureReasonValueExtension on CheckFailureReason {
  String toValue() {
    switch (this) {
      case CheckFailureReason.assumeRoleError:
        return 'ASSUME_ROLE_ERROR';
      case CheckFailureReason.accessDenied:
        return 'ACCESS_DENIED';
      case CheckFailureReason.unknownError:
        return 'UNKNOWN_ERROR';
      case CheckFailureReason.premiumSupportRequired:
        return 'PREMIUM_SUPPORT_REQUIRED';
    }
  }
}

extension CheckFailureReasonFromString on String {
  CheckFailureReason toCheckFailureReason() {
    switch (this) {
      case 'ASSUME_ROLE_ERROR':
        return CheckFailureReason.assumeRoleError;
      case 'ACCESS_DENIED':
        return CheckFailureReason.accessDenied;
      case 'UNKNOWN_ERROR':
        return CheckFailureReason.unknownError;
      case 'PREMIUM_SUPPORT_REQUIRED':
        return CheckFailureReason.premiumSupportRequired;
    }
    throw Exception('$this is not known in enum CheckFailureReason');
  }
}

enum CheckProvider {
  trustedAdvisor,
}

extension CheckProviderValueExtension on CheckProvider {
  String toValue() {
    switch (this) {
      case CheckProvider.trustedAdvisor:
        return 'TRUSTED_ADVISOR';
    }
  }
}

extension CheckProviderFromString on String {
  CheckProvider toCheckProvider() {
    switch (this) {
      case 'TRUSTED_ADVISOR':
        return CheckProvider.trustedAdvisor;
    }
    throw Exception('$this is not known in enum CheckProvider');
  }
}

enum CheckStatus {
  okay,
  warning,
  error,
  notAvailable,
  fetchFailed,
}

extension CheckStatusValueExtension on CheckStatus {
  String toValue() {
    switch (this) {
      case CheckStatus.okay:
        return 'OKAY';
      case CheckStatus.warning:
        return 'WARNING';
      case CheckStatus.error:
        return 'ERROR';
      case CheckStatus.notAvailable:
        return 'NOT_AVAILABLE';
      case CheckStatus.fetchFailed:
        return 'FETCH_FAILED';
    }
  }
}

extension CheckStatusFromString on String {
  CheckStatus toCheckStatus() {
    switch (this) {
      case 'OKAY':
        return CheckStatus.okay;
      case 'WARNING':
        return CheckStatus.warning;
      case 'ERROR':
        return CheckStatus.error;
      case 'NOT_AVAILABLE':
        return CheckStatus.notAvailable;
      case 'FETCH_FAILED':
        return CheckStatus.fetchFailed;
    }
    throw Exception('$this is not known in enum CheckStatus');
  }
}

/// Trusted Advisor check summary.
class CheckSummary {
  /// Account summary associated to the check.
  final Map<CheckStatus, int>? accountSummary;
  final String? choiceId;

  /// Trusted Advisor check description.
  final String? description;

  /// Trusted Advisor check ID.
  final String? id;

  /// Well-Architected Lens ARN associated to the check.
  final String? lensArn;

  /// Trusted Advisor check name.
  final String? name;
  final String? pillarId;

  /// Provider of the check related to the best practice.
  final CheckProvider? provider;
  final String? questionId;

  /// Status associated to the check.
  final CheckStatus? status;
  final DateTime? updatedAt;

  CheckSummary({
    this.accountSummary,
    this.choiceId,
    this.description,
    this.id,
    this.lensArn,
    this.name,
    this.pillarId,
    this.provider,
    this.questionId,
    this.status,
    this.updatedAt,
  });

  factory CheckSummary.fromJson(Map<String, dynamic> json) {
    return CheckSummary(
      accountSummary: (json['AccountSummary'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toCheckStatus(), e as int)),
      choiceId: json['ChoiceId'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lensArn: json['LensArn'] as String?,
      name: json['Name'] as String?,
      pillarId: json['PillarId'] as String?,
      provider: (json['Provider'] as String?)?.toCheckProvider(),
      questionId: json['QuestionId'] as String?,
      status: (json['Status'] as String?)?.toCheckStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final accountSummary = this.accountSummary;
    final choiceId = this.choiceId;
    final description = this.description;
    final id = this.id;
    final lensArn = this.lensArn;
    final name = this.name;
    final pillarId = this.pillarId;
    final provider = this.provider;
    final questionId = this.questionId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (accountSummary != null)
        'AccountSummary':
            accountSummary.map((k, e) => MapEntry(k.toValue(), e)),
      if (choiceId != null) 'ChoiceId': choiceId,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (lensArn != null) 'LensArn': lensArn,
      if (name != null) 'Name': name,
      if (pillarId != null) 'PillarId': pillarId,
      if (provider != null) 'Provider': provider.toValue(),
      if (questionId != null) 'QuestionId': questionId,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// A choice available to answer question.
class Choice {
  /// The additional resources for a choice in a custom lens.
  ///
  /// A choice can have up to two additional resources: one of type
  /// <code>HELPFUL_RESOURCE</code>, one of type <code>IMPROVEMENT_PLAN</code>, or
  /// both.
  final List<AdditionalResources>? additionalResources;
  final String? choiceId;
  final String? description;

  /// The helpful resource (both text and URL) for a particular choice.
  ///
  /// This field only applies to custom lenses. Each choice can have only one
  /// helpful resource.
  final ChoiceContent? helpfulResource;

  /// The improvement plan (both text and URL) for a particular choice.
  ///
  /// This field only applies to custom lenses. Each choice can have only one
  /// improvement plan.
  final ChoiceContent? improvementPlan;
  final String? title;

  Choice({
    this.additionalResources,
    this.choiceId,
    this.description,
    this.helpfulResource,
    this.improvementPlan,
    this.title,
  });

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      additionalResources: (json['AdditionalResources'] as List?)
          ?.whereNotNull()
          .map((e) => AdditionalResources.fromJson(e as Map<String, dynamic>))
          .toList(),
      choiceId: json['ChoiceId'] as String?,
      description: json['Description'] as String?,
      helpfulResource: json['HelpfulResource'] != null
          ? ChoiceContent.fromJson(
              json['HelpfulResource'] as Map<String, dynamic>)
          : null,
      improvementPlan: json['ImprovementPlan'] != null
          ? ChoiceContent.fromJson(
              json['ImprovementPlan'] as Map<String, dynamic>)
          : null,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalResources = this.additionalResources;
    final choiceId = this.choiceId;
    final description = this.description;
    final helpfulResource = this.helpfulResource;
    final improvementPlan = this.improvementPlan;
    final title = this.title;
    return {
      if (additionalResources != null)
        'AdditionalResources': additionalResources,
      if (choiceId != null) 'ChoiceId': choiceId,
      if (description != null) 'Description': description,
      if (helpfulResource != null) 'HelpfulResource': helpfulResource,
      if (improvementPlan != null) 'ImprovementPlan': improvementPlan,
      if (title != null) 'Title': title,
    };
  }
}

/// A choice that has been answered on a question in your workload.
class ChoiceAnswer {
  final String? choiceId;

  /// The notes associated with a choice.
  final String? notes;

  /// The reason why a choice is non-applicable to a question in your workload.
  final ChoiceReason? reason;

  /// The status of a choice.
  final ChoiceStatus? status;

  ChoiceAnswer({
    this.choiceId,
    this.notes,
    this.reason,
    this.status,
  });

  factory ChoiceAnswer.fromJson(Map<String, dynamic> json) {
    return ChoiceAnswer(
      choiceId: json['ChoiceId'] as String?,
      notes: json['Notes'] as String?,
      reason: (json['Reason'] as String?)?.toChoiceReason(),
      status: (json['Status'] as String?)?.toChoiceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final choiceId = this.choiceId;
    final notes = this.notes;
    final reason = this.reason;
    final status = this.status;
    return {
      if (choiceId != null) 'ChoiceId': choiceId,
      if (notes != null) 'Notes': notes,
      if (reason != null) 'Reason': reason.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// A choice summary that has been answered on a question in your workload.
class ChoiceAnswerSummary {
  final String? choiceId;

  /// The reason why a choice is non-applicable to a question in your workload.
  final ChoiceReason? reason;

  /// The status of a choice.
  final ChoiceStatus? status;

  ChoiceAnswerSummary({
    this.choiceId,
    this.reason,
    this.status,
  });

  factory ChoiceAnswerSummary.fromJson(Map<String, dynamic> json) {
    return ChoiceAnswerSummary(
      choiceId: json['ChoiceId'] as String?,
      reason: (json['Reason'] as String?)?.toChoiceReason(),
      status: (json['Status'] as String?)?.toChoiceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final choiceId = this.choiceId;
    final reason = this.reason;
    final status = this.status;
    return {
      if (choiceId != null) 'ChoiceId': choiceId,
      if (reason != null) 'Reason': reason.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// The choice content.
class ChoiceContent {
  /// The display text for the choice content.
  final String? displayText;

  /// The URL for the choice content.
  final String? url;

  ChoiceContent({
    this.displayText,
    this.url,
  });

  factory ChoiceContent.fromJson(Map<String, dynamic> json) {
    return ChoiceContent(
      displayText: json['DisplayText'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final displayText = this.displayText;
    final url = this.url;
    return {
      if (displayText != null) 'DisplayText': displayText,
      if (url != null) 'Url': url,
    };
  }
}

/// The choice level improvement plan.
class ChoiceImprovementPlan {
  final String? choiceId;

  /// The display text for the improvement plan.
  final String? displayText;
  final String? improvementPlanUrl;

  ChoiceImprovementPlan({
    this.choiceId,
    this.displayText,
    this.improvementPlanUrl,
  });

  factory ChoiceImprovementPlan.fromJson(Map<String, dynamic> json) {
    return ChoiceImprovementPlan(
      choiceId: json['ChoiceId'] as String?,
      displayText: json['DisplayText'] as String?,
      improvementPlanUrl: json['ImprovementPlanUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final choiceId = this.choiceId;
    final displayText = this.displayText;
    final improvementPlanUrl = this.improvementPlanUrl;
    return {
      if (choiceId != null) 'ChoiceId': choiceId,
      if (displayText != null) 'DisplayText': displayText,
      if (improvementPlanUrl != null) 'ImprovementPlanUrl': improvementPlanUrl,
    };
  }
}

enum ChoiceReason {
  outOfScope,
  businessPriorities,
  architectureConstraints,
  other,
  none,
}

extension ChoiceReasonValueExtension on ChoiceReason {
  String toValue() {
    switch (this) {
      case ChoiceReason.outOfScope:
        return 'OUT_OF_SCOPE';
      case ChoiceReason.businessPriorities:
        return 'BUSINESS_PRIORITIES';
      case ChoiceReason.architectureConstraints:
        return 'ARCHITECTURE_CONSTRAINTS';
      case ChoiceReason.other:
        return 'OTHER';
      case ChoiceReason.none:
        return 'NONE';
    }
  }
}

extension ChoiceReasonFromString on String {
  ChoiceReason toChoiceReason() {
    switch (this) {
      case 'OUT_OF_SCOPE':
        return ChoiceReason.outOfScope;
      case 'BUSINESS_PRIORITIES':
        return ChoiceReason.businessPriorities;
      case 'ARCHITECTURE_CONSTRAINTS':
        return ChoiceReason.architectureConstraints;
      case 'OTHER':
        return ChoiceReason.other;
      case 'NONE':
        return ChoiceReason.none;
    }
    throw Exception('$this is not known in enum ChoiceReason');
  }
}

enum ChoiceStatus {
  selected,
  notApplicable,
  unselected,
}

extension ChoiceStatusValueExtension on ChoiceStatus {
  String toValue() {
    switch (this) {
      case ChoiceStatus.selected:
        return 'SELECTED';
      case ChoiceStatus.notApplicable:
        return 'NOT_APPLICABLE';
      case ChoiceStatus.unselected:
        return 'UNSELECTED';
    }
  }
}

extension ChoiceStatusFromString on String {
  ChoiceStatus toChoiceStatus() {
    switch (this) {
      case 'SELECTED':
        return ChoiceStatus.selected;
      case 'NOT_APPLICABLE':
        return ChoiceStatus.notApplicable;
      case 'UNSELECTED':
        return ChoiceStatus.unselected;
    }
    throw Exception('$this is not known in enum ChoiceStatus');
  }
}

/// A list of choices to be updated.
class ChoiceUpdate {
  /// The status of a choice.
  final ChoiceStatus status;

  /// The notes associated with a choice.
  final String? notes;

  /// The reason why a choice is non-applicable to a question in your workload.
  final ChoiceReason? reason;

  ChoiceUpdate({
    required this.status,
    this.notes,
    this.reason,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    final notes = this.notes;
    final reason = this.reason;
    return {
      'Status': status.toValue(),
      if (notes != null) 'Notes': notes,
      if (reason != null) 'Reason': reason.toValue(),
    };
  }
}

/// A metric that contributes to the consolidated report.
class ConsolidatedReportMetric {
  /// The metrics for the lenses in the workload.
  final List<LensMetric>? lenses;

  /// The total number of lenses applied to the workload.
  final int? lensesAppliedCount;

  /// The metric type of a metric in the consolidated report. Currently only
  /// WORKLOAD metric types are supported.
  final MetricType? metricType;
  final Map<Risk, int>? riskCounts;
  final DateTime? updatedAt;
  final String? workloadArn;
  final String? workloadId;
  final String? workloadName;

  ConsolidatedReportMetric({
    this.lenses,
    this.lensesAppliedCount,
    this.metricType,
    this.riskCounts,
    this.updatedAt,
    this.workloadArn,
    this.workloadId,
    this.workloadName,
  });

  factory ConsolidatedReportMetric.fromJson(Map<String, dynamic> json) {
    return ConsolidatedReportMetric(
      lenses: (json['Lenses'] as List?)
          ?.whereNotNull()
          .map((e) => LensMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      lensesAppliedCount: json['LensesAppliedCount'] as int?,
      metricType: (json['MetricType'] as String?)?.toMetricType(),
      riskCounts: (json['RiskCounts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toRisk(), e as int)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
      workloadArn: json['WorkloadArn'] as String?,
      workloadId: json['WorkloadId'] as String?,
      workloadName: json['WorkloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lenses = this.lenses;
    final lensesAppliedCount = this.lensesAppliedCount;
    final metricType = this.metricType;
    final riskCounts = this.riskCounts;
    final updatedAt = this.updatedAt;
    final workloadArn = this.workloadArn;
    final workloadId = this.workloadId;
    final workloadName = this.workloadName;
    return {
      if (lenses != null) 'Lenses': lenses,
      if (lensesAppliedCount != null) 'LensesAppliedCount': lensesAppliedCount,
      if (metricType != null) 'MetricType': metricType.toValue(),
      if (riskCounts != null)
        'RiskCounts': riskCounts.map((k, e) => MapEntry(k.toValue(), e)),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
      if (workloadArn != null) 'WorkloadArn': workloadArn,
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadName != null) 'WorkloadName': workloadName,
    };
  }
}

class CreateLensShareOutput {
  final String? shareId;

  CreateLensShareOutput({
    this.shareId,
  });

  factory CreateLensShareOutput.fromJson(Map<String, dynamic> json) {
    return CreateLensShareOutput(
      shareId: json['ShareId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final shareId = this.shareId;
    return {
      if (shareId != null) 'ShareId': shareId,
    };
  }
}

class CreateLensVersionOutput {
  /// The ARN for the lens.
  final String? lensArn;

  /// The version of the lens.
  final String? lensVersion;

  CreateLensVersionOutput({
    this.lensArn,
    this.lensVersion,
  });

  factory CreateLensVersionOutput.fromJson(Map<String, dynamic> json) {
    return CreateLensVersionOutput(
      lensArn: json['LensArn'] as String?,
      lensVersion: json['LensVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensArn = this.lensArn;
    final lensVersion = this.lensVersion;
    return {
      if (lensArn != null) 'LensArn': lensArn,
      if (lensVersion != null) 'LensVersion': lensVersion,
    };
  }
}

/// Output of a create milestone call.
class CreateMilestoneOutput {
  final int? milestoneNumber;
  final String? workloadId;

  CreateMilestoneOutput({
    this.milestoneNumber,
    this.workloadId,
  });

  factory CreateMilestoneOutput.fromJson(Map<String, dynamic> json) {
    return CreateMilestoneOutput(
      milestoneNumber: json['MilestoneNumber'] as int?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final milestoneNumber = this.milestoneNumber;
    final workloadId = this.workloadId;
    return {
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Output of a create workload call.
class CreateWorkloadOutput {
  final String? workloadArn;
  final String? workloadId;

  CreateWorkloadOutput({
    this.workloadArn,
    this.workloadId,
  });

  factory CreateWorkloadOutput.fromJson(Map<String, dynamic> json) {
    return CreateWorkloadOutput(
      workloadArn: json['WorkloadArn'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workloadArn = this.workloadArn;
    final workloadId = this.workloadId;
    return {
      if (workloadArn != null) 'WorkloadArn': workloadArn,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Input for Create Workload Share
class CreateWorkloadShareOutput {
  final String? shareId;
  final String? workloadId;

  CreateWorkloadShareOutput({
    this.shareId,
    this.workloadId,
  });

  factory CreateWorkloadShareOutput.fromJson(Map<String, dynamic> json) {
    return CreateWorkloadShareOutput(
      shareId: json['ShareId'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final shareId = this.shareId;
    final workloadId = this.workloadId;
    return {
      if (shareId != null) 'ShareId': shareId,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

enum DefinitionType {
  workloadMetadata,
  appRegistry,
}

extension DefinitionTypeValueExtension on DefinitionType {
  String toValue() {
    switch (this) {
      case DefinitionType.workloadMetadata:
        return 'WORKLOAD_METADATA';
      case DefinitionType.appRegistry:
        return 'APP_REGISTRY';
    }
  }
}

extension DefinitionTypeFromString on String {
  DefinitionType toDefinitionType() {
    switch (this) {
      case 'WORKLOAD_METADATA':
        return DefinitionType.workloadMetadata;
      case 'APP_REGISTRY':
        return DefinitionType.appRegistry;
    }
    throw Exception('$this is not known in enum DefinitionType');
  }
}

enum DifferenceStatus {
  updated,
  $new,
  deleted,
}

extension DifferenceStatusValueExtension on DifferenceStatus {
  String toValue() {
    switch (this) {
      case DifferenceStatus.updated:
        return 'UPDATED';
      case DifferenceStatus.$new:
        return 'NEW';
      case DifferenceStatus.deleted:
        return 'DELETED';
    }
  }
}

extension DifferenceStatusFromString on String {
  DifferenceStatus toDifferenceStatus() {
    switch (this) {
      case 'UPDATED':
        return DifferenceStatus.updated;
      case 'NEW':
        return DifferenceStatus.$new;
      case 'DELETED':
        return DifferenceStatus.deleted;
    }
    throw Exception('$this is not known in enum DifferenceStatus');
  }
}

enum DiscoveryIntegrationStatus {
  enabled,
  disabled,
}

extension DiscoveryIntegrationStatusValueExtension
    on DiscoveryIntegrationStatus {
  String toValue() {
    switch (this) {
      case DiscoveryIntegrationStatus.enabled:
        return 'ENABLED';
      case DiscoveryIntegrationStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension DiscoveryIntegrationStatusFromString on String {
  DiscoveryIntegrationStatus toDiscoveryIntegrationStatus() {
    switch (this) {
      case 'ENABLED':
        return DiscoveryIntegrationStatus.enabled;
      case 'DISABLED':
        return DiscoveryIntegrationStatus.disabled;
    }
    throw Exception('$this is not known in enum DiscoveryIntegrationStatus');
  }
}

class ExportLensOutput {
  /// The JSON representation of a lens.
  final String? lensJSON;

  ExportLensOutput({
    this.lensJSON,
  });

  factory ExportLensOutput.fromJson(Map<String, dynamic> json) {
    return ExportLensOutput(
      lensJSON: json['LensJSON'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensJSON = this.lensJSON;
    return {
      if (lensJSON != null) 'LensJSON': lensJSON,
    };
  }
}

/// Output of a get answer call.
class GetAnswerOutput {
  final Answer? answer;
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;
  final int? milestoneNumber;
  final String? workloadId;

  GetAnswerOutput({
    this.answer,
    this.lensAlias,
    this.lensArn,
    this.milestoneNumber,
    this.workloadId,
  });

  factory GetAnswerOutput.fromJson(Map<String, dynamic> json) {
    return GetAnswerOutput(
      answer: json['Answer'] != null
          ? Answer.fromJson(json['Answer'] as Map<String, dynamic>)
          : null,
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      milestoneNumber: json['MilestoneNumber'] as int?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final answer = this.answer;
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final milestoneNumber = this.milestoneNumber;
    final workloadId = this.workloadId;
    return {
      if (answer != null) 'Answer': answer,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

class GetConsolidatedReportOutput {
  final String? base64String;

  /// The metrics that make up the consolidated report.
  ///
  /// Only returned when <code>JSON</code> format is requested.
  final List<ConsolidatedReportMetric>? metrics;
  final String? nextToken;

  GetConsolidatedReportOutput({
    this.base64String,
    this.metrics,
    this.nextToken,
  });

  factory GetConsolidatedReportOutput.fromJson(Map<String, dynamic> json) {
    return GetConsolidatedReportOutput(
      base64String: json['Base64String'] as String?,
      metrics: (json['Metrics'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ConsolidatedReportMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final base64String = this.base64String;
    final metrics = this.metrics;
    final nextToken = this.nextToken;
    return {
      if (base64String != null) 'Base64String': base64String,
      if (metrics != null) 'Metrics': metrics,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetLensOutput {
  /// A lens return object.
  final Lens? lens;

  GetLensOutput({
    this.lens,
  });

  factory GetLensOutput.fromJson(Map<String, dynamic> json) {
    return GetLensOutput(
      lens: json['Lens'] != null
          ? Lens.fromJson(json['Lens'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lens = this.lens;
    return {
      if (lens != null) 'Lens': lens,
    };
  }
}

/// Output of a get lens review call.
class GetLensReviewOutput {
  final LensReview? lensReview;
  final int? milestoneNumber;
  final String? workloadId;

  GetLensReviewOutput({
    this.lensReview,
    this.milestoneNumber,
    this.workloadId,
  });

  factory GetLensReviewOutput.fromJson(Map<String, dynamic> json) {
    return GetLensReviewOutput(
      lensReview: json['LensReview'] != null
          ? LensReview.fromJson(json['LensReview'] as Map<String, dynamic>)
          : null,
      milestoneNumber: json['MilestoneNumber'] as int?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensReview = this.lensReview;
    final milestoneNumber = this.milestoneNumber;
    final workloadId = this.workloadId;
    return {
      if (lensReview != null) 'LensReview': lensReview,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Output of a get lens review report call.
class GetLensReviewReportOutput {
  final LensReviewReport? lensReviewReport;
  final int? milestoneNumber;
  final String? workloadId;

  GetLensReviewReportOutput({
    this.lensReviewReport,
    this.milestoneNumber,
    this.workloadId,
  });

  factory GetLensReviewReportOutput.fromJson(Map<String, dynamic> json) {
    return GetLensReviewReportOutput(
      lensReviewReport: json['LensReviewReport'] != null
          ? LensReviewReport.fromJson(
              json['LensReviewReport'] as Map<String, dynamic>)
          : null,
      milestoneNumber: json['MilestoneNumber'] as int?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensReviewReport = this.lensReviewReport;
    final milestoneNumber = this.milestoneNumber;
    final workloadId = this.workloadId;
    return {
      if (lensReviewReport != null) 'LensReviewReport': lensReviewReport,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

class GetLensVersionDifferenceOutput {
  /// The base version of the lens.
  final String? baseLensVersion;

  /// The latest version of the lens.
  final String? latestLensVersion;
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;

  /// The target lens version for the lens.
  final String? targetLensVersion;
  final VersionDifferences? versionDifferences;

  GetLensVersionDifferenceOutput({
    this.baseLensVersion,
    this.latestLensVersion,
    this.lensAlias,
    this.lensArn,
    this.targetLensVersion,
    this.versionDifferences,
  });

  factory GetLensVersionDifferenceOutput.fromJson(Map<String, dynamic> json) {
    return GetLensVersionDifferenceOutput(
      baseLensVersion: json['BaseLensVersion'] as String?,
      latestLensVersion: json['LatestLensVersion'] as String?,
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      targetLensVersion: json['TargetLensVersion'] as String?,
      versionDifferences: json['VersionDifferences'] != null
          ? VersionDifferences.fromJson(
              json['VersionDifferences'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final baseLensVersion = this.baseLensVersion;
    final latestLensVersion = this.latestLensVersion;
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final targetLensVersion = this.targetLensVersion;
    final versionDifferences = this.versionDifferences;
    return {
      if (baseLensVersion != null) 'BaseLensVersion': baseLensVersion,
      if (latestLensVersion != null) 'LatestLensVersion': latestLensVersion,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (targetLensVersion != null) 'TargetLensVersion': targetLensVersion,
      if (versionDifferences != null) 'VersionDifferences': versionDifferences,
    };
  }
}

/// Output of a get milestone call.
class GetMilestoneOutput {
  final Milestone? milestone;
  final String? workloadId;

  GetMilestoneOutput({
    this.milestone,
    this.workloadId,
  });

  factory GetMilestoneOutput.fromJson(Map<String, dynamic> json) {
    return GetMilestoneOutput(
      milestone: json['Milestone'] != null
          ? Milestone.fromJson(json['Milestone'] as Map<String, dynamic>)
          : null,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final milestone = this.milestone;
    final workloadId = this.workloadId;
    return {
      if (milestone != null) 'Milestone': milestone,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Output of a get workload call.
class GetWorkloadOutput {
  final Workload? workload;

  GetWorkloadOutput({
    this.workload,
  });

  factory GetWorkloadOutput.fromJson(Map<String, dynamic> json) {
    return GetWorkloadOutput(
      workload: json['Workload'] != null
          ? Workload.fromJson(json['Workload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final workload = this.workload;
    return {
      if (workload != null) 'Workload': workload,
    };
  }
}

class ImportLensOutput {
  /// The ARN for the lens that was created or updated.
  final String? lensArn;

  /// The status of the imported lens.
  final ImportLensStatus? status;

  ImportLensOutput({
    this.lensArn,
    this.status,
  });

  factory ImportLensOutput.fromJson(Map<String, dynamic> json) {
    return ImportLensOutput(
      lensArn: json['LensArn'] as String?,
      status: (json['Status'] as String?)?.toImportLensStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final lensArn = this.lensArn;
    final status = this.status;
    return {
      if (lensArn != null) 'LensArn': lensArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum ImportLensStatus {
  inProgress,
  complete,
  error,
}

extension ImportLensStatusValueExtension on ImportLensStatus {
  String toValue() {
    switch (this) {
      case ImportLensStatus.inProgress:
        return 'IN_PROGRESS';
      case ImportLensStatus.complete:
        return 'COMPLETE';
      case ImportLensStatus.error:
        return 'ERROR';
    }
  }
}

extension ImportLensStatusFromString on String {
  ImportLensStatus toImportLensStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ImportLensStatus.inProgress;
      case 'COMPLETE':
        return ImportLensStatus.complete;
      case 'ERROR':
        return ImportLensStatus.error;
    }
    throw Exception('$this is not known in enum ImportLensStatus');
  }
}

/// An improvement summary of a lens review in a workload.
class ImprovementSummary {
  final String? improvementPlanUrl;

  /// The improvement plan details.
  final List<ChoiceImprovementPlan>? improvementPlans;
  final String? pillarId;
  final String? questionId;
  final String? questionTitle;
  final Risk? risk;

  ImprovementSummary({
    this.improvementPlanUrl,
    this.improvementPlans,
    this.pillarId,
    this.questionId,
    this.questionTitle,
    this.risk,
  });

  factory ImprovementSummary.fromJson(Map<String, dynamic> json) {
    return ImprovementSummary(
      improvementPlanUrl: json['ImprovementPlanUrl'] as String?,
      improvementPlans: (json['ImprovementPlans'] as List?)
          ?.whereNotNull()
          .map((e) => ChoiceImprovementPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
      pillarId: json['PillarId'] as String?,
      questionId: json['QuestionId'] as String?,
      questionTitle: json['QuestionTitle'] as String?,
      risk: (json['Risk'] as String?)?.toRisk(),
    );
  }

  Map<String, dynamic> toJson() {
    final improvementPlanUrl = this.improvementPlanUrl;
    final improvementPlans = this.improvementPlans;
    final pillarId = this.pillarId;
    final questionId = this.questionId;
    final questionTitle = this.questionTitle;
    final risk = this.risk;
    return {
      if (improvementPlanUrl != null) 'ImprovementPlanUrl': improvementPlanUrl,
      if (improvementPlans != null) 'ImprovementPlans': improvementPlans,
      if (pillarId != null) 'PillarId': pillarId,
      if (questionId != null) 'QuestionId': questionId,
      if (questionTitle != null) 'QuestionTitle': questionTitle,
      if (risk != null) 'Risk': risk.toValue(),
    };
  }
}

/// A lens return object.
class Lens {
  final String? description;

  /// The ARN of a lens.
  final String? lensArn;

  /// The version of a lens.
  final String? lensVersion;
  final String? name;

  /// The Amazon Web Services account ID that owns the lens.
  final String? owner;

  /// The ID assigned to the share invitation.
  final String? shareInvitationId;

  /// The tags assigned to the lens.
  final Map<String, String>? tags;

  Lens({
    this.description,
    this.lensArn,
    this.lensVersion,
    this.name,
    this.owner,
    this.shareInvitationId,
    this.tags,
  });

  factory Lens.fromJson(Map<String, dynamic> json) {
    return Lens(
      description: json['Description'] as String?,
      lensArn: json['LensArn'] as String?,
      lensVersion: json['LensVersion'] as String?,
      name: json['Name'] as String?,
      owner: json['Owner'] as String?,
      shareInvitationId: json['ShareInvitationId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final lensArn = this.lensArn;
    final lensVersion = this.lensVersion;
    final name = this.name;
    final owner = this.owner;
    final shareInvitationId = this.shareInvitationId;
    final tags = this.tags;
    return {
      if (description != null) 'Description': description,
      if (lensArn != null) 'LensArn': lensArn,
      if (lensVersion != null) 'LensVersion': lensVersion,
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (shareInvitationId != null) 'ShareInvitationId': shareInvitationId,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A metric for a particular lens in a workload.
class LensMetric {
  /// The lens ARN.
  final String? lensArn;

  /// The metrics for the pillars in a lens.
  final List<PillarMetric>? pillars;
  final Map<Risk, int>? riskCounts;

  LensMetric({
    this.lensArn,
    this.pillars,
    this.riskCounts,
  });

  factory LensMetric.fromJson(Map<String, dynamic> json) {
    return LensMetric(
      lensArn: json['LensArn'] as String?,
      pillars: (json['Pillars'] as List?)
          ?.whereNotNull()
          .map((e) => PillarMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      riskCounts: (json['RiskCounts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toRisk(), e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final lensArn = this.lensArn;
    final pillars = this.pillars;
    final riskCounts = this.riskCounts;
    return {
      if (lensArn != null) 'LensArn': lensArn,
      if (pillars != null) 'Pillars': pillars,
      if (riskCounts != null)
        'RiskCounts': riskCounts.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// A lens review of a question.
class LensReview {
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;
  final String? lensName;

  /// The status of the lens.
  final LensStatus? lensStatus;

  /// The version of the lens.
  final String? lensVersion;
  final String? nextToken;
  final String? notes;
  final List<PillarReviewSummary>? pillarReviewSummaries;
  final Map<Risk, int>? riskCounts;
  final DateTime? updatedAt;

  LensReview({
    this.lensAlias,
    this.lensArn,
    this.lensName,
    this.lensStatus,
    this.lensVersion,
    this.nextToken,
    this.notes,
    this.pillarReviewSummaries,
    this.riskCounts,
    this.updatedAt,
  });

  factory LensReview.fromJson(Map<String, dynamic> json) {
    return LensReview(
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      lensName: json['LensName'] as String?,
      lensStatus: (json['LensStatus'] as String?)?.toLensStatus(),
      lensVersion: json['LensVersion'] as String?,
      nextToken: json['NextToken'] as String?,
      notes: json['Notes'] as String?,
      pillarReviewSummaries: (json['PillarReviewSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => PillarReviewSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      riskCounts: (json['RiskCounts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toRisk(), e as int)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final lensName = this.lensName;
    final lensStatus = this.lensStatus;
    final lensVersion = this.lensVersion;
    final nextToken = this.nextToken;
    final notes = this.notes;
    final pillarReviewSummaries = this.pillarReviewSummaries;
    final riskCounts = this.riskCounts;
    final updatedAt = this.updatedAt;
    return {
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (lensName != null) 'LensName': lensName,
      if (lensStatus != null) 'LensStatus': lensStatus.toValue(),
      if (lensVersion != null) 'LensVersion': lensVersion,
      if (nextToken != null) 'NextToken': nextToken,
      if (notes != null) 'Notes': notes,
      if (pillarReviewSummaries != null)
        'PillarReviewSummaries': pillarReviewSummaries,
      if (riskCounts != null)
        'RiskCounts': riskCounts.map((k, e) => MapEntry(k.toValue(), e)),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// A report of a lens review.
class LensReviewReport {
  final String? base64String;
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;

  LensReviewReport({
    this.base64String,
    this.lensAlias,
    this.lensArn,
  });

  factory LensReviewReport.fromJson(Map<String, dynamic> json) {
    return LensReviewReport(
      base64String: json['Base64String'] as String?,
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final base64String = this.base64String;
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    return {
      if (base64String != null) 'Base64String': base64String,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
    };
  }
}

/// A lens review summary of a workload.
class LensReviewSummary {
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;
  final String? lensName;

  /// The status of the lens.
  final LensStatus? lensStatus;

  /// The version of the lens.
  final String? lensVersion;
  final Map<Risk, int>? riskCounts;
  final DateTime? updatedAt;

  LensReviewSummary({
    this.lensAlias,
    this.lensArn,
    this.lensName,
    this.lensStatus,
    this.lensVersion,
    this.riskCounts,
    this.updatedAt,
  });

  factory LensReviewSummary.fromJson(Map<String, dynamic> json) {
    return LensReviewSummary(
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      lensName: json['LensName'] as String?,
      lensStatus: (json['LensStatus'] as String?)?.toLensStatus(),
      lensVersion: json['LensVersion'] as String?,
      riskCounts: (json['RiskCounts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toRisk(), e as int)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final lensName = this.lensName;
    final lensStatus = this.lensStatus;
    final lensVersion = this.lensVersion;
    final riskCounts = this.riskCounts;
    final updatedAt = this.updatedAt;
    return {
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (lensName != null) 'LensName': lensName,
      if (lensStatus != null) 'LensStatus': lensStatus.toValue(),
      if (lensVersion != null) 'LensVersion': lensVersion,
      if (riskCounts != null)
        'RiskCounts': riskCounts.map((k, e) => MapEntry(k.toValue(), e)),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// A lens share summary return object.
class LensShareSummary {
  final String? shareId;
  final String? sharedWith;
  final ShareStatus? status;

  /// Optional message to compliment the Status field.
  final String? statusMessage;

  LensShareSummary({
    this.shareId,
    this.sharedWith,
    this.status,
    this.statusMessage,
  });

  factory LensShareSummary.fromJson(Map<String, dynamic> json) {
    return LensShareSummary(
      shareId: json['ShareId'] as String?,
      sharedWith: json['SharedWith'] as String?,
      status: (json['Status'] as String?)?.toShareStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final shareId = this.shareId;
    final sharedWith = this.sharedWith;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (shareId != null) 'ShareId': shareId,
      if (sharedWith != null) 'SharedWith': sharedWith,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

enum LensStatus {
  current,
  notCurrent,
  deprecated,
  deleted,
  unshared,
}

extension LensStatusValueExtension on LensStatus {
  String toValue() {
    switch (this) {
      case LensStatus.current:
        return 'CURRENT';
      case LensStatus.notCurrent:
        return 'NOT_CURRENT';
      case LensStatus.deprecated:
        return 'DEPRECATED';
      case LensStatus.deleted:
        return 'DELETED';
      case LensStatus.unshared:
        return 'UNSHARED';
    }
  }
}

extension LensStatusFromString on String {
  LensStatus toLensStatus() {
    switch (this) {
      case 'CURRENT':
        return LensStatus.current;
      case 'NOT_CURRENT':
        return LensStatus.notCurrent;
      case 'DEPRECATED':
        return LensStatus.deprecated;
      case 'DELETED':
        return LensStatus.deleted;
      case 'UNSHARED':
        return LensStatus.unshared;
    }
    throw Exception('$this is not known in enum LensStatus');
  }
}

enum LensStatusType {
  all,
  draft,
  published,
}

extension LensStatusTypeValueExtension on LensStatusType {
  String toValue() {
    switch (this) {
      case LensStatusType.all:
        return 'ALL';
      case LensStatusType.draft:
        return 'DRAFT';
      case LensStatusType.published:
        return 'PUBLISHED';
    }
  }
}

extension LensStatusTypeFromString on String {
  LensStatusType toLensStatusType() {
    switch (this) {
      case 'ALL':
        return LensStatusType.all;
      case 'DRAFT':
        return LensStatusType.draft;
      case 'PUBLISHED':
        return LensStatusType.published;
    }
    throw Exception('$this is not known in enum LensStatusType');
  }
}

/// A lens summary of a lens.
class LensSummary {
  final DateTime? createdAt;
  final String? description;
  final String? lensAlias;

  /// The ARN of the lens.
  final String? lensArn;
  final String? lensName;

  /// The status of the lens.
  final LensStatus? lensStatus;

  /// The type of the lens.
  final LensType? lensType;

  /// The version of the lens.
  final String? lensVersion;
  final String? owner;
  final DateTime? updatedAt;

  LensSummary({
    this.createdAt,
    this.description,
    this.lensAlias,
    this.lensArn,
    this.lensName,
    this.lensStatus,
    this.lensType,
    this.lensVersion,
    this.owner,
    this.updatedAt,
  });

  factory LensSummary.fromJson(Map<String, dynamic> json) {
    return LensSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      lensName: json['LensName'] as String?,
      lensStatus: (json['LensStatus'] as String?)?.toLensStatus(),
      lensType: (json['LensType'] as String?)?.toLensType(),
      lensVersion: json['LensVersion'] as String?,
      owner: json['Owner'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final lensName = this.lensName;
    final lensStatus = this.lensStatus;
    final lensType = this.lensType;
    final lensVersion = this.lensVersion;
    final owner = this.owner;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (lensName != null) 'LensName': lensName,
      if (lensStatus != null) 'LensStatus': lensStatus.toValue(),
      if (lensType != null) 'LensType': lensType.toValue(),
      if (lensVersion != null) 'LensVersion': lensVersion,
      if (owner != null) 'Owner': owner,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum LensType {
  awsOfficial,
  customShared,
  customSelf,
}

extension LensTypeValueExtension on LensType {
  String toValue() {
    switch (this) {
      case LensType.awsOfficial:
        return 'AWS_OFFICIAL';
      case LensType.customShared:
        return 'CUSTOM_SHARED';
      case LensType.customSelf:
        return 'CUSTOM_SELF';
    }
  }
}

extension LensTypeFromString on String {
  LensType toLensType() {
    switch (this) {
      case 'AWS_OFFICIAL':
        return LensType.awsOfficial;
      case 'CUSTOM_SHARED':
        return LensType.customShared;
      case 'CUSTOM_SELF':
        return LensType.customSelf;
    }
    throw Exception('$this is not known in enum LensType');
  }
}

/// Lens upgrade summary return object.
class LensUpgradeSummary {
  /// The current version of the lens.
  final String? currentLensVersion;

  /// The latest version of the lens.
  final String? latestLensVersion;
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;
  final String? workloadId;
  final String? workloadName;

  LensUpgradeSummary({
    this.currentLensVersion,
    this.latestLensVersion,
    this.lensAlias,
    this.lensArn,
    this.workloadId,
    this.workloadName,
  });

  factory LensUpgradeSummary.fromJson(Map<String, dynamic> json) {
    return LensUpgradeSummary(
      currentLensVersion: json['CurrentLensVersion'] as String?,
      latestLensVersion: json['LatestLensVersion'] as String?,
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      workloadId: json['WorkloadId'] as String?,
      workloadName: json['WorkloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentLensVersion = this.currentLensVersion;
    final latestLensVersion = this.latestLensVersion;
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final workloadId = this.workloadId;
    final workloadName = this.workloadName;
    return {
      if (currentLensVersion != null) 'CurrentLensVersion': currentLensVersion,
      if (latestLensVersion != null) 'LatestLensVersion': latestLensVersion,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadName != null) 'WorkloadName': workloadName,
    };
  }
}

/// Output of a list answers call.
class ListAnswersOutput {
  final List<AnswerSummary>? answerSummaries;
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;
  final int? milestoneNumber;
  final String? nextToken;
  final String? workloadId;

  ListAnswersOutput({
    this.answerSummaries,
    this.lensAlias,
    this.lensArn,
    this.milestoneNumber,
    this.nextToken,
    this.workloadId,
  });

  factory ListAnswersOutput.fromJson(Map<String, dynamic> json) {
    return ListAnswersOutput(
      answerSummaries: (json['AnswerSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => AnswerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      milestoneNumber: json['MilestoneNumber'] as int?,
      nextToken: json['NextToken'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final answerSummaries = this.answerSummaries;
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final milestoneNumber = this.milestoneNumber;
    final nextToken = this.nextToken;
    final workloadId = this.workloadId;
    return {
      if (answerSummaries != null) 'AnswerSummaries': answerSummaries,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

class ListCheckDetailsOutput {
  /// The details about the Trusted Advisor checks related to the Well-Architected
  /// best practice.
  final List<CheckDetail>? checkDetails;
  final String? nextToken;

  ListCheckDetailsOutput({
    this.checkDetails,
    this.nextToken,
  });

  factory ListCheckDetailsOutput.fromJson(Map<String, dynamic> json) {
    return ListCheckDetailsOutput(
      checkDetails: (json['CheckDetails'] as List?)
          ?.whereNotNull()
          .map((e) => CheckDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final checkDetails = this.checkDetails;
    final nextToken = this.nextToken;
    return {
      if (checkDetails != null) 'CheckDetails': checkDetails,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCheckSummariesOutput {
  /// List of Trusted Advisor summaries related to the Well-Architected best
  /// practice.
  final List<CheckSummary>? checkSummaries;
  final String? nextToken;

  ListCheckSummariesOutput({
    this.checkSummaries,
    this.nextToken,
  });

  factory ListCheckSummariesOutput.fromJson(Map<String, dynamic> json) {
    return ListCheckSummariesOutput(
      checkSummaries: (json['CheckSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => CheckSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final checkSummaries = this.checkSummaries;
    final nextToken = this.nextToken;
    return {
      if (checkSummaries != null) 'CheckSummaries': checkSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Output of a list lens review improvements call.
class ListLensReviewImprovementsOutput {
  final List<ImprovementSummary>? improvementSummaries;
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;
  final int? milestoneNumber;
  final String? nextToken;
  final String? workloadId;

  ListLensReviewImprovementsOutput({
    this.improvementSummaries,
    this.lensAlias,
    this.lensArn,
    this.milestoneNumber,
    this.nextToken,
    this.workloadId,
  });

  factory ListLensReviewImprovementsOutput.fromJson(Map<String, dynamic> json) {
    return ListLensReviewImprovementsOutput(
      improvementSummaries: (json['ImprovementSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ImprovementSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      milestoneNumber: json['MilestoneNumber'] as int?,
      nextToken: json['NextToken'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final improvementSummaries = this.improvementSummaries;
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final milestoneNumber = this.milestoneNumber;
    final nextToken = this.nextToken;
    final workloadId = this.workloadId;
    return {
      if (improvementSummaries != null)
        'ImprovementSummaries': improvementSummaries,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Output of a list lens reviews call.
class ListLensReviewsOutput {
  final List<LensReviewSummary>? lensReviewSummaries;
  final int? milestoneNumber;
  final String? nextToken;
  final String? workloadId;

  ListLensReviewsOutput({
    this.lensReviewSummaries,
    this.milestoneNumber,
    this.nextToken,
    this.workloadId,
  });

  factory ListLensReviewsOutput.fromJson(Map<String, dynamic> json) {
    return ListLensReviewsOutput(
      lensReviewSummaries: (json['LensReviewSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => LensReviewSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      milestoneNumber: json['MilestoneNumber'] as int?,
      nextToken: json['NextToken'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensReviewSummaries = this.lensReviewSummaries;
    final milestoneNumber = this.milestoneNumber;
    final nextToken = this.nextToken;
    final workloadId = this.workloadId;
    return {
      if (lensReviewSummaries != null)
        'LensReviewSummaries': lensReviewSummaries,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

class ListLensSharesOutput {
  /// A list of lens share summaries.
  final List<LensShareSummary>? lensShareSummaries;
  final String? nextToken;

  ListLensSharesOutput({
    this.lensShareSummaries,
    this.nextToken,
  });

  factory ListLensSharesOutput.fromJson(Map<String, dynamic> json) {
    return ListLensSharesOutput(
      lensShareSummaries: (json['LensShareSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => LensShareSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensShareSummaries = this.lensShareSummaries;
    final nextToken = this.nextToken;
    return {
      if (lensShareSummaries != null) 'LensShareSummaries': lensShareSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Output of a list lenses call.
class ListLensesOutput {
  final List<LensSummary>? lensSummaries;
  final String? nextToken;

  ListLensesOutput({
    this.lensSummaries,
    this.nextToken,
  });

  factory ListLensesOutput.fromJson(Map<String, dynamic> json) {
    return ListLensesOutput(
      lensSummaries: (json['LensSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => LensSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensSummaries = this.lensSummaries;
    final nextToken = this.nextToken;
    return {
      if (lensSummaries != null) 'LensSummaries': lensSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Output of a list milestones call.
class ListMilestonesOutput {
  final List<MilestoneSummary>? milestoneSummaries;
  final String? nextToken;
  final String? workloadId;

  ListMilestonesOutput({
    this.milestoneSummaries,
    this.nextToken,
    this.workloadId,
  });

  factory ListMilestonesOutput.fromJson(Map<String, dynamic> json) {
    return ListMilestonesOutput(
      milestoneSummaries: (json['MilestoneSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => MilestoneSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final milestoneSummaries = this.milestoneSummaries;
    final nextToken = this.nextToken;
    final workloadId = this.workloadId;
    return {
      if (milestoneSummaries != null) 'MilestoneSummaries': milestoneSummaries,
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

class ListNotificationsOutput {
  final String? nextToken;

  /// List of lens notification summaries in a workload.
  final List<NotificationSummary>? notificationSummaries;

  ListNotificationsOutput({
    this.nextToken,
    this.notificationSummaries,
  });

  factory ListNotificationsOutput.fromJson(Map<String, dynamic> json) {
    return ListNotificationsOutput(
      nextToken: json['NextToken'] as String?,
      notificationSummaries: (json['NotificationSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => NotificationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final notificationSummaries = this.notificationSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (notificationSummaries != null)
        'NotificationSummaries': notificationSummaries,
    };
  }
}

/// Input for List Share Invitations
class ListShareInvitationsOutput {
  final String? nextToken;

  /// List of share invitation summaries in a workload.
  final List<ShareInvitationSummary>? shareInvitationSummaries;

  ListShareInvitationsOutput({
    this.nextToken,
    this.shareInvitationSummaries,
  });

  factory ListShareInvitationsOutput.fromJson(Map<String, dynamic> json) {
    return ListShareInvitationsOutput(
      nextToken: json['NextToken'] as String?,
      shareInvitationSummaries: (json['ShareInvitationSummaries'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ShareInvitationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final shareInvitationSummaries = this.shareInvitationSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (shareInvitationSummaries != null)
        'ShareInvitationSummaries': shareInvitationSummaries,
    };
  }
}

class ListTagsForResourceOutput {
  /// The tags for the resource.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Input for List Workload Share
class ListWorkloadSharesOutput {
  final String? nextToken;
  final String? workloadId;
  final List<WorkloadShareSummary>? workloadShareSummaries;

  ListWorkloadSharesOutput({
    this.nextToken,
    this.workloadId,
    this.workloadShareSummaries,
  });

  factory ListWorkloadSharesOutput.fromJson(Map<String, dynamic> json) {
    return ListWorkloadSharesOutput(
      nextToken: json['NextToken'] as String?,
      workloadId: json['WorkloadId'] as String?,
      workloadShareSummaries: (json['WorkloadShareSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => WorkloadShareSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workloadId = this.workloadId;
    final workloadShareSummaries = this.workloadShareSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadShareSummaries != null)
        'WorkloadShareSummaries': workloadShareSummaries,
    };
  }
}

/// Output of a list workloads call.
class ListWorkloadsOutput {
  final String? nextToken;
  final List<WorkloadSummary>? workloadSummaries;

  ListWorkloadsOutput({
    this.nextToken,
    this.workloadSummaries,
  });

  factory ListWorkloadsOutput.fromJson(Map<String, dynamic> json) {
    return ListWorkloadsOutput(
      nextToken: json['NextToken'] as String?,
      workloadSummaries: (json['WorkloadSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => WorkloadSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workloadSummaries = this.workloadSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadSummaries != null) 'WorkloadSummaries': workloadSummaries,
    };
  }
}

enum MetricType {
  workload,
}

extension MetricTypeValueExtension on MetricType {
  String toValue() {
    switch (this) {
      case MetricType.workload:
        return 'WORKLOAD';
    }
  }
}

extension MetricTypeFromString on String {
  MetricType toMetricType() {
    switch (this) {
      case 'WORKLOAD':
        return MetricType.workload;
    }
    throw Exception('$this is not known in enum MetricType');
  }
}

/// A milestone return object.
class Milestone {
  final String? milestoneName;
  final int? milestoneNumber;
  final DateTime? recordedAt;
  final Workload? workload;

  Milestone({
    this.milestoneName,
    this.milestoneNumber,
    this.recordedAt,
    this.workload,
  });

  factory Milestone.fromJson(Map<String, dynamic> json) {
    return Milestone(
      milestoneName: json['MilestoneName'] as String?,
      milestoneNumber: json['MilestoneNumber'] as int?,
      recordedAt: timeStampFromJson(json['RecordedAt']),
      workload: json['Workload'] != null
          ? Workload.fromJson(json['Workload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final milestoneName = this.milestoneName;
    final milestoneNumber = this.milestoneNumber;
    final recordedAt = this.recordedAt;
    final workload = this.workload;
    return {
      if (milestoneName != null) 'MilestoneName': milestoneName,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (recordedAt != null) 'RecordedAt': unixTimestampToJson(recordedAt),
      if (workload != null) 'Workload': workload,
    };
  }
}

/// A milestone summary return object.
class MilestoneSummary {
  final String? milestoneName;
  final int? milestoneNumber;
  final DateTime? recordedAt;
  final WorkloadSummary? workloadSummary;

  MilestoneSummary({
    this.milestoneName,
    this.milestoneNumber,
    this.recordedAt,
    this.workloadSummary,
  });

  factory MilestoneSummary.fromJson(Map<String, dynamic> json) {
    return MilestoneSummary(
      milestoneName: json['MilestoneName'] as String?,
      milestoneNumber: json['MilestoneNumber'] as int?,
      recordedAt: timeStampFromJson(json['RecordedAt']),
      workloadSummary: json['WorkloadSummary'] != null
          ? WorkloadSummary.fromJson(
              json['WorkloadSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final milestoneName = this.milestoneName;
    final milestoneNumber = this.milestoneNumber;
    final recordedAt = this.recordedAt;
    final workloadSummary = this.workloadSummary;
    return {
      if (milestoneName != null) 'MilestoneName': milestoneName,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (recordedAt != null) 'RecordedAt': unixTimestampToJson(recordedAt),
      if (workloadSummary != null) 'WorkloadSummary': workloadSummary,
    };
  }
}

/// A notification summary return object.
class NotificationSummary {
  /// Summary of lens upgrade.
  final LensUpgradeSummary? lensUpgradeSummary;

  /// The type of notification.
  final NotificationType? type;

  NotificationSummary({
    this.lensUpgradeSummary,
    this.type,
  });

  factory NotificationSummary.fromJson(Map<String, dynamic> json) {
    return NotificationSummary(
      lensUpgradeSummary: json['LensUpgradeSummary'] != null
          ? LensUpgradeSummary.fromJson(
              json['LensUpgradeSummary'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toNotificationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final lensUpgradeSummary = this.lensUpgradeSummary;
    final type = this.type;
    return {
      if (lensUpgradeSummary != null) 'LensUpgradeSummary': lensUpgradeSummary,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum NotificationType {
  lensVersionUpgraded,
  lensVersionDeprecated,
}

extension NotificationTypeValueExtension on NotificationType {
  String toValue() {
    switch (this) {
      case NotificationType.lensVersionUpgraded:
        return 'LENS_VERSION_UPGRADED';
      case NotificationType.lensVersionDeprecated:
        return 'LENS_VERSION_DEPRECATED';
    }
  }
}

extension NotificationTypeFromString on String {
  NotificationType toNotificationType() {
    switch (this) {
      case 'LENS_VERSION_UPGRADED':
        return NotificationType.lensVersionUpgraded;
      case 'LENS_VERSION_DEPRECATED':
        return NotificationType.lensVersionDeprecated;
    }
    throw Exception('$this is not known in enum NotificationType');
  }
}

enum OrganizationSharingStatus {
  enabled,
  disabled,
}

extension OrganizationSharingStatusValueExtension on OrganizationSharingStatus {
  String toValue() {
    switch (this) {
      case OrganizationSharingStatus.enabled:
        return 'ENABLED';
      case OrganizationSharingStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension OrganizationSharingStatusFromString on String {
  OrganizationSharingStatus toOrganizationSharingStatus() {
    switch (this) {
      case 'ENABLED':
        return OrganizationSharingStatus.enabled;
      case 'DISABLED':
        return OrganizationSharingStatus.disabled;
    }
    throw Exception('$this is not known in enum OrganizationSharingStatus');
  }
}

/// Permission granted on a workload share.
enum PermissionType {
  readonly,
  contributor,
}

extension PermissionTypeValueExtension on PermissionType {
  String toValue() {
    switch (this) {
      case PermissionType.readonly:
        return 'READONLY';
      case PermissionType.contributor:
        return 'CONTRIBUTOR';
    }
  }
}

extension PermissionTypeFromString on String {
  PermissionType toPermissionType() {
    switch (this) {
      case 'READONLY':
        return PermissionType.readonly;
      case 'CONTRIBUTOR':
        return PermissionType.contributor;
    }
    throw Exception('$this is not known in enum PermissionType');
  }
}

/// A pillar difference return object.
class PillarDifference {
  /// Indicates the type of change to the pillar.
  final DifferenceStatus? differenceStatus;
  final String? pillarId;
  final String? pillarName;

  /// List of question differences.
  final List<QuestionDifference>? questionDifferences;

  PillarDifference({
    this.differenceStatus,
    this.pillarId,
    this.pillarName,
    this.questionDifferences,
  });

  factory PillarDifference.fromJson(Map<String, dynamic> json) {
    return PillarDifference(
      differenceStatus:
          (json['DifferenceStatus'] as String?)?.toDifferenceStatus(),
      pillarId: json['PillarId'] as String?,
      pillarName: json['PillarName'] as String?,
      questionDifferences: (json['QuestionDifferences'] as List?)
          ?.whereNotNull()
          .map((e) => QuestionDifference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final differenceStatus = this.differenceStatus;
    final pillarId = this.pillarId;
    final pillarName = this.pillarName;
    final questionDifferences = this.questionDifferences;
    return {
      if (differenceStatus != null)
        'DifferenceStatus': differenceStatus.toValue(),
      if (pillarId != null) 'PillarId': pillarId,
      if (pillarName != null) 'PillarName': pillarName,
      if (questionDifferences != null)
        'QuestionDifferences': questionDifferences,
    };
  }
}

/// A metric for a particular pillar in a lens.
class PillarMetric {
  final String? pillarId;

  /// The questions that have been identified as risks in the pillar.
  final List<QuestionMetric>? questions;
  final Map<Risk, int>? riskCounts;

  PillarMetric({
    this.pillarId,
    this.questions,
    this.riskCounts,
  });

  factory PillarMetric.fromJson(Map<String, dynamic> json) {
    return PillarMetric(
      pillarId: json['PillarId'] as String?,
      questions: (json['Questions'] as List?)
          ?.whereNotNull()
          .map((e) => QuestionMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      riskCounts: (json['RiskCounts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toRisk(), e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final pillarId = this.pillarId;
    final questions = this.questions;
    final riskCounts = this.riskCounts;
    return {
      if (pillarId != null) 'PillarId': pillarId,
      if (questions != null) 'Questions': questions,
      if (riskCounts != null)
        'RiskCounts': riskCounts.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// A pillar review summary of a lens review.
class PillarReviewSummary {
  final String? notes;
  final String? pillarId;
  final String? pillarName;
  final Map<Risk, int>? riskCounts;

  PillarReviewSummary({
    this.notes,
    this.pillarId,
    this.pillarName,
    this.riskCounts,
  });

  factory PillarReviewSummary.fromJson(Map<String, dynamic> json) {
    return PillarReviewSummary(
      notes: json['Notes'] as String?,
      pillarId: json['PillarId'] as String?,
      pillarName: json['PillarName'] as String?,
      riskCounts: (json['RiskCounts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toRisk(), e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final notes = this.notes;
    final pillarId = this.pillarId;
    final pillarName = this.pillarName;
    final riskCounts = this.riskCounts;
    return {
      if (notes != null) 'Notes': notes,
      if (pillarId != null) 'PillarId': pillarId,
      if (pillarName != null) 'PillarName': pillarName,
      if (riskCounts != null)
        'RiskCounts': riskCounts.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// A question difference return object.
class QuestionDifference {
  /// Indicates the type of change to the question.
  final DifferenceStatus? differenceStatus;
  final String? questionId;
  final String? questionTitle;

  QuestionDifference({
    this.differenceStatus,
    this.questionId,
    this.questionTitle,
  });

  factory QuestionDifference.fromJson(Map<String, dynamic> json) {
    return QuestionDifference(
      differenceStatus:
          (json['DifferenceStatus'] as String?)?.toDifferenceStatus(),
      questionId: json['QuestionId'] as String?,
      questionTitle: json['QuestionTitle'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final differenceStatus = this.differenceStatus;
    final questionId = this.questionId;
    final questionTitle = this.questionTitle;
    return {
      if (differenceStatus != null)
        'DifferenceStatus': differenceStatus.toValue(),
      if (questionId != null) 'QuestionId': questionId,
      if (questionTitle != null) 'QuestionTitle': questionTitle,
    };
  }
}

/// A metric for a particular question in the pillar.
class QuestionMetric {
  /// The best practices, or choices, that have been identified as contributing to
  /// risk in a question.
  final List<BestPractice>? bestPractices;
  final String? questionId;
  final Risk? risk;

  QuestionMetric({
    this.bestPractices,
    this.questionId,
    this.risk,
  });

  factory QuestionMetric.fromJson(Map<String, dynamic> json) {
    return QuestionMetric(
      bestPractices: (json['BestPractices'] as List?)
          ?.whereNotNull()
          .map((e) => BestPractice.fromJson(e as Map<String, dynamic>))
          .toList(),
      questionId: json['QuestionId'] as String?,
      risk: (json['Risk'] as String?)?.toRisk(),
    );
  }

  Map<String, dynamic> toJson() {
    final bestPractices = this.bestPractices;
    final questionId = this.questionId;
    final risk = this.risk;
    return {
      if (bestPractices != null) 'BestPractices': bestPractices,
      if (questionId != null) 'QuestionId': questionId,
      if (risk != null) 'Risk': risk.toValue(),
    };
  }
}

enum ReportFormat {
  pdf,
  json,
}

extension ReportFormatValueExtension on ReportFormat {
  String toValue() {
    switch (this) {
      case ReportFormat.pdf:
        return 'PDF';
      case ReportFormat.json:
        return 'JSON';
    }
  }
}

extension ReportFormatFromString on String {
  ReportFormat toReportFormat() {
    switch (this) {
      case 'PDF':
        return ReportFormat.pdf;
      case 'JSON':
        return ReportFormat.json;
    }
    throw Exception('$this is not known in enum ReportFormat');
  }
}

/// The risk for a given workload, lens review, pillar, or question.
enum Risk {
  unanswered,
  high,
  medium,
  none,
  notApplicable,
}

extension RiskValueExtension on Risk {
  String toValue() {
    switch (this) {
      case Risk.unanswered:
        return 'UNANSWERED';
      case Risk.high:
        return 'HIGH';
      case Risk.medium:
        return 'MEDIUM';
      case Risk.none:
        return 'NONE';
      case Risk.notApplicable:
        return 'NOT_APPLICABLE';
    }
  }
}

extension RiskFromString on String {
  Risk toRisk() {
    switch (this) {
      case 'UNANSWERED':
        return Risk.unanswered;
      case 'HIGH':
        return Risk.high;
      case 'MEDIUM':
        return Risk.medium;
      case 'NONE':
        return Risk.none;
      case 'NOT_APPLICABLE':
        return Risk.notApplicable;
    }
    throw Exception('$this is not known in enum Risk');
  }
}

/// The share invitation.
class ShareInvitation {
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;

  /// The ID assigned to the share invitation.
  final String? shareInvitationId;

  /// The resource type of the share invitation.
  final ShareResourceType? shareResourceType;
  final String? workloadId;

  ShareInvitation({
    this.lensAlias,
    this.lensArn,
    this.shareInvitationId,
    this.shareResourceType,
    this.workloadId,
  });

  factory ShareInvitation.fromJson(Map<String, dynamic> json) {
    return ShareInvitation(
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      shareInvitationId: json['ShareInvitationId'] as String?,
      shareResourceType:
          (json['ShareResourceType'] as String?)?.toShareResourceType(),
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final shareInvitationId = this.shareInvitationId;
    final shareResourceType = this.shareResourceType;
    final workloadId = this.workloadId;
    return {
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (shareInvitationId != null) 'ShareInvitationId': shareInvitationId,
      if (shareResourceType != null)
        'ShareResourceType': shareResourceType.toValue(),
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Share invitation action taken by contributor.
enum ShareInvitationAction {
  accept,
  reject,
}

extension ShareInvitationActionValueExtension on ShareInvitationAction {
  String toValue() {
    switch (this) {
      case ShareInvitationAction.accept:
        return 'ACCEPT';
      case ShareInvitationAction.reject:
        return 'REJECT';
    }
  }
}

extension ShareInvitationActionFromString on String {
  ShareInvitationAction toShareInvitationAction() {
    switch (this) {
      case 'ACCEPT':
        return ShareInvitationAction.accept;
      case 'REJECT':
        return ShareInvitationAction.reject;
    }
    throw Exception('$this is not known in enum ShareInvitationAction');
  }
}

/// A share invitation summary return object.
class ShareInvitationSummary {
  /// The ARN for the lens.
  final String? lensArn;
  final String? lensName;
  final PermissionType? permissionType;

  /// The ID assigned to the share invitation.
  final String? shareInvitationId;

  /// The resource type of the share invitation.
  final ShareResourceType? shareResourceType;
  final String? sharedBy;
  final String? sharedWith;
  final String? workloadId;
  final String? workloadName;

  ShareInvitationSummary({
    this.lensArn,
    this.lensName,
    this.permissionType,
    this.shareInvitationId,
    this.shareResourceType,
    this.sharedBy,
    this.sharedWith,
    this.workloadId,
    this.workloadName,
  });

  factory ShareInvitationSummary.fromJson(Map<String, dynamic> json) {
    return ShareInvitationSummary(
      lensArn: json['LensArn'] as String?,
      lensName: json['LensName'] as String?,
      permissionType: (json['PermissionType'] as String?)?.toPermissionType(),
      shareInvitationId: json['ShareInvitationId'] as String?,
      shareResourceType:
          (json['ShareResourceType'] as String?)?.toShareResourceType(),
      sharedBy: json['SharedBy'] as String?,
      sharedWith: json['SharedWith'] as String?,
      workloadId: json['WorkloadId'] as String?,
      workloadName: json['WorkloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensArn = this.lensArn;
    final lensName = this.lensName;
    final permissionType = this.permissionType;
    final shareInvitationId = this.shareInvitationId;
    final shareResourceType = this.shareResourceType;
    final sharedBy = this.sharedBy;
    final sharedWith = this.sharedWith;
    final workloadId = this.workloadId;
    final workloadName = this.workloadName;
    return {
      if (lensArn != null) 'LensArn': lensArn,
      if (lensName != null) 'LensName': lensName,
      if (permissionType != null) 'PermissionType': permissionType.toValue(),
      if (shareInvitationId != null) 'ShareInvitationId': shareInvitationId,
      if (shareResourceType != null)
        'ShareResourceType': shareResourceType.toValue(),
      if (sharedBy != null) 'SharedBy': sharedBy,
      if (sharedWith != null) 'SharedWith': sharedWith,
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadName != null) 'WorkloadName': workloadName,
    };
  }
}

enum ShareResourceType {
  workload,
  lens,
}

extension ShareResourceTypeValueExtension on ShareResourceType {
  String toValue() {
    switch (this) {
      case ShareResourceType.workload:
        return 'WORKLOAD';
      case ShareResourceType.lens:
        return 'LENS';
    }
  }
}

extension ShareResourceTypeFromString on String {
  ShareResourceType toShareResourceType() {
    switch (this) {
      case 'WORKLOAD':
        return ShareResourceType.workload;
      case 'LENS':
        return ShareResourceType.lens;
    }
    throw Exception('$this is not known in enum ShareResourceType');
  }
}

/// The status of a workload share.
enum ShareStatus {
  accepted,
  rejected,
  pending,
  revoked,
  expired,
  associating,
  associated,
  failed,
}

extension ShareStatusValueExtension on ShareStatus {
  String toValue() {
    switch (this) {
      case ShareStatus.accepted:
        return 'ACCEPTED';
      case ShareStatus.rejected:
        return 'REJECTED';
      case ShareStatus.pending:
        return 'PENDING';
      case ShareStatus.revoked:
        return 'REVOKED';
      case ShareStatus.expired:
        return 'EXPIRED';
      case ShareStatus.associating:
        return 'ASSOCIATING';
      case ShareStatus.associated:
        return 'ASSOCIATED';
      case ShareStatus.failed:
        return 'FAILED';
    }
  }
}

extension ShareStatusFromString on String {
  ShareStatus toShareStatus() {
    switch (this) {
      case 'ACCEPTED':
        return ShareStatus.accepted;
      case 'REJECTED':
        return ShareStatus.rejected;
      case 'PENDING':
        return ShareStatus.pending;
      case 'REVOKED':
        return ShareStatus.revoked;
      case 'EXPIRED':
        return ShareStatus.expired;
      case 'ASSOCIATING':
        return ShareStatus.associating;
      case 'ASSOCIATED':
        return ShareStatus.associated;
      case 'FAILED':
        return ShareStatus.failed;
    }
    throw Exception('$this is not known in enum ShareStatus');
  }
}

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum TrustedAdvisorIntegrationStatus {
  enabled,
  disabled,
}

extension TrustedAdvisorIntegrationStatusValueExtension
    on TrustedAdvisorIntegrationStatus {
  String toValue() {
    switch (this) {
      case TrustedAdvisorIntegrationStatus.enabled:
        return 'ENABLED';
      case TrustedAdvisorIntegrationStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension TrustedAdvisorIntegrationStatusFromString on String {
  TrustedAdvisorIntegrationStatus toTrustedAdvisorIntegrationStatus() {
    switch (this) {
      case 'ENABLED':
        return TrustedAdvisorIntegrationStatus.enabled;
      case 'DISABLED':
        return TrustedAdvisorIntegrationStatus.disabled;
    }
    throw Exception(
        '$this is not known in enum TrustedAdvisorIntegrationStatus');
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Output of a update answer call.
class UpdateAnswerOutput {
  final Answer? answer;
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;
  final String? workloadId;

  UpdateAnswerOutput({
    this.answer,
    this.lensAlias,
    this.lensArn,
    this.workloadId,
  });

  factory UpdateAnswerOutput.fromJson(Map<String, dynamic> json) {
    return UpdateAnswerOutput(
      answer: json['Answer'] != null
          ? Answer.fromJson(json['Answer'] as Map<String, dynamic>)
          : null,
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final answer = this.answer;
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final workloadId = this.workloadId;
    return {
      if (answer != null) 'Answer': answer,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Output of a update lens review call.
class UpdateLensReviewOutput {
  final LensReview? lensReview;
  final String? workloadId;

  UpdateLensReviewOutput({
    this.lensReview,
    this.workloadId,
  });

  factory UpdateLensReviewOutput.fromJson(Map<String, dynamic> json) {
    return UpdateLensReviewOutput(
      lensReview: json['LensReview'] != null
          ? LensReview.fromJson(json['LensReview'] as Map<String, dynamic>)
          : null,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensReview = this.lensReview;
    final workloadId = this.workloadId;
    return {
      if (lensReview != null) 'LensReview': lensReview,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

class UpdateShareInvitationOutput {
  /// The updated workload or custom lens share invitation.
  final ShareInvitation? shareInvitation;

  UpdateShareInvitationOutput({
    this.shareInvitation,
  });

  factory UpdateShareInvitationOutput.fromJson(Map<String, dynamic> json) {
    return UpdateShareInvitationOutput(
      shareInvitation: json['ShareInvitation'] != null
          ? ShareInvitation.fromJson(
              json['ShareInvitation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final shareInvitation = this.shareInvitation;
    return {
      if (shareInvitation != null) 'ShareInvitation': shareInvitation,
    };
  }
}

/// Output of an update workload call.
class UpdateWorkloadOutput {
  final Workload? workload;

  UpdateWorkloadOutput({
    this.workload,
  });

  factory UpdateWorkloadOutput.fromJson(Map<String, dynamic> json) {
    return UpdateWorkloadOutput(
      workload: json['Workload'] != null
          ? Workload.fromJson(json['Workload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final workload = this.workload;
    return {
      if (workload != null) 'Workload': workload,
    };
  }
}

/// Input for Update Workload Share
class UpdateWorkloadShareOutput {
  final String? workloadId;
  final WorkloadShare? workloadShare;

  UpdateWorkloadShareOutput({
    this.workloadId,
    this.workloadShare,
  });

  factory UpdateWorkloadShareOutput.fromJson(Map<String, dynamic> json) {
    return UpdateWorkloadShareOutput(
      workloadId: json['WorkloadId'] as String?,
      workloadShare: json['WorkloadShare'] != null
          ? WorkloadShare.fromJson(
              json['WorkloadShare'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final workloadId = this.workloadId;
    final workloadShare = this.workloadShare;
    return {
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadShare != null) 'WorkloadShare': workloadShare,
    };
  }
}

/// The differences between the base and latest versions of the lens.
class VersionDifferences {
  /// The differences between the base and latest versions of the lens.
  final List<PillarDifference>? pillarDifferences;

  VersionDifferences({
    this.pillarDifferences,
  });

  factory VersionDifferences.fromJson(Map<String, dynamic> json) {
    return VersionDifferences(
      pillarDifferences: (json['PillarDifferences'] as List?)
          ?.whereNotNull()
          .map((e) => PillarDifference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pillarDifferences = this.pillarDifferences;
    return {
      if (pillarDifferences != null) 'PillarDifferences': pillarDifferences,
    };
  }
}

/// A workload return object.
class Workload {
  final List<String>? accountIds;

  /// List of AppRegistry application ARNs associated to the workload.
  final List<String>? applications;
  final String? architecturalDesign;
  final List<String>? awsRegions;
  final String? description;

  /// Discovery configuration associated to the workload.
  final WorkloadDiscoveryConfig? discoveryConfig;
  final WorkloadEnvironment? environment;
  final WorkloadImprovementStatus? improvementStatus;
  final String? industry;
  final String? industryType;

  /// Flag indicating whether the workload owner has acknowledged that the
  /// <i>Review owner</i> field is required.
  ///
  /// If a <b>Review owner</b> is not added to the workload within 60 days of
  /// acknowledgement, access to the workload is restricted until an owner is
  /// added.
  final bool? isReviewOwnerUpdateAcknowledged;
  final List<String>? lenses;
  final List<String>? nonAwsRegions;
  final String? notes;
  final String? owner;
  final List<String>? pillarPriorities;
  final String? reviewOwner;
  final DateTime? reviewRestrictionDate;
  final Map<Risk, int>? riskCounts;

  /// The ID assigned to the share invitation.
  final String? shareInvitationId;

  /// The tags associated with the workload.
  final Map<String, String>? tags;
  final DateTime? updatedAt;
  final String? workloadArn;
  final String? workloadId;
  final String? workloadName;

  Workload({
    this.accountIds,
    this.applications,
    this.architecturalDesign,
    this.awsRegions,
    this.description,
    this.discoveryConfig,
    this.environment,
    this.improvementStatus,
    this.industry,
    this.industryType,
    this.isReviewOwnerUpdateAcknowledged,
    this.lenses,
    this.nonAwsRegions,
    this.notes,
    this.owner,
    this.pillarPriorities,
    this.reviewOwner,
    this.reviewRestrictionDate,
    this.riskCounts,
    this.shareInvitationId,
    this.tags,
    this.updatedAt,
    this.workloadArn,
    this.workloadId,
    this.workloadName,
  });

  factory Workload.fromJson(Map<String, dynamic> json) {
    return Workload(
      accountIds: (json['AccountIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      applications: (json['Applications'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      architecturalDesign: json['ArchitecturalDesign'] as String?,
      awsRegions: (json['AwsRegions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['Description'] as String?,
      discoveryConfig: json['DiscoveryConfig'] != null
          ? WorkloadDiscoveryConfig.fromJson(
              json['DiscoveryConfig'] as Map<String, dynamic>)
          : null,
      environment: (json['Environment'] as String?)?.toWorkloadEnvironment(),
      improvementStatus:
          (json['ImprovementStatus'] as String?)?.toWorkloadImprovementStatus(),
      industry: json['Industry'] as String?,
      industryType: json['IndustryType'] as String?,
      isReviewOwnerUpdateAcknowledged:
          json['IsReviewOwnerUpdateAcknowledged'] as bool?,
      lenses: (json['Lenses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nonAwsRegions: (json['NonAwsRegions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      notes: json['Notes'] as String?,
      owner: json['Owner'] as String?,
      pillarPriorities: (json['PillarPriorities'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      reviewOwner: json['ReviewOwner'] as String?,
      reviewRestrictionDate: timeStampFromJson(json['ReviewRestrictionDate']),
      riskCounts: (json['RiskCounts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toRisk(), e as int)),
      shareInvitationId: json['ShareInvitationId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
      workloadArn: json['WorkloadArn'] as String?,
      workloadId: json['WorkloadId'] as String?,
      workloadName: json['WorkloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final applications = this.applications;
    final architecturalDesign = this.architecturalDesign;
    final awsRegions = this.awsRegions;
    final description = this.description;
    final discoveryConfig = this.discoveryConfig;
    final environment = this.environment;
    final improvementStatus = this.improvementStatus;
    final industry = this.industry;
    final industryType = this.industryType;
    final isReviewOwnerUpdateAcknowledged =
        this.isReviewOwnerUpdateAcknowledged;
    final lenses = this.lenses;
    final nonAwsRegions = this.nonAwsRegions;
    final notes = this.notes;
    final owner = this.owner;
    final pillarPriorities = this.pillarPriorities;
    final reviewOwner = this.reviewOwner;
    final reviewRestrictionDate = this.reviewRestrictionDate;
    final riskCounts = this.riskCounts;
    final shareInvitationId = this.shareInvitationId;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    final workloadArn = this.workloadArn;
    final workloadId = this.workloadId;
    final workloadName = this.workloadName;
    return {
      if (accountIds != null) 'AccountIds': accountIds,
      if (applications != null) 'Applications': applications,
      if (architecturalDesign != null)
        'ArchitecturalDesign': architecturalDesign,
      if (awsRegions != null) 'AwsRegions': awsRegions,
      if (description != null) 'Description': description,
      if (discoveryConfig != null) 'DiscoveryConfig': discoveryConfig,
      if (environment != null) 'Environment': environment.toValue(),
      if (improvementStatus != null)
        'ImprovementStatus': improvementStatus.toValue(),
      if (industry != null) 'Industry': industry,
      if (industryType != null) 'IndustryType': industryType,
      if (isReviewOwnerUpdateAcknowledged != null)
        'IsReviewOwnerUpdateAcknowledged': isReviewOwnerUpdateAcknowledged,
      if (lenses != null) 'Lenses': lenses,
      if (nonAwsRegions != null) 'NonAwsRegions': nonAwsRegions,
      if (notes != null) 'Notes': notes,
      if (owner != null) 'Owner': owner,
      if (pillarPriorities != null) 'PillarPriorities': pillarPriorities,
      if (reviewOwner != null) 'ReviewOwner': reviewOwner,
      if (reviewRestrictionDate != null)
        'ReviewRestrictionDate': unixTimestampToJson(reviewRestrictionDate),
      if (riskCounts != null)
        'RiskCounts': riskCounts.map((k, e) => MapEntry(k.toValue(), e)),
      if (shareInvitationId != null) 'ShareInvitationId': shareInvitationId,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
      if (workloadArn != null) 'WorkloadArn': workloadArn,
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadName != null) 'WorkloadName': workloadName,
    };
  }
}

/// Discovery configuration associated to the workload.
class WorkloadDiscoveryConfig {
  /// Discovery integration status in respect to Trusted Advisor for the workload.
  final TrustedAdvisorIntegrationStatus? trustedAdvisorIntegrationStatus;

  /// The mode to use for identifying resources associated with the workload.
  ///
  /// You can specify <code>WORKLOAD_METADATA</code>, <code>APP_REGISTRY</code>,
  /// or both.
  final List<DefinitionType>? workloadResourceDefinition;

  WorkloadDiscoveryConfig({
    this.trustedAdvisorIntegrationStatus,
    this.workloadResourceDefinition,
  });

  factory WorkloadDiscoveryConfig.fromJson(Map<String, dynamic> json) {
    return WorkloadDiscoveryConfig(
      trustedAdvisorIntegrationStatus:
          (json['TrustedAdvisorIntegrationStatus'] as String?)
              ?.toTrustedAdvisorIntegrationStatus(),
      workloadResourceDefinition: (json['WorkloadResourceDefinition'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toDefinitionType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final trustedAdvisorIntegrationStatus =
        this.trustedAdvisorIntegrationStatus;
    final workloadResourceDefinition = this.workloadResourceDefinition;
    return {
      if (trustedAdvisorIntegrationStatus != null)
        'TrustedAdvisorIntegrationStatus':
            trustedAdvisorIntegrationStatus.toValue(),
      if (workloadResourceDefinition != null)
        'WorkloadResourceDefinition':
            workloadResourceDefinition.map((e) => e.toValue()).toList(),
    };
  }
}

/// The environment for the workload.
enum WorkloadEnvironment {
  production,
  preproduction,
}

extension WorkloadEnvironmentValueExtension on WorkloadEnvironment {
  String toValue() {
    switch (this) {
      case WorkloadEnvironment.production:
        return 'PRODUCTION';
      case WorkloadEnvironment.preproduction:
        return 'PREPRODUCTION';
    }
  }
}

extension WorkloadEnvironmentFromString on String {
  WorkloadEnvironment toWorkloadEnvironment() {
    switch (this) {
      case 'PRODUCTION':
        return WorkloadEnvironment.production;
      case 'PREPRODUCTION':
        return WorkloadEnvironment.preproduction;
    }
    throw Exception('$this is not known in enum WorkloadEnvironment');
  }
}

/// The improvement status for a workload.
enum WorkloadImprovementStatus {
  notApplicable,
  notStarted,
  inProgress,
  complete,
  riskAcknowledged,
}

extension WorkloadImprovementStatusValueExtension on WorkloadImprovementStatus {
  String toValue() {
    switch (this) {
      case WorkloadImprovementStatus.notApplicable:
        return 'NOT_APPLICABLE';
      case WorkloadImprovementStatus.notStarted:
        return 'NOT_STARTED';
      case WorkloadImprovementStatus.inProgress:
        return 'IN_PROGRESS';
      case WorkloadImprovementStatus.complete:
        return 'COMPLETE';
      case WorkloadImprovementStatus.riskAcknowledged:
        return 'RISK_ACKNOWLEDGED';
    }
  }
}

extension WorkloadImprovementStatusFromString on String {
  WorkloadImprovementStatus toWorkloadImprovementStatus() {
    switch (this) {
      case 'NOT_APPLICABLE':
        return WorkloadImprovementStatus.notApplicable;
      case 'NOT_STARTED':
        return WorkloadImprovementStatus.notStarted;
      case 'IN_PROGRESS':
        return WorkloadImprovementStatus.inProgress;
      case 'COMPLETE':
        return WorkloadImprovementStatus.complete;
      case 'RISK_ACKNOWLEDGED':
        return WorkloadImprovementStatus.riskAcknowledged;
    }
    throw Exception('$this is not known in enum WorkloadImprovementStatus');
  }
}

/// A workload share return object.
class WorkloadShare {
  final PermissionType? permissionType;
  final String? shareId;
  final String? sharedBy;
  final String? sharedWith;
  final ShareStatus? status;
  final String? workloadId;
  final String? workloadName;

  WorkloadShare({
    this.permissionType,
    this.shareId,
    this.sharedBy,
    this.sharedWith,
    this.status,
    this.workloadId,
    this.workloadName,
  });

  factory WorkloadShare.fromJson(Map<String, dynamic> json) {
    return WorkloadShare(
      permissionType: (json['PermissionType'] as String?)?.toPermissionType(),
      shareId: json['ShareId'] as String?,
      sharedBy: json['SharedBy'] as String?,
      sharedWith: json['SharedWith'] as String?,
      status: (json['Status'] as String?)?.toShareStatus(),
      workloadId: json['WorkloadId'] as String?,
      workloadName: json['WorkloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final permissionType = this.permissionType;
    final shareId = this.shareId;
    final sharedBy = this.sharedBy;
    final sharedWith = this.sharedWith;
    final status = this.status;
    final workloadId = this.workloadId;
    final workloadName = this.workloadName;
    return {
      if (permissionType != null) 'PermissionType': permissionType.toValue(),
      if (shareId != null) 'ShareId': shareId,
      if (sharedBy != null) 'SharedBy': sharedBy,
      if (sharedWith != null) 'SharedWith': sharedWith,
      if (status != null) 'Status': status.toValue(),
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadName != null) 'WorkloadName': workloadName,
    };
  }
}

/// A workload share summary return object.
class WorkloadShareSummary {
  final PermissionType? permissionType;
  final String? shareId;
  final String? sharedWith;
  final ShareStatus? status;

  /// Optional message to compliment the Status field.
  final String? statusMessage;

  WorkloadShareSummary({
    this.permissionType,
    this.shareId,
    this.sharedWith,
    this.status,
    this.statusMessage,
  });

  factory WorkloadShareSummary.fromJson(Map<String, dynamic> json) {
    return WorkloadShareSummary(
      permissionType: (json['PermissionType'] as String?)?.toPermissionType(),
      shareId: json['ShareId'] as String?,
      sharedWith: json['SharedWith'] as String?,
      status: (json['Status'] as String?)?.toShareStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final permissionType = this.permissionType;
    final shareId = this.shareId;
    final sharedWith = this.sharedWith;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (permissionType != null) 'PermissionType': permissionType.toValue(),
      if (shareId != null) 'ShareId': shareId,
      if (sharedWith != null) 'SharedWith': sharedWith,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// A workload summary return object.
class WorkloadSummary {
  final WorkloadImprovementStatus? improvementStatus;
  final List<String>? lenses;
  final String? owner;
  final Map<Risk, int>? riskCounts;
  final DateTime? updatedAt;
  final String? workloadArn;
  final String? workloadId;
  final String? workloadName;

  WorkloadSummary({
    this.improvementStatus,
    this.lenses,
    this.owner,
    this.riskCounts,
    this.updatedAt,
    this.workloadArn,
    this.workloadId,
    this.workloadName,
  });

  factory WorkloadSummary.fromJson(Map<String, dynamic> json) {
    return WorkloadSummary(
      improvementStatus:
          (json['ImprovementStatus'] as String?)?.toWorkloadImprovementStatus(),
      lenses: (json['Lenses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      owner: json['Owner'] as String?,
      riskCounts: (json['RiskCounts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toRisk(), e as int)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
      workloadArn: json['WorkloadArn'] as String?,
      workloadId: json['WorkloadId'] as String?,
      workloadName: json['WorkloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final improvementStatus = this.improvementStatus;
    final lenses = this.lenses;
    final owner = this.owner;
    final riskCounts = this.riskCounts;
    final updatedAt = this.updatedAt;
    final workloadArn = this.workloadArn;
    final workloadId = this.workloadId;
    final workloadName = this.workloadName;
    return {
      if (improvementStatus != null)
        'ImprovementStatus': improvementStatus.toValue(),
      if (lenses != null) 'Lenses': lenses,
      if (owner != null) 'Owner': owner,
      if (riskCounts != null)
        'RiskCounts': riskCounts.map((k, e) => MapEntry(k.toValue(), e)),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
      if (workloadArn != null) 'WorkloadArn': workloadArn,
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadName != null) 'WorkloadName': workloadName,
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
