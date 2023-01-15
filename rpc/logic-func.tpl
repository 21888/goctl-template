{{if .hasComment}}{{.comment}}{{end}}
func (l *{{.logicName}}) {{.method}} ({{if .hasReq}}in {{.request}}{{if .stream}},stream {{.streamBody}}{{end}}{{else}}stream {{.streamBody}}{{end}}) ({{if .hasReply}}{{.response}},{{end}} error) {
	// add your logic here and delete this line
	{{/*判断是否是添加函数*/}}
	{{if .isAddFunc}}
		// 示例代码
		/*entity := new(model.实体类名)
		_ = copier.Copy(&entity, in)
		if _, err := l.svcCtx.对应的model.Insert(l.ctx, nil, entity); err != nil {
			if errMySQL, ok := err.(*mysql.MySQLError); ok {
				switch errMySQL.Number {
					case 1062:
					return nil, xerr.NewErrCodeMsg(xerr.DB_ERROR, "主键冲突")
				}
			}
			return nil, err
		}*/
	{{end}}
	{{/*判断是否是更新函数*/}}
	{{if .isUpdateFunc}}
		// 示例代码
		/*entity, err := l.svcCtx.对应的model.FindOne(l.ctx, in.Id)
		if err != nil {
			return nil, err
		}
		_ = copier.Copy(&entity, &in)
		// custom replacement entity field
		if _, err := l.svcCtx.对应的model.Update(l.ctx, nil, entity); err != nil {
			return nil, err
		}*/
	{{end}}
	{{/*判断是否是删除函数*/}}
	{{if .isDelFunc}}
		// 示例代码
		/*if err := l.svcCtx.对应的model.DeleteBatchById(l.ctx, nil, in.Id); err != nil {
			return nil, err
		}*/
	{{end}}
	{{/*判断是否是查询一条记录函数*/}}
	{{if .isGetOneFunc}}
		// 示例代码
		/*if one, err := l.svcCtx.对应的model.FindOne(l.ctx, in.Id); err != nil {
			if err == model.ErrNotFound {
				return nil, xerr.NewErrMsg(errorx.DataNotFound)
			}
			return nil, err
		} else {
			var res rpc包名.实体类名
			_ = copier.Copy(&res, one)
			return &{{.responseType}}{
				res: &res,
			}, nil
		}*/
	{{end}}
	{{/*判断是否是Search查询函数*/}}
	{{if .isSearchFunc}}
		// 示例代码
		/*if in.PageSize == enums.Zero {
			in.PageSize = enums.Ten
		}
		in.Page = in.Page + enums.One
		selectBuilder := l.svcCtx.对应的model.RowBuilder()
		countBuilder := l.svcCtx.对应的model.CountBuilder(model.ID_STR)
		// ============= 条件 =============
		selectBuilder, countBuilder = l.selectJoinBuilder(in, selectBuilder, countBuilder)
		// ============= 查询 =============
		if all, err := l.svcCtx.对应的model.FindPageListByPage(l.ctx, selectBuilder, in.Page, in.PageSize, "id DESC"); err != nil {
			return nil, err
		} else {
			var list []*rpc包名.实体类名
			for _, item := range all {
				var u rpc包名.实体类名
				if err := copier.Copy(&u, &item); err != nil {
					return nil, err
				}
				list = append(list, &u)
			}
			count, err := l.svcCtx.对应的model.FindCount(l.ctx, countBuilder)
			if err != nil {
				return nil, err
			}
			return &{{.responseType}}{
				实体类名: list,
				Total:     count,
			}, nil
		}*/
	{{end}}
	{{/*判断是否是Clear删除全部函数*/}}
	{{if .isClearFunc}}
		// 示例代码
		/*if err := l.svcCtx.对应的model.DeleteAllTruncate(l.ctx, nil); err != nil {
			return nil, err
		}*/
	{{end}}
	{{/*判断是否是Count统计函数*/}}
	{{if .isCountFunc}}
		// 示例代码
		/*builder := l.svcCtx.对应的model.CountBuilder(model.ID_STR)
		count, err := l.svcCtx.对应的model.FindCount(l.ctx, builder)
		if err != nil {
			return nil, err
		}
		return &{{.responseType}}{
			Count: count,
		}, nil*/
	{{end}}
	{{/*判断是否是Set修改函数*/}}
	{{if .isSetFunc}}
		// 示例代码
		/*
		if findOne, err := l.svcCtx.对应的model.FindOne(l.ctx, in.Id); err != nil {
			return nil, err
		} else {
			findOne.字段 = in.字段
			if _, err := l.svcCtx.对应的model.Update(l.ctx, nil, findOne); err != nil {
				return nil, err
			} else {
				return &{{.responseType}}{}, nil
			}
		}
		*/
	{{end}}
	return {{if .hasReply}}&{{.responseType}}{},{{end}} nil
}

{{if .isSearchFunc}}
/*
func (l *{{.logicName}}) selectJoinBuilder(in {{.request}}, selectBuilder squirrel.SelectBuilder, countBuilder squirrel.SelectBuilder) (squirrel.SelectBuilder, squirrel.SelectBuilder) {

	//Model的实体结构 struct {}

	if in.Id != enums.Zero {
		pred := squirrel.Eq{
			model.ID_STR: in.Id,
		}
		selectBuilder = selectBuilder.Where(pred)
		countBuilder = countBuilder.Where(pred)
	}
	if in.PId != model.SELECT_ALL {
		pred := squirrel.Eq{
			"p_id": in.PId,
		}
		selectBuilder = selectBuilder.Where(pred)
		countBuilder = countBuilder.Where(pred)
	}
	if in.NoteName != model.EMPTY_STRING {
		pred := squirrel.Eq{
			"note_name": in.NoteName,
		}
		selectBuilder = selectBuilder.Where(pred)
		countBuilder = countBuilder.Where(pred)
	}
	if in.CreatorTimeStart != model.SELECT_ALL {
		selectBuilder = selectBuilder.Where(squirrel.GtOrEq{
			model.CREATOR_TIME_STR: in.CreatorTimeStart,
		}).Where(squirrel.LtOrEq{
			model.CREATOR_TIME_STR: in.CreatorTimeEnd,
		})
		countBuilder = countBuilder.Where(squirrel.GtOrEq{
			model.CREATOR_TIME_STR: in.CreatorTimeStart,
		}).Where(squirrel.LtOrEq{
			model.CREATOR_TIME_STR: in.CreatorTimeEnd,
		})
	}

	return selectBuilder, countBuilder
}
*/
{{end}}
