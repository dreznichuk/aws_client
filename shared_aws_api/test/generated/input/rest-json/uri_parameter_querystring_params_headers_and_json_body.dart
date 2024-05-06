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

/// URI parameter, querystring params, headers and JSON body
class URIParameterQuerystringParamsHeadersAndJSONBody {
  final _s.RestJsonProtocol _protocol;
  URIParameterQuerystringParamsHeadersAndJSONBody({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'URIParameter,QuerystringParams,HeadersAndJSONBody',
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

  Future<void> operationName0({
    required String pipelineId,
    String? ascending,
    String? checksum,
    StructType? config,
    String? pageToken,
  }) async {
    final headers = <String, String>{
      if (checksum != null) 'x-amz-checksum': checksum.toString(),
    };
    final $query = <String, List<String>>{
      if (ascending != null) 'Ascending': [ascending],
      if (pageToken != null) 'PageToken': [pageToken],
    };
    final $payload = <String, dynamic>{
      if (config != null) 'Config': config,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2014-01-01/jobsByPipeline/${Uri.encodeQueryComponent(pipelineId).replaceAll('+', '%20')}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }
}

class StructType {
  final String? a;
  final String? b;

  StructType({
    this.a,
    this.b,
  });

  Map<String, dynamic> toJson() {
    final a = this.a;
    final b = this.b;
    return {
      if (a != null) 'A': a,
      if (b != null) 'B': b,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
