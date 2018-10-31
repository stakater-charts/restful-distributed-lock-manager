{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "rdlm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "rdlm.labels.selector" -}}
app: {{ template "rdlm.name" . }}
group: {{ .Values.rdlm.labels.group }}
provider: {{ .Values.rdlm.labels.provider }}
{{- end -}}

{{- define "rdlm.labels.stakater" -}}
{{ template "rdlm.labels.selector" . }}
version: "{{ .Values.rdlm.labels.version }}"
{{- end -}}

{{- define "rdlm.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}