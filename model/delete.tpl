func (m *default{{.upperStartCamelObject}}Model) Delete(ctx context.Context, session sqlx.Session, {{.lowerStartCamelPrimaryKey}} {{.dataType}}) error {
	{{if .withCache}}{{if .containsIndexCache}}_, err:=m.FindOne(ctx, {{.lowerStartCamelPrimaryKey}})
	if err!=nil{
		return err
	}

	{{end}}	{{.keys}}
	_, err {{if .containsIndexCache}}={{else}}:={{end}} m.ExecCtx(ctx, func(ctx context.Context, conn sqlx.SqlConn) (result sql.Result, err error) {
	query := fmt.Sprintf("delete from %s where {{.originalPrimaryKey}} = {{if .postgreSql}}$1{{else}}?{{end}}", m.table)
	if session!=nil{
		return session.ExecCtx(ctx,query, {{.lowerStartCamelPrimaryKey}})
	}
	return conn.ExecCtx(ctx, query, {{.lowerStartCamelPrimaryKey}})
	}, {{.keyValues}}){{else}}query := fmt.Sprintf("delete from %s where {{.originalPrimaryKey}} = {{if .postgreSql}}$1{{else}}?{{end}}", m.table)
	if session!=nil{
	_,err:= session.ExecCtx(ctx,query, {{.lowerStartCamelPrimaryKey}})
		return err
	}
	_,err:=m.conn.ExecCtx(ctx, query, {{.lowerStartCamelPrimaryKey}}){{end}}
	return err
}
// DeleteAllTruncate 需要将data中除了ID外的唯一键设置为*
func (m *default{{.upperStartCamelObject}}Model) DeleteAllTruncate(ctx context.Context, session sqlx.Session , data *{{.upperStartCamelObject}}) error {
	var id = "*"
	{{.keys}}

	_, err := m.ExecCtx(ctx, func(ctx context.Context, conn sqlx.SqlConn) (result sql.Result, err error) {
		query := fmt.Sprintf("truncate %s", m.table)
		if session != nil {
			return session.ExecCtx(ctx, query)
		}
		return conn.ExecCtx(ctx, query)
	}, {{.keyValues}})
	return err
}
// DeleteBatchById 需要将data中除了ID外的唯一键设置为*
func (m *default{{.upperStartCamelObject}}Model) DeleteBatchById(ctx context.Context, session sqlx.Session, data *{{.upperStartCamelObject}}, {{.lowerStartCamelPrimaryKey}}s []{{.dataType}}) error {
	var res []string
	for _, v := range {{.lowerStartCamelPrimaryKey}}s {
		res = append(res, fmt.Sprintf("'%v'", v))
	}
	delArr := strings.Join(res, ",")
	var id = "*"
	{{.keys}}
	_, err := m.ExecCtx(ctx, func(ctx context.Context, conn sqlx.SqlConn) (result sql.Result, err error) {
		query := fmt.Sprintf("DELETE FROM %s WHERE {{.lowerStartCamelPrimaryKey}} in (%s)", m.table , delArr)
		if session != nil {
			return session.ExecCtx(ctx, query)
		}
		return conn.ExecCtx(ctx, query)
	}, {{.keyValues}})
	return err
}

// DeleteBatchByIdAndSql 需要将data中除了ID外的唯一键设置为*
func (m *default{{.upperStartCamelObject}}Model) DeleteBatchByIdAndSql(ctx context.Context, session sqlx.Session, data *{{.upperStartCamelObject}}, {{.lowerStartCamelPrimaryKey}}s []{{.dataType}}, andSql string) error {
	var res []string
	for _, v := range {{.lowerStartCamelPrimaryKey}}s {
		res = append(res, fmt.Sprintf("'%v'", v))
	}
	delArr := strings.Join(res, ",")
	var id = "*"
	{{.keys}}
	_, err := m.ExecCtx(ctx, func(ctx context.Context, conn sqlx.SqlConn) (result sql.Result, err error) {
		query := fmt.Sprintf("DELETE FROM %s WHERE {{.lowerStartCamelPrimaryKey}} in (%s) %s", m.table , delArr, andSql)
		if session != nil {
			return session.ExecCtx(ctx, query)
		}
		return conn.ExecCtx(ctx, query)
	}, {{.keyValues}})
	return err
}










{{/*

{{.keys}}
	appClientAppClientLogsIdKey := fmt.Sprintf("%s%v", cacheAppClientAppClientLogsIdPrefix, id)

{{.keyValues}}
	appClientAppClientLogsIdKey

{{.originalPrimaryKey}}
	`id`
{{.lowerStartCamelPrimaryKey}}
	id
{{.dataType}}
	int64
{{.upperStartCamelObject}}
	AppClientLogs				数据库实体结构


*/}}

{{/*

map[
	containsIndexCache:false
	data:{
		{
		{app_client}
		{app_client}
		{{ {id} int64  1 1} true}
		map[] [0xc00010a500 0xc00010a550 0xc00010a5a0 0xc00010a5f0 0xc00010a640 0xc00010a690]
		}
	 {
		cacheAppClientAppClientIdPrefix
		"cache:appClient:appClient:id:"
		cacheAppClientAppClientIdPrefix = "cache:appClient:appClient:id:"
		appClientAppClientIdKey
		fmt.Sprintf("%s%v", cacheAppClientAppClientIdPrefix, id)
		fmt.Sprintf("%s%v", cacheAppClientAppClientIdPrefix, data.Id)
		appClientAppClientIdKey := fmt.Sprintf("%s%v", cacheAppClientAppClientIdPrefix, id)
		appClientAppClientIdKey := fmt.Sprintf("%s%v", cacheAppClientAppClientIdPrefix, data.Id)
		[id]
		[0xc00049e7a0]
	}
	  [] false
	}
	dataType:int64
	keyValues:appClientAppClientIdKey
	keys:appClientAppClientIdKey := fmt.Sprintf("%s%v", cacheAppClientAppClientIdPrefix, id)
	lowerStartCamelPrimaryKey:id
	originalPrimaryKey:`id`
	postgreSql:false
	upperStartCamelObject:AppClient
	withCache:true
]


*/}}