Delete(ctx context.Context,session sqlx.Session, {{.lowerStartCamelPrimaryKey}} {{.dataType}}) error
DeleteAllTruncate(ctx context.Context, session sqlx.Session) error
DeleteBatchById(ctx context.Context, session sqlx.Session, {{.lowerStartCamelPrimaryKey}}s []{{.dataType}}) error
DeleteBatchByIdAndSql(ctx context.Context, session sqlx.Session, {{.lowerStartCamelPrimaryKey}}s []{{.dataType}}, andSql string) error