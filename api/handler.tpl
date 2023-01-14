package {{.PkgName}}

import (
	vd "github.com/21888/go-tagexpr-new/validator"
	"ticket-server/common/xerr"
	"github.com/go-playground/validator/v10"
	"github.com/zeromicro/go-zero/rest/httpx"
	"net/http"

	"ticket-server/common/result"

	{{if .After1_1_10}}"github.com/zeromicro/go-zero/rest/httpx"{{end}}
	{{.ImportPackages}}
)

func {{.HandlerName}}(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		{{if .HasRequest}}var req types.{{.RequestType}}
		if err := httpx.Parse(r, &req); err != nil {
			result.ParamErrorResult(r,w,err)
			return
		}
		if err := validator.New().StructCtx(r.Context(), req); err != nil {
			result.ParamErrorResult(r,w,err)
			return
		}
		if err := vd.Validate(req); err != nil {
			httpx.WriteJson(w, http.StatusBadRequest, result.Error(xerr.REUQEST_PARAM_ERROR, err.Error()))
			return
		}

		{{end}}l := {{.LogicName}}.New{{.LogicType}}(r.Context(), svcCtx)
		{{if .HasResp}}resp, {{end}}err := l.{{.Call}}({{if .HasRequest}}&req{{end}})
		result.HttpResult(r, w, {{if .HasResp}}resp{{else}}nil{{end}}, err)
	}
}
