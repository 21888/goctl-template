Delete(ctx context.Context,session sqlx.Session, {{.lowerStartCamelPrimaryKey}} {{.dataType}}) error
DeleteAllTruncate(ctx context.Context, session sqlx.Session, data *{{.upperStartCamelObject}}) error
DeleteBatchById(ctx context.Context, session sqlx.Session, data *{{.upperStartCamelObject}}, {{.lowerStartCamelPrimaryKey}}s []{{.dataType}}) error
DeleteBatchByIdAndSql(ctx context.Context, session sqlx.Session, data *{{.upperStartCamelObject}}, {{.lowerStartCamelPrimaryKey}}s []{{.dataType}}, andSql string) error