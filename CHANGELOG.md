## v0.6.7 (2017-06-16)
* Fixed #17 - when there was more than 9 items in collections, they were ordered
  1, 10, 11 ..., 2, 20, 21..., 3...

## v0.6.6 (2017-05-25)
* Fixed #15 - issue in collections, when `id` of struct was `""` instead of `nil`
* Changed Validator module to be compatible with `Formex.Ecto` `0.2`

## v0.6.5 (2017-04-01)
* Fixed using `multi_select` with array field when value of field is `nil`

## v0.6.4 (2017-03-08)
* Changed argument of `custom_value` callback

## v0.6.3 (2017-03-07)
* Added a `custom_value` option in fields

## v0.6.2 (2017-02-21)
* Added another way to define the `translate_error` function, to fix usage with Distillery.
  Details are in Formex.Validator docs.
* Added a default `translate_error` implementation, so you don't need to set it in config.ex,
  when you don't want to translate error messages.

## v0.6.1 (2017-02-16)
* Fixed file uploads in collections

## v0.6.0 (2017-12-26)
* Changed behaviour when user sends no value for field.

    ### Example
    You have a form with `first_name` and `last_name` fields, and user manually removes
    in browser the `first_name` field.

    What happens after form submit:
    * Prior to formex 0.6.0, the `first_name` value will be unchanged.
    * Since 0.6.0, the `first_name` value will be `""`.

    This new behaviour is the same as in the Symfony form library. It was necessary to change,
    because browser sends no value in `multiple_select` if there is nothing selected, or even
    there may be no value in normal `select` when we using Ajax Bootstrap Select plugin and
    was nothing selected.
* Fixed deselecting all options in multiple select
    [jakub-zawislak/formex_ecto#2](https://github.com/jakub-zawislak/formex_ecto/issues/2)

## v0.5.10 (2017-12-13)
* Changed behaviour of select validation. When user tried to provide an invalid select value
    (that wasn't in list of available options), an elixir error was raised.
    Since now user will see message `"invalid value"` attached to field, instead of server error.
    This message can be translated via gettext.

## v0.5.9 (2017-12-05)
* Added support for ajax selects plugins, such as
  [Ajax-Bootstrap-Select](https://github.com/truckingsim/Ajax-Bootstrap-Select)

## v0.5.8 (2017-11-19)
* Partially rewritten JS library. Now it supports multi-level nested forms.

## v0.5.7 (2017-11-12)
* Added `:struct_name` key in form collection struct for compability with validation libraries which
    (since 0.5.5) looks for `:struct_name` in form item instead of `:name`.

## v0.5.6 (2017-10-09)
* Fixed select validation when using another format for `<option>`'s than `[key: value]`

## v0.5.5 (2017-09-08)
* Added ability to use a different field name than in a structure

## v0.5.4 (2017-07-02)
* Restored `\n` to `<br>` conversion in error messages, which was removed in 0.5.0

## v0.5.3 (2017-07-02)
* Fixed nested forms when using with Ecto

## v0.5.2 (2017-07-01)
* Fixed applying new params to struct for nested forms and collections
* Created simple validator that only have one option: `:required`

## v0.5.0 (2017-06-25)
* Added ability to use library without Ecto
* Ecto functionality moved to `formex_ecto` library
* Added ability to use external validators
* `:required` option no longer validates presence of value. It's now used only in template
* Config option `:translate_error` is no longer required, by default errors are not translated

## v0.4.16 (2017-05-23)
* Template now converts `\n` to `<br>` in error messages using `Phoenix.HTML.Format.text_to_html\2`

## v0.4.15 (2017-04-27)
* Added `form` parameter in `Formex.Type.changeset_after_create_callback`

## v0.4.14 (2017-04-27)
* Fixed passing `form.opts` to a prototype form in `Formex.View.Collection`

See CHANGELOG.md for migration instructions

## v0.4.13 (2017-04-18)
* Temporarily removed ability to filter collection items, that was added in the 0.4.10

## v0.4.11 (2017-04-17)
* Added `Formex.View.formex_input` and `Formex.View.formex_label`

## v0.4.10 (2017-04-16)
* Ability to filter items in form collections
* Improved code of form collections. It's required to update JS library:
  Run `npm install formex`.

## v0.4.8 (2017-04-13)
* Added prefixes `formex-` in HTML attributes (`data-prototype` is now `data-formex-prototype` etc.).
  Run `npm install formex` to update JS library.

## v0.4.7 (2017-04-12)
* Fixed "`PhoenixHTMLHelpers.Form.Formex.CustomField.SelectAssoc/3` is undefined" errors
* Added `opts` argument in `Formex.Builder/4`

## v0.4.6 (2017-04-10)
* Fixed collections where items has ID as UUID instead of integer. `embedded_schema`
  uses UUID.

## v0.4.5 (2017-04-09)
* Fixed JS library

## v0.4.4 (2017-04-01)
* Added
  * Ability to use with `embedded_schema`, without a database

## v0.4.1 (2017-03-24)
* Added
  * Collections of forms
  * Ability to write templates of nested forms
* Changed
  * API of `Formex.View`

    Use `use Formex.View` instead of `import Formex.View` inside your web.ex

## v0.4.0 (2017-03-08)
* Changed API of `Formex.Type`
  * swapped second and third argument of `Formex.Type.add\4`.

    Instead of:
    ```elixir
    |> add(:text_input, :title)
    ```
    write:
    ```elixir
    |> add(:title, :text_input)
    ```
    The order of arguments is now the same as in Symfony.
  * removed `Formex.Type.add_button\4`. Use `Formex.Type.add\4` instead.
  * removed `Formex.Type.add_form\4`. Use `Formex.Type.add\4` instead.

## v0.3.3 (2017-03-06)
* Added
  * Nested forms with `_to_one` relation

## v0.3.2 (2017-02-22)
* Added
  * SelectAssoc
    * multiple_select support
  * Select
    * Validation if value sent by user exists in the generated select

## v0.3.1 (2017-02-18)
* Added
  * `Formex.Template.add_class`

## v0.3.0 (2017-02-17)
* Added
  * Ability to create a custom templates
  * Templates
    * Bootstrap horizontal
    * Bootstrap vertical
* Changed
  * Extracted repo functions from a `Formex.Builder` to a `Formex.Repo`.
  * `web/web.ex` - You have to `use Formex.Controller` instead of
    `import Formex.Builder` from now on.

* Removed
  * `formex_row_horizontal` and `formex_rows_horizontal`.
    You have to use a horizontal template from now on.

## v0.2.3 (2017-02-12)

* Added
  * Select Assoc
    * `group_by` option

## v0.2.2 (2017-02-09)

* Added
  * Select Assoc
    * `query` option
* Changed
  * Select Assoc
    * renamed `choice_name` to `choice_label`

## v0.2.1 (2017-02-07)

* Added
  * tests

## v0.2.0 (2017-01-28)

* Added
  * custom fields
