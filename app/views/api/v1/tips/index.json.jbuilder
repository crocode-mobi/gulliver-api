json.partial! 'api/v1/shared/pagination', resource: @tips
json.data @tips, partial: 'api/v1/shared/tip', as: :tip
