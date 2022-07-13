Delete(ctx context.Context,session sqlx.Session, {{.lowerStartCamelPrimaryKey}} {{.dataType}}) error
DeleteAllTruncate(ctx context.Context, session sqlx.Session) error