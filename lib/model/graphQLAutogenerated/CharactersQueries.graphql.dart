import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$CharacterImage {
  Query$CharacterImage({
    this.Page,
    this.$__typename = 'Query',
  });

  factory Query$CharacterImage.fromJson(Map<String, dynamic> json) {
    final l$Page = json['Page'];
    final l$$__typename = json['__typename'];
    return Query$CharacterImage(
      Page: l$Page == null
          ? null
          : Query$CharacterImage$Page.fromJson(
              (l$Page as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$CharacterImage$Page? Page;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$Page = Page;
    _resultData['Page'] = l$Page?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$Page = Page;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$Page,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$CharacterImage) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$Page = Page;
    final lOther$Page = other.Page;
    if (l$Page != lOther$Page) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$CharacterImage on Query$CharacterImage {
  CopyWith$Query$CharacterImage<Query$CharacterImage> get copyWith =>
      CopyWith$Query$CharacterImage(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$CharacterImage<TRes> {
  factory CopyWith$Query$CharacterImage(
    Query$CharacterImage instance,
    TRes Function(Query$CharacterImage) then,
  ) = _CopyWithImpl$Query$CharacterImage;

  factory CopyWith$Query$CharacterImage.stub(TRes res) =
      _CopyWithStubImpl$Query$CharacterImage;

  TRes call({
    Query$CharacterImage$Page? Page,
    String? $__typename,
  });
  CopyWith$Query$CharacterImage$Page<TRes> get Page;
}

class _CopyWithImpl$Query$CharacterImage<TRes>
    implements CopyWith$Query$CharacterImage<TRes> {
  _CopyWithImpl$Query$CharacterImage(
    this._instance,
    this._then,
  );

  final Query$CharacterImage _instance;

  final TRes Function(Query$CharacterImage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Page = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$CharacterImage(
        Page: Page == _undefined
            ? _instance.Page
            : (Page as Query$CharacterImage$Page?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$CharacterImage$Page<TRes> get Page {
    final local$Page = _instance.Page;
    return local$Page == null
        ? CopyWith$Query$CharacterImage$Page.stub(_then(_instance))
        : CopyWith$Query$CharacterImage$Page(local$Page, (e) => call(Page: e));
  }
}

class _CopyWithStubImpl$Query$CharacterImage<TRes>
    implements CopyWith$Query$CharacterImage<TRes> {
  _CopyWithStubImpl$Query$CharacterImage(this._res);

  TRes _res;

  call({
    Query$CharacterImage$Page? Page,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$CharacterImage$Page<TRes> get Page =>
      CopyWith$Query$CharacterImage$Page.stub(_res);
}

const documentNodeQueryCharacterImage = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'CharacterImage'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'Page'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'page'),
            value: IntValueNode(value: '1'),
          ),
          ArgumentNode(
            name: NameNode(value: 'perPage'),
            value: IntValueNode(value: '20'),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'characters'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'image'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'medium'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$CharacterImage _parserFn$Query$CharacterImage(
        Map<String, dynamic> data) =>
    Query$CharacterImage.fromJson(data);
typedef OnQueryComplete$Query$CharacterImage = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$CharacterImage?,
);

class Options$Query$CharacterImage
    extends graphql.QueryOptions<Query$CharacterImage> {
  Options$Query$CharacterImage({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$CharacterImage? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$CharacterImage? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$CharacterImage(data),
                  ),
          onError: onError,
          document: documentNodeQueryCharacterImage,
          parserFn: _parserFn$Query$CharacterImage,
        );

  final OnQueryComplete$Query$CharacterImage? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$CharacterImage
    extends graphql.WatchQueryOptions<Query$CharacterImage> {
  WatchOptions$Query$CharacterImage({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$CharacterImage? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryCharacterImage,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$CharacterImage,
        );
}

class FetchMoreOptions$Query$CharacterImage extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$CharacterImage(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryCharacterImage,
        );
}

extension ClientExtension$Query$CharacterImage on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$CharacterImage>> query$CharacterImage(
          [Options$Query$CharacterImage? options]) async =>
      await this.query(options ?? Options$Query$CharacterImage());
  graphql.ObservableQuery<Query$CharacterImage> watchQuery$CharacterImage(
          [WatchOptions$Query$CharacterImage? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$CharacterImage());
  void writeQuery$CharacterImage({
    required Query$CharacterImage data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryCharacterImage)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$CharacterImage? readQuery$CharacterImage({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryCharacterImage)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$CharacterImage.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$CharacterImage> useQuery$CharacterImage(
        [Options$Query$CharacterImage? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$CharacterImage());
graphql.ObservableQuery<Query$CharacterImage> useWatchQuery$CharacterImage(
        [WatchOptions$Query$CharacterImage? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$CharacterImage());

class Query$CharacterImage$Widget
    extends graphql_flutter.Query<Query$CharacterImage> {
  Query$CharacterImage$Widget({
    widgets.Key? key,
    Options$Query$CharacterImage? options,
    required graphql_flutter.QueryBuilder<Query$CharacterImage> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$CharacterImage(),
          builder: builder,
        );
}

class Query$CharacterImage$Page {
  Query$CharacterImage$Page({
    this.characters,
    this.$__typename = 'Page',
  });

  factory Query$CharacterImage$Page.fromJson(Map<String, dynamic> json) {
    final l$characters = json['characters'];
    final l$$__typename = json['__typename'];
    return Query$CharacterImage$Page(
      characters: (l$characters as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$CharacterImage$Page$characters.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$CharacterImage$Page$characters?>? characters;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$characters = characters;
    _resultData['characters'] = l$characters?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$characters = characters;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$characters == null ? null : Object.hashAll(l$characters.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$CharacterImage$Page) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$characters = characters;
    final lOther$characters = other.characters;
    if (l$characters != null && lOther$characters != null) {
      if (l$characters.length != lOther$characters.length) {
        return false;
      }
      for (int i = 0; i < l$characters.length; i++) {
        final l$characters$entry = l$characters[i];
        final lOther$characters$entry = lOther$characters[i];
        if (l$characters$entry != lOther$characters$entry) {
          return false;
        }
      }
    } else if (l$characters != lOther$characters) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$CharacterImage$Page
    on Query$CharacterImage$Page {
  CopyWith$Query$CharacterImage$Page<Query$CharacterImage$Page> get copyWith =>
      CopyWith$Query$CharacterImage$Page(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$CharacterImage$Page<TRes> {
  factory CopyWith$Query$CharacterImage$Page(
    Query$CharacterImage$Page instance,
    TRes Function(Query$CharacterImage$Page) then,
  ) = _CopyWithImpl$Query$CharacterImage$Page;

  factory CopyWith$Query$CharacterImage$Page.stub(TRes res) =
      _CopyWithStubImpl$Query$CharacterImage$Page;

  TRes call({
    List<Query$CharacterImage$Page$characters?>? characters,
    String? $__typename,
  });
  TRes characters(
      Iterable<Query$CharacterImage$Page$characters?>? Function(
              Iterable<
                  CopyWith$Query$CharacterImage$Page$characters<
                      Query$CharacterImage$Page$characters>?>?)
          _fn);
}

class _CopyWithImpl$Query$CharacterImage$Page<TRes>
    implements CopyWith$Query$CharacterImage$Page<TRes> {
  _CopyWithImpl$Query$CharacterImage$Page(
    this._instance,
    this._then,
  );

  final Query$CharacterImage$Page _instance;

  final TRes Function(Query$CharacterImage$Page) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? characters = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$CharacterImage$Page(
        characters: characters == _undefined
            ? _instance.characters
            : (characters as List<Query$CharacterImage$Page$characters?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes characters(
          Iterable<Query$CharacterImage$Page$characters?>? Function(
                  Iterable<
                      CopyWith$Query$CharacterImage$Page$characters<
                          Query$CharacterImage$Page$characters>?>?)
              _fn) =>
      call(
          characters: _fn(_instance.characters?.map((e) => e == null
              ? null
              : CopyWith$Query$CharacterImage$Page$characters(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$CharacterImage$Page<TRes>
    implements CopyWith$Query$CharacterImage$Page<TRes> {
  _CopyWithStubImpl$Query$CharacterImage$Page(this._res);

  TRes _res;

  call({
    List<Query$CharacterImage$Page$characters?>? characters,
    String? $__typename,
  }) =>
      _res;
  characters(_fn) => _res;
}

class Query$CharacterImage$Page$characters {
  Query$CharacterImage$Page$characters({
    this.image,
    this.$__typename = 'Character',
  });

  factory Query$CharacterImage$Page$characters.fromJson(
      Map<String, dynamic> json) {
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$CharacterImage$Page$characters(
      image: l$image == null
          ? null
          : Query$CharacterImage$Page$characters$image.fromJson(
              (l$image as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$CharacterImage$Page$characters$image? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$image = image;
    _resultData['image'] = l$image?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$CharacterImage$Page$characters) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$CharacterImage$Page$characters
    on Query$CharacterImage$Page$characters {
  CopyWith$Query$CharacterImage$Page$characters<
          Query$CharacterImage$Page$characters>
      get copyWith => CopyWith$Query$CharacterImage$Page$characters(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$CharacterImage$Page$characters<TRes> {
  factory CopyWith$Query$CharacterImage$Page$characters(
    Query$CharacterImage$Page$characters instance,
    TRes Function(Query$CharacterImage$Page$characters) then,
  ) = _CopyWithImpl$Query$CharacterImage$Page$characters;

  factory CopyWith$Query$CharacterImage$Page$characters.stub(TRes res) =
      _CopyWithStubImpl$Query$CharacterImage$Page$characters;

  TRes call({
    Query$CharacterImage$Page$characters$image? image,
    String? $__typename,
  });
  CopyWith$Query$CharacterImage$Page$characters$image<TRes> get image;
}

class _CopyWithImpl$Query$CharacterImage$Page$characters<TRes>
    implements CopyWith$Query$CharacterImage$Page$characters<TRes> {
  _CopyWithImpl$Query$CharacterImage$Page$characters(
    this._instance,
    this._then,
  );

  final Query$CharacterImage$Page$characters _instance;

  final TRes Function(Query$CharacterImage$Page$characters) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$CharacterImage$Page$characters(
        image: image == _undefined
            ? _instance.image
            : (image as Query$CharacterImage$Page$characters$image?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$CharacterImage$Page$characters$image<TRes> get image {
    final local$image = _instance.image;
    return local$image == null
        ? CopyWith$Query$CharacterImage$Page$characters$image.stub(
            _then(_instance))
        : CopyWith$Query$CharacterImage$Page$characters$image(
            local$image, (e) => call(image: e));
  }
}

class _CopyWithStubImpl$Query$CharacterImage$Page$characters<TRes>
    implements CopyWith$Query$CharacterImage$Page$characters<TRes> {
  _CopyWithStubImpl$Query$CharacterImage$Page$characters(this._res);

  TRes _res;

  call({
    Query$CharacterImage$Page$characters$image? image,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$CharacterImage$Page$characters$image<TRes> get image =>
      CopyWith$Query$CharacterImage$Page$characters$image.stub(_res);
}

class Query$CharacterImage$Page$characters$image {
  Query$CharacterImage$Page$characters$image({
    this.medium,
    this.$__typename = 'CharacterImage',
  });

  factory Query$CharacterImage$Page$characters$image.fromJson(
      Map<String, dynamic> json) {
    final l$medium = json['medium'];
    final l$$__typename = json['__typename'];
    return Query$CharacterImage$Page$characters$image(
      medium: (l$medium as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? medium;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$medium = medium;
    _resultData['medium'] = l$medium;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$medium = medium;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$medium,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$CharacterImage$Page$characters$image) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$medium = medium;
    final lOther$medium = other.medium;
    if (l$medium != lOther$medium) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$CharacterImage$Page$characters$image
    on Query$CharacterImage$Page$characters$image {
  CopyWith$Query$CharacterImage$Page$characters$image<
          Query$CharacterImage$Page$characters$image>
      get copyWith => CopyWith$Query$CharacterImage$Page$characters$image(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$CharacterImage$Page$characters$image<TRes> {
  factory CopyWith$Query$CharacterImage$Page$characters$image(
    Query$CharacterImage$Page$characters$image instance,
    TRes Function(Query$CharacterImage$Page$characters$image) then,
  ) = _CopyWithImpl$Query$CharacterImage$Page$characters$image;

  factory CopyWith$Query$CharacterImage$Page$characters$image.stub(TRes res) =
      _CopyWithStubImpl$Query$CharacterImage$Page$characters$image;

  TRes call({
    String? medium,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$CharacterImage$Page$characters$image<TRes>
    implements CopyWith$Query$CharacterImage$Page$characters$image<TRes> {
  _CopyWithImpl$Query$CharacterImage$Page$characters$image(
    this._instance,
    this._then,
  );

  final Query$CharacterImage$Page$characters$image _instance;

  final TRes Function(Query$CharacterImage$Page$characters$image) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? medium = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$CharacterImage$Page$characters$image(
        medium: medium == _undefined ? _instance.medium : (medium as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$CharacterImage$Page$characters$image<TRes>
    implements CopyWith$Query$CharacterImage$Page$characters$image<TRes> {
  _CopyWithStubImpl$Query$CharacterImage$Page$characters$image(this._res);

  TRes _res;

  call({
    String? medium,
    String? $__typename,
  }) =>
      _res;
}
