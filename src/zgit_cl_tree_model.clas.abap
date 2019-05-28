class ZGIT_CL_TREE_MODEL definition
  public
  create public .

public section.

*"* public components of class ZGIT_CL_TREE_MODEL
*"* do not include other source files here!!!
  interfaces IF_FLUSH_NOTIFY .

  constants EVENTID_DEF_CONTEXT_MENU_REQ type I value 1 ##NO_TEXT.
  constants EVENTID_NODE_CONTEXT_MENU_REQ type I value 2 ##NO_TEXT.
  constants EVENTID_NODE_DOUBLE_CLICK type I value 3 ##NO_TEXT.
  constants EVENTID_NODE_KEYPRESS type I value 4 ##NO_TEXT.
  constants EVENTID_SELECTION_CHANGED type I value 5 ##NO_TEXT.
  constants KEY_DELETE type I value 2 ##NO_TEXT.
  constants KEY_ENTER type I value 5 ##NO_TEXT.
  constants KEY_F1 type I value 1 ##NO_TEXT.
  constants KEY_F4 type I value 4 ##NO_TEXT.
  constants KEY_INSERT type I value 3 ##NO_TEXT.
  constants KEY_CUT type I value 6 ##NO_TEXT.
  constants KEY_COPY type I value 7 ##NO_TEXT.
  constants KEY_PASTE type I value 8 ##NO_TEXT.
  constants NODE_SEL_MODE_MULTIPLE type I value 1 ##NO_TEXT.
  constants NODE_SEL_MODE_SINGLE type I value 0 ##NO_TEXT.
  constants RELAT_FIRST_CHILD type I value 0 ##NO_TEXT.
  constants RELAT_FIRST_SIBLING type I value 4 ##NO_TEXT.
  constants RELAT_LAST_CHILD type I value 1 ##NO_TEXT.
  constants RELAT_LAST_SIBLING type I value 5 ##NO_TEXT.
  constants RELAT_NEXT_SIBLING type I value 3 ##NO_TEXT.
  constants RELAT_PREV_SIBLING type I value 2 ##NO_TEXT.
  constants SCROLL_DOWN_LINE type I value 2 ##NO_TEXT.
  constants SCROLL_DOWN_PAGE type I value 4 ##NO_TEXT.
  constants SCROLL_END type I value 6 ##NO_TEXT.
  constants SCROLL_HOME type I value 5 ##NO_TEXT.
  constants SCROLL_UP_LINE type I value 1 ##NO_TEXT.
  constants SCROLL_UP_PAGE type I value 3 ##NO_TEXT.
  constants STYLE_DEFAULT type I value 1 ##NO_TEXT.
  constants STYLE_EMPHASIZED type I value 7 ##NO_TEXT.
  constants STYLE_EMPHASIZED_NEGATIVE type I value 5 ##NO_TEXT.
  constants STYLE_EMPHASIZED_POSITIVE type I value 6 ##NO_TEXT.
  constants STYLE_INACTIVE type I value 3 ##NO_TEXT.
  constants STYLE_INHERITED type I value 0 ##NO_TEXT.
  constants STYLE_INTENSIFD_CRITICAL type I value 4 ##NO_TEXT.
  constants STYLE_INTENSIFIED type I value 2 ##NO_TEXT.
  constants FIND_CANCELED type I value 3 ##NO_TEXT.
  constants FIND_NO_MATCH type I value 0 ##NO_TEXT.
  constants FIND_MATCH type I value 1 ##NO_TEXT.
  constants FIND_EXPANDER_NODE_HIT type I value 2 ##NO_TEXT.
  constants STYLE_EMPHASIZED_A type I value 8 ##NO_TEXT.
  constants STYLE_EMPHASIZED_B type I value 9 ##NO_TEXT.
  constants STYLE_EMPHASIZED_C type I value 10 ##NO_TEXT.

  events DEFAULT_CONTEXT_MENU_REQUEST
    exporting
      value(MENU) type ref to CL_CTMENU .
  events DEFAULT_CONTEXT_MENU_SELECT
    exporting
      value(FCODE) type SY-UCOMM .
  events DROP
    exporting
      value(NODE_KEY) type TM_NODEKEY
      value(DRAG_DROP_OBJECT) type ref to CL_DRAGDROPOBJECT .
  events DROP_GET_FLAVOR
    exporting
      value(NODE_KEY) type TM_NODEKEY
      value(FLAVORS) type CNDD_FLAVORS
      value(DRAG_DROP_OBJECT) type ref to CL_DRAGDROPOBJECT .
  events EXPAND_NO_CHILDREN
    exporting
      value(NODE_KEY) type TM_NODEKEY .
  events NODE_CONTEXT_MENU_REQUEST
    exporting
      value(NODE_KEY) type TM_NODEKEY
      value(MENU) type ref to CL_CTMENU .
  events NODE_CONTEXT_MENU_SELECT
    exporting
      value(NODE_KEY) type TM_NODEKEY
      value(FCODE) type SY-UCOMM .
  events NODE_DOUBLE_CLICK
    exporting
      value(NODE_KEY) type TM_NODEKEY .
  events NODE_KEYPRESS
    exporting
      value(NODE_KEY) type TM_NODEKEY
      value(KEY) type I .
  events SELECTION_CHANGED
    exporting
      value(NODE_KEY) type TM_NODEKEY .

  methods ADD_KEY_STROKE
    importing
      value(KEY) type I
    exceptions
      ILLEGAL_KEY .
  methods COLLAPSE_ALL_NODES .
  methods COLLAPSE_NODE
    importing
      !NODE_KEY type TM_NODEKEY
      value(COLLAPSE_SUBTREE) type AS4FLAG optional
    exceptions
      NODE_NOT_FOUND .
  methods CONSTRUCTOR
    importing
      value(NODE_SELECTION_MODE) type I
      value(HIDE_SELECTION) type AS4FLAG
    exceptions
      ILLEGAL_NODE_SELECTION_MODE .
  methods CREATE_TREE_CONTROL
    importing
      value(LIFETIME) type I optional
      value(PARENT) type ref to CL_GUI_CONTAINER
      value(SHELLSTYLE) type I optional
    exporting
      value(CONTROL) type ref to CL_GUI_CONTROL
    exceptions
      LIFETIME_ERROR
      CNTL_SYSTEM_ERROR
      CREATE_ERROR
      FAILED
      TREE_CONTROL_ALREADY_CREATED .
  methods DELETE_ALL_NODES .
  methods DELETE_NODE
    importing
      !NODE_KEY type TM_NODEKEY
    exceptions
      NODE_NOT_FOUND .
  methods DELETE_NODES
    importing
      !NODE_KEY_TABLE type TREEMNOTAB
    exceptions
      ERROR_IN_NODE_KEY_TABLE .
  methods DISABLE_FLUSH_NOTIFY .
  methods DUMP_TREE .
  methods DUMP_TREE2 .
  methods ENSURE_VISIBLE
    importing
      !NODE_KEY type TM_NODEKEY
    exceptions
      CONTROL_NOT_EXISTING
      CONTROL_DEAD
      CNTL_SYSTEM_ERROR
      FAILED
      NODE_NOT_FOUND .
  methods EXPAND_NODE
    importing
      !NODE_KEY type TM_NODEKEY
      value(EXPAND_PREDECESSORS) type AS4FLAG optional
      value(EXPAND_SUBTREE) type AS4FLAG optional
      value(LEVEL_COUNT) type I optional
    exceptions
      NODE_NOT_FOUND .
  methods EXPAND_NODES
    importing
      !NODE_KEY_TABLE type TREEMNOTAB
    exceptions
      ERROR_IN_NODE_KEY_TABLE .
  methods EXPAND_NODE_PREDECESSORS
    importing
      !NODE_KEY type TM_NODEKEY
    exceptions
      NODE_NOT_FOUND .
  methods EXPAND_ROOT_NODES
    importing
      value(EXPAND_SUBTREE) type AS4FLAG optional
      value(LEVEL_COUNT) type I optional
    exceptions
      ILLEGAL_LEVEL_COUNT .
  methods GET_ALL_NODE_KEYS
    exporting
      !NODE_KEY_TABLE type TREEMNOTAB .
  methods GET_CTX_MENU_SELECT_EVENT_APPL
    returning
      value(APPL_EVENT) type AS4FLAG .
  methods GET_DEFAULT_DROP
    returning
      value(DRAG_DROP) type ref to CL_DRAGDROP .
  methods GET_EXPANDED_NODES
    importing
      value(NO_HIDDEN_NODES) type AS4FLAG optional
    exporting
      !NODE_KEY_TABLE type TREEMNOTAB
    exceptions
      CONTROL_NOT_EXISTING
      CONTROL_DEAD
      CNTL_SYSTEM_ERROR
      FAILED .
  methods GET_FIRST_ROOT_NODE
    returning
      value(NODE_KEY) type TM_NODEKEY .
  methods GET_FOLDER_SHOW_EXP_IMAGE
    returning
      value(FOLDER_SHOW_EXP_IMAGE) type AS4FLAG .
  methods GET_HIDE_SELECTION
    returning
      value(HIDE_SELECTION) type AS4FLAG .
  methods GET_KEY_STROKES
    exporting
      !KEY_STROKES type TREEMINTEG .
  methods GET_LAST_ROOT_NODE
    returning
      value(NODE_KEY) type TM_NODEKEY .
  methods GET_MAX_NODE_WIDTHS .
  methods GET_NODE_SELECTION_MODE
    returning
      value(NODE_SELECTION_MODE) type I .
  methods GET_NR_OF_NODES
    returning
      value(NR_OF_NODES) type I .
  methods GET_NR_OF_ROOT_NODES
    returning
      value(NR_OF_ROOT_NODES) type I .
  methods GET_ROOT_NODES
    exporting
      !NODE_KEY_TABLE type TREEMNOTAB .
  methods GET_SELECTED_NODE
    exporting
      !NODE_KEY type TM_NODEKEY
    exceptions
      CONTROL_NOT_EXISTING
      CONTROL_DEAD
      CNTL_SYSTEM_ERROR
      FAILED
      SINGLE_NODE_SELECTION_ONLY .
  methods GET_SELECTED_NODES
    exporting
      !NODE_KEY_TABLE type TREEMNOTAB
    exceptions
      CONTROL_NOT_EXISTING
      CONTROL_DEAD
      CNTL_SYSTEM_ERROR
      FAILED
      MULTIPLE_NODE_SELECTION_ONLY .
  methods GET_TOP_NODE
    exporting
      !NODE_KEY type TM_NODEKEY
    exceptions
      CONTROL_NOT_EXISTING
      CONTROL_DEAD
      CNTL_SYSTEM_ERROR
      FAILED .
  methods MOVE_NODE
    importing
      !NODE_KEY type TM_NODEKEY
      !RELATIVE_NODE_KEY type TM_NODEKEY
      value(RELATIONSHIP) type I
    exceptions
      CONTROL_NOT_EXISTING
      CONTROL_DEAD
      FAILED
      CNTL_SYSTEM_ERROR
      NODE_NOT_FOUND
      MOVE_ERROR
      RELATIVE_NODE_NOT_FOUND
      ILLEGAL_RELATIONSHIP .
  methods NODE_GET_CHILDREN
    importing
      !NODE_KEY type TM_NODEKEY
    exporting
      !NODE_KEY_TABLE type TREEMNOTAB
    exceptions
      NODE_NOT_FOUND .
  methods NODE_GET_FIRST_CHILD
    importing
      !NODE_KEY type TM_NODEKEY
    exporting
      !CHILD_NODE_KEY type TM_NODEKEY
    exceptions
      NODE_NOT_FOUND .
  methods NODE_GET_LAST_CHILD
    importing
      !NODE_KEY type TM_NODEKEY
    exporting
      !CHILD_NODE_KEY type TM_NODEKEY
    exceptions
      NODE_NOT_FOUND .
  methods NODE_GET_NEXT_SIBLING
    importing
      !NODE_KEY type TM_NODEKEY
    exporting
      !SIBLING_NODE_KEY type TM_NODEKEY
    exceptions
      NODE_NOT_FOUND .
  methods NODE_GET_NR_OF_CHILDREN
    importing
      !NODE_KEY type TM_NODEKEY
    exporting
      value(NR_OF_CHILDREN) type I
    exceptions
      NODE_NOT_FOUND .
  methods NODE_GET_PARENT
    importing
      !NODE_KEY type TM_NODEKEY
    exporting
      !PARENT_NODE_KEY type TM_NODEKEY
    exceptions
      NODE_NOT_FOUND .
  methods NODE_GET_PREV_SIBLING
    importing
      !NODE_KEY type TM_NODEKEY
    exporting
      !SIBLING_NODE_KEY type TM_NODEKEY
    exceptions
      NODE_NOT_FOUND .
  methods NODE_GET_USER_OBJECT
    importing
      !NODE_KEY type TM_NODEKEY
    exporting
      value(USER_OBJECT) type ref to OBJECT
    exceptions
      NODE_NOT_FOUND .
  methods NODE_KEYS_IN_TREE
    importing
      !NODE_KEY_TABLE type TREEMNOTAB
    exporting
      !NODE_KEYS_IN_TREE type TREEMNOTAB
      !NODE_KEYS_NOT_IN_TREE type TREEMNOTAB .
  methods NODE_KEY_IN_TREE
    importing
      !NODE_KEY type TM_NODEKEY
    returning
      value(KEY_IN_TREE) type AS4FLAG .
  methods NODE_SET_DISABLED
    importing
      !NODE_KEY type TM_NODEKEY
      value(DISABLED) type AS4FLAG
    exceptions
      NODE_NOT_FOUND .
  methods NODE_SET_DRAGDROPID
    importing
      !NODE_KEY type TM_NODEKEY
      value(DRAGDROPID) type INT2
    exceptions
      NODE_NOT_FOUND .
  methods NODE_SET_EXPANDED_IMAGE
    importing
      !NODE_KEY type TM_NODEKEY
      value(EXP_IMAGE) type TV_IMAGE
    exceptions
      NODE_NOT_FOUND .
  methods NODE_SET_EXPANDER
    importing
      !NODE_KEY type TM_NODEKEY
      value(EXPANDER) type AS4FLAG
    exceptions
      NODE_NOT_FOUND .
  methods NODE_SET_HIDDEN
    importing
      !NODE_KEY type TM_NODEKEY
      value(HIDDEN) type AS4FLAG
    exceptions
      NODE_NOT_FOUND .
  methods NODE_SET_IMAGE
    importing
      !NODE_KEY type TM_NODEKEY
      value(IMAGE) type TV_IMAGE
    exceptions
      NODE_NOT_FOUND .
  methods NODE_SET_IS_FOLDER
    importing
      !NODE_KEY type TM_NODEKEY
      value(IS_FOLDER) type AS4FLAG
    exceptions
      NODE_NOT_FOUND
      NODE_HAS_CHILDREN .
  methods NODE_SET_NO_BRANCH
    importing
      !NODE_KEY type TM_NODEKEY
      value(NO_BRANCH) type AS4FLAG
    exceptions
      NODE_NOT_FOUND .
  methods NODE_SET_STYLE
    importing
      !NODE_KEY type TM_NODEKEY
      value(STYLE) type I
    exceptions
      NODE_NOT_FOUND .
  methods NODE_SET_USER_OBJECT
    importing
      !NODE_KEY type TM_NODEKEY
      value(USER_OBJECT) type ref to OBJECT
    exceptions
      NODE_NOT_FOUND .
  methods PRINT_TREE
    importing
      value(ALL_NODES) type AS4FLAG
      !TITLE type STRING optional
      value(PREVIEW) type AS4FLAG
      value(PRINT_CALLBACK) type ref to IF_TREE_MODEL_PRINT_CB optional
    exceptions
      CONTROL_NOT_EXISTING
      CONTROL_DEAD
      CNTL_SYSTEM_ERROR
      FAILED .
  methods PRINT_TREE_EX .
  methods REMOVE_ALL_KEY_STROKES .
  methods SAVE_EXPAND_ALL_NODES
    exporting
      value(ALL_NODES_EXPANDED) type AS4FLAG .
  methods SAVE_EXPAND_SUBTREE
    importing
      !NODE_KEY type TM_NODEKEY
    exporting
      value(ALL_NODES_EXPANDED) type AS4FLAG
    exceptions
      NODE_NOT_FOUND .
  methods SCROLL
    importing
      value(SCROLL_COMMAND) type I
    exceptions
      CONTROL_NOT_EXISTING
      CONTROL_DEAD
      CNTL_SYSTEM_ERROR
      FAILED
      ILLEGAL_SCROLL_COMMAND .
  methods SELECT_NODES
    importing
      !NODE_KEY_TABLE type TREEMNOTAB
    exceptions
      MULTIPLE_NODE_SELECTION_ONLY
      ERROR_IN_NODE_KEY_TABLE .
  methods SET_CTX_MENU_SELECT_EVENT_APPL
    importing
      value(APPL_EVENT) type AS4FLAG .
  methods SET_DEFAULT_DROP
    importing
      value(DRAG_DROP) type ref to CL_DRAGDROP .
  methods SET_FOLDER_SHOW_EXP_IMAGE
    importing
      value(FOLDER_SHOW_EXP_IMAGE) type AS4FLAG .
  methods SET_HAS_3D_FRAME
    importing
      value(HAS_3D_FRAME) type AS4FLAG .
  methods SET_ROOT_NODE
    importing
      !NODE_KEY type TM_NODEKEY
    exceptions
      NODE_NOT_FOUND
      UNSET_NOT_POSSIBLE
      CONTROL_NOT_EXISTING
      CONTROL_DEAD
      FAILED
      CNTL_SYSTEM_ERROR .
  methods SET_SELECTED_NODE
    importing
      !NODE_KEY type TM_NODEKEY
    exceptions
      SINGLE_NODE_SELECTION_ONLY
      NODE_NOT_FOUND .
  methods SET_TOP_NODE
    importing
      !NODE_KEY type TM_NODEKEY
    exceptions
      CONTROL_NOT_EXISTING
      CONTROL_DEAD
      CNTL_SYSTEM_ERROR
      FAILED
      NODE_NOT_FOUND .
  methods UNSELECT_ALL .
  methods UNSELECT_NODES
    importing
      !NODE_KEY_TABLE type TREEMNOTAB
    exceptions
      MULTIPLE_NODE_SELECTION_ONLY
      ERROR_IN_NODE_KEY_TABLE .
  methods UNSET_ROOT_NODE
    exceptions
      UNSET_NOT_POSSIBLE
      CONTROL_NOT_EXISTING
      CONTROL_DEAD
      FAILED
      CNTL_SYSTEM_ERROR .
  methods UPDATE_VIEW
    exceptions
      CONTROL_NOT_EXISTING
      CONTROL_DEAD
      CNTL_SYSTEM_ERROR
      FAILED .
  methods SET_DISABLE_SEL_CHANGE_CTX_MEN
    importing
      value(DISABLE_SEL_CHANGE_CTX_MEN) type AS4FLAG .
  methods ADD_STYLE_INFO
    importing
      value(STYLE) type I
      value(INFO) type C .
  methods CLEAR_STYLE_INFO
    importing
      !STYLE type I .
  methods CLEAR_ALL_STYLE_INFOS .
protected section.
*"* protected components of class ZGIT_CL_TREE_MODEL
*"* do not include other source files here!!!

  types:
    BEGIN OF STYLE_INFO,
      STYLE type i,
      info type string,
    END OF STYLE_INFO .
  types:
    style_info_table type hashed table of style_info
      with unique key style .
  types:
    BEGIN OF base_properties_type,
            keystrokes TYPE treem_integer_set,
            keystrokes_changed TYPE as4flag,
            default_drop TYPE REF TO cl_dragdrop,
            default_drop_changed TYPE as4flag,
            ctx_menu_select_event_appl TYPE as4flag,
            ctx_menu_select_event_appl_cha TYPE as4flag,
            folder_show_exp_image TYPE as4flag,
            folder_show_exp_image_changed TYPE as4flag,
            has_3d_frame TYPE as4flag,
            has_3d_frame_changed TYPE as4flag,
            DISABLE_SEL_CHANGE_CTX_MEN type as4flag,
            DISABLE_SEL_CHANGE_CTX_MEN_chd type as4flag,
          END OF base_properties_type .
  types:
    BEGIN OF delta_selection_type,
            node_to_select TYPE REF TO cl_tree_model_node,
            nodes_to_select TYPE treemnrefs,
            nodes_to_unselect TYPE treemnrefs,
            derived_class_selection TYPE REF TO cl_tree_model_node,
            unselect_all TYPE as4flag,
          END OF delta_selection_type .
  types:
    BEGIN OF add_node_int_params,
      node_key TYPE tm_nodekey,
      relative_node_key TYPE tm_nodekey,
      relative_node TYPE REF TO cl_tree_model_node,
      relationship TYPE i,
      node TYPE REF TO cl_tree_model_node,
    END OF add_node_int_params .
  types:
    ADD_NODE_INT_PARAMS_TABLE
    type standard table of add_node_int_params .

  data BASE_PROPERTIES type BASE_PROPERTIES_TYPE .
  data BASE_TREE_CONTROL type ref to CL_TREE_CONTROL_BASE .
  data CHANGED type AS4FLAG .
  data DELTA_SELECTION type DELTA_SELECTION_TYPE .
  data HIDE_SELECTION type AS4FLAG .
  type-pools TREEM .
  data LONG_KEY_TO_OBJECT_MAP type TREEM_LONG_KEY_TO_OBJECT_TABLE .
  data NODE_SELECTION_MODE type I .
  data UNUSED_VIEW_KEYS type TREEV_NKS .
  data VIEW_KEY_TO_OBJECT_MAP type TREEM_VIEW_KEY_TO_OBJECT_TABLE .
  data FIRST_ROOT_NODE type ref to CL_TREE_MODEL_NODE .
  data LAST_ROOT_NODE type ref to CL_TREE_MODEL_NODE .
  data NR_OF_ROOT_NODES type I .
  data FIND_SEARCH_STRING type STRING .
  data FIND_PATTERN_SEARCH type AS4FLAG .
  data FIND_IGNORE_EXPANDER_NODE_KEY type TM_NODEKEY .
  data FIND_STOP_AT_EXPANDER_NODE type AS4FLAG .
  data FIND_STACK type TREEMNOTAB .
  data FIND_ITEM_NAME_TABLE type TREEMINAMS .
  data WAN_FLAG type AS4FLAG .
  data FLUSH_NOTIFY_DISABLED type AS4FLAG .
  data PRINT_DEFAULT_COLOR type I value 0 .
  data STYLE_INFOS type STYLE_INFO_TABLE .
  data STYLE_INFOS_CHANGED type AS4FLAG .

  class-methods GET_ICON_LENGTH
    importing
      value(ICON_ID) type TV_IMAGE
    returning
      value(LENGTH) type I .
  class-methods INTERNAL_ERROR .
  methods ADD_NODE_EXTENSION_TO_LAYOUT
    importing
      value(POS) type I
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods ADD_NODE_INT
    importing
      !NODE_KEY type TM_NODEKEY optional
      !RELATIVE_NODE_KEY type TM_NODEKEY optional
      value(RELATIVE_NODE) type ref to CL_TREE_MODEL_NODE optional
      !RELATIONSHIP type I optional
      value(NODE) type ref to CL_TREE_MODEL_NODE
      value(NEW_NODE) type AS4FLAG
      value(INSERT_IN_UPDATE_STRUCTU) type AS4FLAG
    exceptions
      ILLEGAL_RELATIONSHIP
      NODE_KEY_EXISTS
      RELATIVE_NODE_NOT_FOUND
      NODE_KEY_EMPTY .
  methods CALC_INITIAL_PRINT_LAYOUT
    importing
      value(ALL_NODES) type AS4FLAG
      value(EXPANDED_NODES) type TREEMHNOTA
    exporting
      value(NR_OF_ROWS) type I
      value(NR_OF_COLUMNS) type I .
  methods CHECK_CONTROL
    exceptions
      CONTROL_DEAD
      CONTROL_NOT_EXISTING .
  methods CHECK_IF_VIEW_IS_UP_TO_DATE .
  methods COLUMN_TREE_ADD_NODES
    importing
      !NODE_TABLE type TREEMCNOTA
      !NODE_KEY_PREFIX type STRING optional
    exceptions
      ERROR_IN_NODE_TABLE .
  methods CONVERT_TO_MODEL_KEYPRESS_KEY
    importing
      value(VIEW_KEY) type I
    changing
      !MODEL_KEY type I .
  methods CREATE_TREE_CONTROL_INT
    importing
      value(LIFETIME) type I optional
      value(PARENT) type ref to CL_GUI_CONTAINER
      value(SHELLSTYLE) type I optional
    exporting
      value(CONTROL) type ref to CL_GUI_CONTROL
    exceptions
      LIFETIME_ERROR
      CNTL_SYSTEM_ERROR
      CREATE_ERROR
      FAILED
      TREE_CONTROL_ALREADY_CREATED .
  methods EXPAND_PREDECESSORS
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods FIND_INIT
    importing
      !SEARCH_STRING type STRING
      value(PATTERN_SEARCH) type AS4FLAG
      value(STOP_AT_EXPANDER_NODE) type AS4FLAG
      !ITEM_NAME_TABLE type TREEMINAMS optional
      !START_NODE type TM_NODEKEY optional
    exceptions
      START_NODE_NOT_FOUND .
  methods GET_CLASS_NAME
    returning
      value(CLASS_NAME) type STRING .
  methods GET_CONTROL_LAYOUT_FOR_PRINT
    exceptions
      CONTROL_NOT_EXISTING
      CONTROL_DEAD
      CNTL_SYSTEM_ERROR
      FAILED .
  methods GET_LONG_KEY_BY_VIEW_KEY
    importing
      !VIEW_KEY type TV_NODEKEY
    changing
      !LONG_KEY type TM_NODEKEY .
  methods GET_LONG_KEY_BY_VIEW_KEY_EX
    importing
      !VIEW_KEY type TV_NODEKEY
    exporting
      value(NODE_NOT_FOUND) type AS4FLAG
    changing
      !LONG_KEY type TM_NODEKEY .
  methods GET_MAX_NODE_COPY_COUNT
    returning
      value(MAX_NODE_COPY_COUNT) type I .
  methods GET_NODE_BY_LONG_KEY
    importing
      !LONG_KEY type TM_NODEKEY
    returning
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods HANDLE_ERROR_IN_TABLE
    importing
      !METHOD type CHAR120
      !TABLE_NAME type RS38L-IMPORTING
      !TEXT_ID type I
      !NODE_KEY type TM_NODEKEY
      !ITEM_NAME type TV_ITMNAME optional .
  methods INSERT_C_NODES
    importing
      !C_NODES type TREEM_C_NODES
    exceptions
      CNTL_SYSTEM_ERROR
      FAILED .
  methods LIST_TREE_ADD_NODES
    importing
      !NODE_TABLE type TREEMLNOTA
      !NODE_KEY_PREFIX type STRING optional
    exceptions
      ERROR_IN_NODE_TABLE .
  methods MAP_NODE_REFS_TO_VIEW_KEYS
    importing
      !NODE_REFS type TREEMNREFS
    changing
      !VIEW_KEYS type TREEV_NKS .
  methods MAP_VIEW_KEYS_TO_LONG_KEYS
    importing
      !VIEW_KEYS type TREEV_NKS
    changing
      !LONG_KEYS type TREEMNOTAB .
  methods MAP_VIEW_KEYS_TO_LONG_KEYS_EX
    importing
      !VIEW_KEYS type TREEV_NKS
    exporting
      value(NODE_NOT_FOUND) type AS4FLAG
    changing
      !LONG_KEYS type TREEMNOTAB .
  methods NODE_UPDATE_REQUEST
    importing
      value(VIEW_KEY) type TV_NODEKEY
      value(UPDATE_NODE) type AS4FLAG optional
      value(UPDATE_DATA) type AS4FLAG optional .
  methods PRINT_TREE_HEADER .
  methods PRINT_TREE_INT
    importing
      value(ALL_NODES) type AS4FLAG
      !EXPANDED_NODES type TREEMHNOTA
      value(NO_OUTPUT) type AS4FLAG optional
    exporting
      value(NR_OF_VISIBLE_NODES) type I .
  methods PRINT_TREE_NODE_EX
    importing
      value(POS) type I
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods PROCESS_FIND_STACK
    importing
      value(FIND_ALL) type AS4FLAG
      value(IGNORE_NOT_EXISTING_NODES) type AS4FLAG
    exporting
      value(RESULT_TYPE) type I
      !RESULT_NODE_KEY type TM_NODEKEY
      !RESULT_NODE_KEY_TABLE type TREEMNOTAB
      !RESULT_ITEM_KEY_TABLE type TREEMIKS .
  methods REMOVE_NODE_FROM_SELECTION
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods REMOVE_VIEW_MARKS
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods REMOVE_VIEW_MARKS_OF_NODE_DATA
    importing
      value(BASE_NODE) type ref to CL_TREE_MODEL_NODE .
  methods SET_CHANGED_FLAG .
  methods SET_EVENT_HANDLERS .
  methods SHOW_ERROR_DROP_COMPMU_NO_NODE .
  methods SHOW_ERROR_DROP_COMP_NO_NODE .
  methods SIMPLE_TREE_ADD_NODES
    importing
      !NODE_TABLE type TREEMSNOTA
    exceptions
      ERROR_IN_NODE_TABLE .
  methods UPDATE_NODE_FORCE_PLUS
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE
      value(FORCE_PLUS) type AS4FLAG .
  methods UPDATE_REGISTERED_EVENTS
    exceptions
      CNTL_SYSTEM_ERROR
      FAILED .
  methods UPDATE_SELECTION_EX
    exceptions
      CNTL_SYSTEM_ERROR
      FAILED .
  methods UPDATE_TREE_STRUCTURE
    exceptions
      CNTL_SYSTEM_ERROR
      FAILED .
  methods UPDATE_U_NODES
    importing
      !U_NODES type TREEM_U_NODES
    exceptions
      CNTL_SYSTEM_ERROR
      FAILED .
private section.
*"* private components of class ZGIT_CL_TREE_MODEL
*"* do not include other source files here!!!

  class-data ICONS type TREEMHICTA .
  data:
    begin of focus,
    node type tm_nodekey,
    parent_node type tm_nodekey,
    prev_sibling_node type tm_nodekey,
  end of focus .
  data COLLAPSE_ALL_VIEW_NODES type AS4FLAG .
  type-pools TREEM .
  data COL_NODES type TREEM_COL_NODES .
  data DELETE_ALL_NODES_IN_CONTROL type AS4FLAG .
  data DEL_NODES type TREEV_NKS .
  data EXP_NODES type TREEM_EXP_NODES .
  data KEYSTROKES type TREEM_INTEGER_SET .
  data KEYSTROKES_CHANGED type AS4FLAG .
  data MEXP_NODES type TREEM_EXP_NODES .
  data MOD_P_NODES type TREEMNREFS .
  data NEW_ROOT_NODES type TREEMNREFS .
  data NEXT_VIEW_KEY type I value 1 .
  data P_NODES type TREEMNREFS .
  data U_NODES type TREEM_U_NODES .
  data:
    begin of PRINT_INFO,
    ALL_NODES type as4flag,
    TITLE type string,
    EXPANDED_NODES type treemhnota,
  end of print_info .
  data PRINT_TITLE_COLOR type I value 1 .

  class-methods ADD_FIRST_CHILD
    importing
      value(PARENT_NODE) type ref to CL_TREE_MODEL_NODE
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  class-methods ADD_LAST_CHILD
    importing
      value(PARENT_NODE) type ref to CL_TREE_MODEL_NODE
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods ADD_FIRST_ROOT_NODE
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods ADD_LAST_ROOT_NODE
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods ADD_NODES_TO_QUEUE
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE
      value(MAX_NEW_NODES) type I
      value(NODE_ONLY) type AS4FLAG
    changing
      !QUEUE type TREEMNRFS2
      !NEW_NODES type I
      !MAX_NEW_NODES_REACHED type AS4FLAG .
  methods CALC_NODES_TO_INSERT_IN_VIEW_2
    changing
      !C_NODES type TREEM_C_NODES .
  methods CHECK_FOR_MOVE_NOP
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE
      value(RELATIVE_NODE) type ref to CL_TREE_MODEL_NODE
      value(RELATIONSHIP) type I .
  methods CLEAR_EXP_COL_INFO .
  methods COLLAPSE_AND_EXPAND
    exceptions
      CNTL_SYSTEM_ERROR
      FAILED .
  methods COLLAPSE_NODE_INT
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods COPY_TREE
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE
    changing
      !C_NODES type TREEM_C_NODES .
  methods COPY_W_BROTHERS
    changing
      !W_NODES type TREEMNREFS
      !C_NODES type TREEM_C_NODES .
  methods DELETE_NODES_IN_CONTROL
    exceptions
      CNTL_SYSTEM_ERROR
      FAILED .
  methods DELETE_NODE_INT
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE
      value(DEL_NODES_ENTRY) type AS4FLAG .
  methods DELETE_NODE_NC
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods DELETE_SUBTREE
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods DUMP_PREORDER
    importing
      value(LEVEL) type I
      !NODE type ref to CL_TREE_MODEL_NODE .
  methods DUMP_PREORDER2
    importing
      value(LEVEL) type I
      !NODE type ref to CL_TREE_MODEL_NODE .
  methods EXPAND_NODE_INT
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods EXPAND_TREE
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods EXPAND_TREE_LEVEL
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE
      value(LEVEL_COUNT) type I .
  class CL_TREE_CONTROL_BASE definition load .
  methods HANDLE_DEFAULT_CONTEXT_MENU_RE
    for event DEFAULT_CONTEXT_MENU_REQUEST of CL_TREE_CONTROL_BASE
    importing
      !MENU .
  methods HANDLE_DEFAULT_CONTEXT_MENU_SE
    for event DEFAULT_CONTEXT_MENU_SELECT of CL_TREE_CONTROL_BASE
    importing
      !FCODE .
  methods HANDLE_DROP
    for event ON_DROP of CL_TREE_CONTROL_BASE
    importing
      !NODE_KEY
      !DRAG_DROP_OBJECT .
  methods HANDLE_DROP_GET_FLAVOR
    for event ON_DROP_GET_FLAVOR of CL_TREE_CONTROL_BASE
    importing
      !NODE_KEY
      !FLAVORS
      !DRAG_DROP_OBJECT .
  methods HANDLE_EXPAND_NO_CHILDREN
    for event EXPAND_NO_CHILDREN of CL_TREE_CONTROL_BASE
    importing
      !NODE_KEY .
  methods HANDLE_NODE_CONTEXT_MENU_REQ
    for event NODE_CONTEXT_MENU_REQUEST of CL_TREE_CONTROL_BASE
    importing
      !NODE_KEY
      !MENU .
  methods HANDLE_NODE_CONTEXT_MENU_SEL
    for event NODE_CONTEXT_MENU_SELECT of CL_TREE_CONTROL_BASE
    importing
      !NODE_KEY
      !FCODE .
  methods HANDLE_NODE_DOUBLE_CLICK
    for event NODE_DOUBLE_CLICK of CL_TREE_CONTROL_BASE
    importing
      !NODE_KEY .
  methods HANDLE_NODE_KEYPRESS
    for event NODE_KEYPRESS of CL_TREE_CONTROL_BASE
    importing
      !NODE_KEY
      !KEY .
  methods HANDLE_SELECTION_CHANGED
    for event SELECTION_CHANGED of CL_TREE_CONTROL_BASE
    importing
      !NODE_KEY .
  methods INSERT_NODE
    importing
      value(PRED_NODE) type ref to CL_TREE_MODEL_NODE
      value(SUCC_NODE) type ref to CL_TREE_MODEL_NODE
      !NODE type ref to CL_TREE_MODEL_NODE .
  methods MOVE_NODE_NODE_IN_DEST_IN
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE
      value(RELATIVE_NODE) type ref to CL_TREE_MODEL_NODE
      value(RELATIONSHIP) type I
      value(DEST_NODE) type ref to CL_TREE_MODEL_NODE
    exceptions
      CNTL_SYSTEM_ERROR
      CONTROL_DEAD
      CONTROL_NOT_EXISTING
      FAILED .
  methods MOVE_NODE_NODE_IN_DEST_OUT
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE
      value(RELATIVE_NODE) type ref to CL_TREE_MODEL_NODE
      value(RELATIONSHIP) type I
    exceptions
      CNTL_SYSTEM_ERROR
      CONTROL_DEAD
      CONTROL_NOT_EXISTING
      FAILED .
  methods MOVE_NODE_NODE_OUT
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE
      value(RELATIVE_NODE) type ref to CL_TREE_MODEL_NODE
      value(RELATIONSHIP) type I .
  methods SAVE_EXPAND_ALL_NODES_INT
    importing
      value(SUBTREE_ROOT) type ref to CL_TREE_MODEL_NODE optional
    exporting
      value(ALL_NODES_EXPANDED) type AS4FLAG .
  methods SHOW_ERROR_DROP_NO_NODE .
  methods UNLINK_NODE_FROM_PARENT
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods UNLINK_NODE_FROM_PARENT2
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE .
  methods UNSELECT_TREE
    importing
      value(NODE) type ref to CL_TREE_MODEL_NODE
      value(COLLAPSE) type AS4FLAG .
  methods UPDATE_BASE_PROPERTIES
    exceptions
      CNTL_SYSTEM_ERROR
      FAILED .
  methods UPDATE_KEY_STROKES
    exceptions
      CNTL_SYSTEM_ERROR
      FAILED .
  methods UPDATE_SELECTION
    exceptions
      CNTL_SYSTEM_ERROR
      FAILED .
  methods UPDATE_STYLE_INFOS
    exceptions
      CNTL_SYSTEM_ERROR
      FAILED .
  type-pools CNDD .
  class CL_GUI_CFW definition load .
ENDCLASS.



CLASS ZGIT_CL_TREE_MODEL IMPLEMENTATION.


METHOD ADD_FIRST_CHILD .

  DATA: FIRST_CHILD TYPE REF TO CL_TREE_MODEL_NODE.

  NODE->PARENT = PARENT_NODE.
  IF PARENT_NODE->NR_OF_CHILDREN = 0.
    PARENT_NODE->FIRST_CHILD = NODE.
    PARENT_NODE->LAST_CHILD = NODE.
  ELSE.
    FIRST_CHILD = PARENT_NODE->FIRST_CHILD.
    FIRST_CHILD->PREV_SIBLING = NODE.
    PARENT_NODE->FIRST_CHILD = NODE.
    NODE->NEXT_SIBLING = FIRST_CHILD.
  ENDIF.
  ADD 1 TO PARENT_NODE->NR_OF_CHILDREN.
ENDMETHOD.

























METHOD ADD_FIRST_ROOT_NODE.

  IF NR_OF_ROOT_NODES = 0. " empty tree
    FIRST_ROOT_NODE = NODE.
    LAST_ROOT_NODE = NODE.
  ELSE.
    FIRST_ROOT_NODE->PREV_SIBLING = NODE.
    NODE->NEXT_SIBLING = FIRST_ROOT_NODE.
    FIRST_ROOT_NODE = NODE.
  ENDIF.
  ADD 1 TO NR_OF_ROOT_NODES.
ENDMETHOD.



















METHOD ADD_KEY_STROKE.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  CASE key.
    WHEN key_f1 OR key_f4 OR key_insert OR key_delete OR key_enter
      OR key_cut OR key_copy OR key_paste.
    WHEN OTHERS. RAISE illegal_key.
  ENDCASE.

  READ TABLE keystrokes FROM key TRANSPORTING NO FIELDS.
  IF sy-subrc <> 0.
    INSERT key INTO TABLE keystrokes.
    keystrokes_changed = 'X'.
  ENDIF.

ENDMETHOD.


METHOD ADD_LAST_CHILD.

  DATA: LAST_CHILD TYPE REF TO CL_TREE_MODEL_NODE.

  NODE->PARENT = PARENT_NODE.
  IF PARENT_NODE->NR_OF_CHILDREN = 0.
    PARENT_NODE->FIRST_CHILD = NODE.
    PARENT_NODE->LAST_CHILD = NODE.
  ELSE.
    LAST_CHILD = PARENT_NODE->LAST_CHILD.
    LAST_CHILD->NEXT_SIBLING = NODE.
    PARENT_NODE->LAST_CHILD = NODE.
    NODE->PREV_SIBLING = LAST_CHILD.
  ENDIF.
  ADD 1 TO PARENT_NODE->NR_OF_CHILDREN.
ENDMETHOD.

























METHOD ADD_LAST_ROOT_NODE .

  IF NR_OF_ROOT_NODES = 0. " empty tree
    FIRST_ROOT_NODE = NODE.
    LAST_ROOT_NODE = NODE.
  ELSE.
    LAST_ROOT_NODE->NEXT_SIBLING = NODE.
    NODE->PREV_SIBLING = LAST_ROOT_NODE.
    LAST_ROOT_NODE = NODE.
  ENDIF.
  ADD 1 TO NR_OF_ROOT_NODES.
ENDMETHOD.



















method ADD_NODES_TO_QUEUE.
  data: sum type i.

  while not node is initial.
    if node->nr_of_children > 0.
*     node is a folder with children
      if node->nr_of_children_in_view = 0.
*       node has no children in view
        sum = new_nodes + node->nr_of_children.
        if sum > max_new_nodes.
          max_new_nodes_reached = 'X'.
          exit.
        endif.
        add node->nr_of_children to new_nodes.
      endif.
      append node to queue.
    endif.
    if node_only is initial.
      node = node->next_sibling.
    else.
      exit.
    endif.
  endwhile.

endmethod.


method ADD_NODE_EXTENSION_TO_LAYOUT .

endmethod.


METHOD ADD_NODE_INT .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        view_key_to_object_map_entry TYPE treem_view_key_to_object,
        view_key TYPE treev_nkey,
        parent_node TYPE REF TO cl_tree_model_node,
        update_parent TYPE as4flag.

  IF NOT new_node IS INITIAL.
*   check if node_key is initial or a string of blanks
    if node_key is initial or node_key co ' '.
      raise node_key_empty.
    endif.
*   get node object if relative_node is provided by key
    IF NOT relative_node_key IS INITIAL.
      READ TABLE long_key_to_object_map
        WITH table KEY node_key = relative_node_key
        INTO long_key_to_object_map_entry.
      IF sy-subrc <> 0.
        RAISE relative_node_not_found.
      ENDIF.
      relative_node = long_key_to_object_map_entry-node.
    ENDIF.

*   add the node to the long keys
    long_key_to_object_map_entry-node_key = node_key.
    long_key_to_object_map_entry-node = node.
    INSERT long_key_to_object_map_entry
      INTO TABLE long_key_to_object_map.
    IF sy-subrc <> 0.
      RAISE node_key_exists.
    ENDIF.

*   add the node to the view keys
    IF NOT unused_view_keys IS INITIAL.
      READ TABLE unused_view_keys INTO view_key INDEX 1.
      DELETE unused_view_keys INDEX 1.
    ELSE.
      view_key-node_key = next_view_key.
      ADD 1 TO next_view_key.
    ENDIF.
    view_key_to_object_map_entry-node_key = view_key-node_key.
    view_key_to_object_map_entry-node = node.
    INSERT view_key_to_object_map_entry
      INTO TABLE view_key_to_object_map.
    IF sy-subrc <> 0.
      CALL METHOD internal_error.
    ENDIF.

*   setup node
    node->long_key = node_key.
    node->view_key = view_key-node_key.

    node->tree = me.
  ENDIF.


* insert node in the tree
  IF relative_node IS INITIAL.         " add a root node?
    CASE relationship.
      WHEN relat_first_child OR relat_prev_sibling
           OR relat_first_sibling.
*       insert as first root node
        CALL METHOD add_first_root_node EXPORTING node = node.
      WHEN relat_last_child OR relat_next_sibling
           OR relat_last_sibling.
*       insert as last root node
        CALL METHOD add_last_root_node EXPORTING node = node.
      WHEN OTHERS.
        RAISE illegal_relationship.
    ENDCASE.
  ELSE.
*   add a non-root node
    CASE relationship.
      WHEN relat_first_child.
        CALL METHOD add_first_child
          EXPORTING parent_node = relative_node node = node.
      WHEN relat_last_child.
        CALL METHOD add_last_child
          EXPORTING parent_node = relative_node node = node.
      WHEN relat_first_sibling.
        IF relative_node->parent IS INITIAL.
*       relative is a root node => add node as first root node
          CALL METHOD add_first_root_node EXPORTING node = node.
        ELSE.
*         add node as first child of relative_node->parent
          CALL METHOD add_first_child
            EXPORTING parent_node = relative_node->parent node = node.
        ENDIF.
      WHEN relat_last_sibling.
        IF relative_node->parent IS INITIAL.
*         relative is a root node => add node as last root node
          CALL METHOD add_last_root_node EXPORTING node = node.
        ELSE.
*         add node as last child of relative_node->parent
          CALL METHOD add_last_child
            EXPORTING parent_node = relative_node->parent node = node.
        ENDIF.
      WHEN relat_prev_sibling.
        IF relative_node->prev_sibling IS INITIAL.
          IF relative_node->parent IS INITIAL.
*           add node as first root node
            CALL METHOD add_first_root_node EXPORTING node = node.
          ELSE.
*           add node as first child of relative_node->parent
            CALL METHOD add_first_child
              EXPORTING parent_node = relative_node->parent node = node.
          ENDIF.
        ELSE.
*         relative_node has a predecessor
          CALL METHOD insert_node
            EXPORTING
              pred_node = relative_node->prev_sibling
              succ_node = relative_node
              node = node.
        ENDIF.
      WHEN relat_next_sibling.
        IF relative_node->next_sibling IS INITIAL.
          IF relative_node->parent IS INITIAL.
*           add node as last root node
            CALL METHOD add_last_root_node EXPORTING node = node.
          ELSE.
*           add node as last child of relative_node->parent
            CALL METHOD add_last_child
              EXPORTING parent_node = relative_node->parent node = node.
          ENDIF.
        ELSE.
*         relative_node has a successor
          CALL METHOD insert_node
            EXPORTING
              pred_node = relative_node
              succ_node = relative_node->next_sibling
              node = node.
        ENDIF.
      WHEN OTHERS.
        RAISE illegal_relationship.
    ENDCASE.
  ENDIF.


  IF NOT insert_in_update_structu IS INITIAL.
*   insert the node in the update_structure w_nodes if necessary
    parent_node = node->parent.

    IF parent_node IS INITIAL.
*     a root node is added to new_root_nodes
      INSERT node INTO TABLE new_root_nodes.
    ELSE.
*     parent has a child now => remove force_plus flag
      CLEAR parent_node->force_plus.
      IF parent_node->in_view IS INITIAL.
*       parent is not in the view
*       ensure that parent node is a folder
        IF parent_node->isfolder IS INITIAL.
          parent_node->isfolder = 'X'.
        ENDIF.
      ELSE.
*       parent is in the view
*       the new node must be added to w_nodes
        INSERT node INTO TABLE parent_node->w_nodes.
*       insert parent node in p_nodes if parent_node is not in p_nodes
        READ TABLE p_nodes FROM parent_node
          TRANSPORTING NO FIELDS.
        IF sy-subrc <> 0.
          INSERT parent_node INTO TABLE p_nodes.
        ENDIF.
*       insert parent node in mod_p_nodes if
*       parent_node is not in p_nodes
        READ TABLE mod_p_nodes FROM parent_node
          TRANSPORTING NO FIELDS.
        IF sy-subrc <> 0.
          INSERT parent_node INTO TABLE mod_p_nodes.
        ENDIF.

        IF parent_node->nr_of_children_in_view = 0.
*         parent has no children in the view
          IF parent_node->expander IS INITIAL.
*           the expander property of the parent node must be set in view
            parent_node->expander = 'X'.
            update_parent = 'X'.
          ENDIF.
        ELSE.
*         parent has children in the view
        ENDIF.
        IF parent_node->isfolder IS INITIAL.
          parent_node->isfolder = 'X'.
          update_parent = 'X'.
        ENDIF.
        IF NOT update_parent IS INITIAL.
*         insert parent node in u_nodes
          CALL METHOD node_update_request
            EXPORTING
              view_key = parent_node->view_key
              update_node = 'X'.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDIF.

ENDMETHOD.




















method ADD_STYLE_INFO.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  READ TABLE style_infos
    with key style = style transporting no fields.
  IF sy-subrc <> 0.
    data: l_style_info type style_info.
    l_style_info-style = style.
    l_style_info-info = info.
    INSERT l_style_info INTO TABLE style_infos.
    style_infos_changed = 'X'.
  ENDIF.


endmethod.


method CALC_INITIAL_PRINT_LAYOUT.
* ...
endmethod.


METHOD CALC_NODES_TO_INSERT_IN_VIEW_2 .

  DATA: p_node TYPE REF TO cl_tree_model_node,
        copy_w_children TYPE as4flag.

* copy new root nodes to view
  CALL METHOD copy_w_brothers
    CHANGING
      w_nodes = new_root_nodes
      c_nodes = c_nodes.

* inspect all parents of W_NODES which have been touched
* since the last view update
  LOOP AT mod_p_nodes INTO p_node.
    DELETE TABLE mod_p_nodes FROM p_node.
    IF p_node->in_view IS INITIAL. CALL METHOD internal_error. ENDIF.
    IF p_node->nr_of_children_in_view > 0.
      copy_w_children = 'X'.
    ELSE.
      IF NOT p_node->expand IS INITIAL.
        copy_w_children = 'X'.
        if p_node->nr_of_children = 0.
          call method internal_error.
        endif.
        IF NOT p_node->expander IS INITIAL.
          CLEAR p_node->expander.
          CALL METHOD node_update_request
            EXPORTING
              view_key = p_node->view_key
              update_node = 'X'.
        ENDIF.
      ENDIF.
    ENDIF.
    IF NOT copy_w_children IS INITIAL.
      DELETE TABLE p_nodes FROM p_node.
      CALL METHOD copy_w_brothers
        CHANGING
          w_nodes = p_node->w_nodes
          c_nodes = c_nodes.
    ENDIF.
  ENDLOOP.

ENDMETHOD.


METHOD CHECK_CONTROL.

  IF base_tree_control IS INITIAL.
    RAISE control_not_existing.
  ELSEIF base_tree_control->is_alive( ) = cl_gui_control=>state_dead.
    RAISE control_dead.
  ENDIF.

ENDMETHOD.


method CHECK_FOR_MOVE_NOP .

*  data: new_parent type ref to cl_tree_model_node,
*        new_predecessor type ref to cl_tree_model_node.
*
*  if relative_node is initial.
** node is a root node
*  CASE relationship.
*    WHEN relat_first_child
*    OR relat_first_sibling
*    OR relat_prev_sibling.
*      clear new_parent.
*      clear new_predecessor.
*    when relat_last_child
*    OR relat_last_sibling
*    OR relat_next_sibling.
*      clear new_parent.
*      new_predecessor = last_root_node->prev_sibling.
*  ENDCASE.
*  else.
*  CASE relationship.
*    WHEN relat_first_child.
*      new_parent = relative_node.
*      clear new_predecessor.
*    WHEN relat_last_child.
*      new_parent = relative_node.
*      new_predecessor = relative_node->last_child->prev_sibling.
*    when relat_first_sibling.
*      new_parent = relative_node->parent.
*      clear new_prev_sibling.
*    when relat_last_sibling.
*      new_parent = relative_node->parent.
*      new_prev_sibling = new_parent->last_child->prev
*
*    OR relat_prev_sibling.
*      clear new_parent.
*      clear new_predecessor.
*    OR relat_last_sibling
*    OR relat_next_sibling.
*      clear new_parent.
*      new_predecessor = last_root_node->prev_sibling.


ENDMETHOD.


method CHECK_IF_VIEW_IS_UP_TO_DATE.
  if not changed is initial.
    message X000(TREE_MODEL_MSG).
  endif.
endmethod.


method CLEAR_ALL_STYLE_INFOS.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  clear style_infos.
  style_infos_changed = 'X'.

endmethod.


METHOD CLEAR_EXP_COL_INFO.

  DATA: VIEW_KEY TYPE TV_NODEKEY,
        VIEW_KEY_TO_OBJECT_ENTRY TYPE TREEM_VIEW_KEY_TO_OBJECT.

  LOOP AT MEXP_NODES INTO VIEW_KEY.
    " get the node object
    READ TABLE VIEW_KEY_TO_OBJECT_MAP
      WITH table KEY NODE_KEY = VIEW_KEY
      INTO VIEW_KEY_TO_OBJECT_ENTRY.
    IF SY-SUBRC <> 0.
      CALL METHOD INTERNAL_ERROR.
    ENDIF.
    CLEAR VIEW_KEY_TO_OBJECT_ENTRY-NODE->EXPAND.
  ENDLOOP.

  LOOP AT EXP_NODES INTO VIEW_KEY.
    " get the node object
    READ TABLE VIEW_KEY_TO_OBJECT_MAP
      WITH table KEY NODE_KEY = VIEW_KEY
      INTO VIEW_KEY_TO_OBJECT_ENTRY.
    IF SY-SUBRC <> 0.
      CALL METHOD INTERNAL_ERROR.
    ENDIF.
    CLEAR VIEW_KEY_TO_OBJECT_ENTRY-NODE->EXPAND.
  ENDLOOP.


  CLEAR: MEXP_NODES, EXP_NODES, COL_NODES.

ENDMETHOD.

























method CLEAR_STYLE_INFO.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  READ TABLE style_infos
    with key style = style transporting no fields.
  IF sy-subrc = 0.
    delete table style_infos
      with table key style = style.
    style_infos_changed = 'X'.
  ENDIF.


endmethod.


METHOD COLLAPSE_ALL_NODES.


* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  CALL METHOD clear_exp_col_info.
  collapse_all_view_nodes = 'X'.

* remove all selection requests for non-root nodes

* node_to_select
  IF NOT delta_selection-node_to_select IS INITIAL.
    IF NOT delta_selection-node_to_select->parent IS INITIAL.
      CLEAR delta_selection-node_to_select.
    ENDIF.
  ENDIF.

* nodes_to_select
  DELETE delta_selection-nodes_to_select
    WHERE NOT table_line->parent IS initial.

* derived_class_selection
  IF NOT delta_selection-derived_class_selection IS INITIAL.
    IF NOT delta_selection-derived_class_selection->parent IS INITIAL.
      CLEAR delta_selection-derived_class_selection.
    ENDIF.
  ENDIF.

ENDMETHOD.


METHOD COLLAPSE_AND_EXPAND.
  DATA: view_keys TYPE treev_nks.

* check if there was a collapse_all_nodes call
  IF NOT COLLAPSE_ALL_VIEW_NODES IS INITIAL.
    CALL METHOD BASE_TREE_CONTROL->COLLAPSE_ALL_NODES
      EXCEPTIONS
        FAILED                  = 1
        CNTL_SYSTEM_ERROR       = 2.
    CASE SY-SUBRC.
      WHEN 1. RAISE FAILED.
      WHEN 2. RAISE CNTL_SYSTEM_ERROR.
    ENDCASE.
    CLEAR COLLAPSE_ALL_VIEW_NODES.
  ENDIF.

* collapse the nodes in col_nodes
  view_keys = col_nodes.

  CALL METHOD base_tree_control->collapse_nodes
    EXPORTING
      node_key_table = view_keys
    EXCEPTIONS
      failed                  = 1
      cntl_system_error       = 2
      error_in_node_key_table = 3
      dp_error                = 4.
  CASE sy-subrc.
    WHEN 1. RAISE failed.
    WHEN 2. RAISE cntl_system_error.
    WHEN 3. CALL METHOD internal_error. EXIT.
    WHEN 4. RAISE failed.
  ENDCASE.

* expand the nodes in exp_nodes
  view_keys = exp_nodes.

  CALL METHOD base_tree_control->expand_nodes
    EXPORTING
      node_key_table = view_keys
    EXCEPTIONS
      failed                  = 1
      cntl_system_error       = 2
      error_in_node_key_table = 3
      dp_error                = 4.
  CASE sy-subrc.
    WHEN 1. RAISE failed.
    WHEN 2. RAISE cntl_system_error.
    WHEN 3. CALL METHOD internal_error. EXIT.
    WHEN 4. RAISE failed.
  ENDCASE.

* clear expand / collapse info
  CALL METHOD clear_exp_col_info.

ENDMETHOD.


method COLLAPSE_NODE.
   DATA: LONG_KEY_TO_OBJECT_MAP_ENTRY TYPE TREEM_LONG_KEY_TO_OBJECT,
         NODE TYPE REF TO CL_TREE_MODEL_NODE,
         child_node type ref to cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  READ TABLE LONG_KEY_TO_OBJECT_MAP
    WITH table KEY NODE_KEY = NODE_KEY
      INTO LONG_KEY_TO_OBJECT_MAP_ENTRY.
    IF SY-SUBRC <> 0.
      RAISE NODE_NOT_FOUND.
    ENDIF.

  NODE = LONG_KEY_TO_OBJECT_MAP_ENTRY-NODE.

  IF NODE->NR_OF_CHILDREN = 0.
    EXIT.
  ENDIF.

* collapse the node
  CALL METHOD collapse_NODE_INT EXPORTING NODE = NODE.

* remove selections in subtrees
  child_node = node->first_child.
  while not child_node is initial.
    call method unselect_tree
      exporting
        node = child_node
        collapse = collapse_subtree.
    child_node = child_node->next_sibling.
  endwhile.

endmethod.


METHOD COLLAPSE_NODE_INT.

  DATA: view_key TYPE tv_nodekey.

* node has no children
  IF ( node->nr_of_children = 0 ).
    EXIT.
  ENDIF.

  view_key = node->view_key.

  IF node->in_view IS INITIAL.
    IF NOT node->expand IS INITIAL.
      CLEAR node->expand.
      DELETE TABLE mexp_nodes FROM view_key.
      IF sy-subrc <> 0.
        CALL METHOD internal_error.
      ENDIF.
    ENDIF.
  ELSE.
    IF NOT node->expand IS INITIAL.
      CLEAR node->expand.
      DELETE TABLE exp_nodes FROM view_key.
    ENDIF.
    READ TABLE col_nodes FROM view_key TRANSPORTING NO FIELDS.
    IF sy-subrc <> 0.
     " insert node into col_nodes
      INSERT view_key INTO TABLE col_nodes.
    ENDIF.
  ENDIF.

ENDMETHOD.



















method COLUMN_TREE_ADD_NODES .
* Note: nearly the same code as LIST_TREE_ADD_NODES
* Differences: Type of node_table / node, no last_hitem property
*

  FIELD-SYMBOLS: <node> TYPE TREEMCNODt.

  DATA: node_object TYPE REF TO cl_item_tree_model_node,
        node_key TYPE tm_nodekey,
        relative_node_key TYPE tm_nodekey.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  LOOP AT node_table assigning <node>.
    CREATE OBJECT node_object.

    node_object->hidden          = <node>-hidden.
    node_object->disabled        = <node>-disabled.
    node_object->isfolder        = <node>-isfolder.
    node_object->style           = <node>-style.
    node_object->force_plus      = <node>-expander.
    node_object->no_branch       = <node>-no_branch.
    node_object->image           = <node>-n_image.
    node_object->expanded_image  = <node>-exp_image.
    node_object->drag_drop_id    = <node>-dragdropid.
    node_object->user_object     = <node>-userobject.
    node_object->items_incomplete = <node>-itemsincom.

    IF ( node_key_prefix IS INITIAL ) OR ( <node>-node_key IS INITIAL ).
      node_key = <node>-node_key.
    ELSE.
      CONCATENATE node_key_prefix <node>-node_key INTO node_key.
    ENDIF.

    IF ( node_key_prefix IS INITIAL ) OR ( <node>-relatkey IS INITIAL ).
      relative_node_key = <node>-relatkey.
    ELSE.
      CONCATENATE node_key_prefix <node>-relatkey
        INTO relative_node_key.
    ENDIF.

* insert the node to the tree
    CALL METHOD add_node_int
      EXPORTING
        node_key          = node_key
        relative_node_key = relative_node_key
        relationship      = <node>-relatship
        node              = node_object
        new_node          = 'X'
        insert_in_update_structu = 'X'
      EXCEPTIONS
        node_key_exists         = 1
        illegal_relationship    = 2
        relative_node_not_found = 3
        node_key_empty          = 4.
    CASE sy-subrc.
      WHEN 1.
        CALL METHOD handle_error_in_table
          EXPORTING
            method     = 'ADD_NODES'
            table_name = 'NODE_KEY_TABLE'
            text_id    = 2              " Schluessel des Knotens
            node_key   = node_key.      " ist bereits vorhanden
        RAISE error_in_node_table.
      WHEN 2.
        CALL METHOD handle_error_in_table
          EXPORTING
            method     = 'ADD_NODES'
            table_name = 'NODE_KEY_TABLE'
            text_id    = 3 " Unzulaessiger Wert im Feld RELATSHIP
            node_key   = node_key.
        RAISE error_in_node_table.
      WHEN 3.
        CALL METHOD handle_error_in_table
          EXPORTING
            method     = 'ADD_NODES'
            table_name = 'NODE_KEY_TABLE'
            text_id    = 4              " Knoten mit Schluessel
            node_key   = node_key.      " RELATKEY existiert nicht
        RAISE error_in_node_table.
      WHEN 4.
        CALL METHOD handle_error_in_table
          EXPORTING
            method     = 'ADD_NODES'
            table_name = 'NODE_KEY_TABLE'
            text_id    = 15             " node_key initial
            node_key   = node_key.      " or consists of blanks
        RAISE error_in_node_table.
    ENDCASE.
  ENDLOOP.

ENDMETHOD.


method CONSTRUCTOR.

* store NODE_SELECTION_MODE and HIDE_SELECTION
  CASE node_selection_mode.
    WHEN node_sel_mode_single.
    WHEN node_sel_mode_multiple.
    WHEN OTHERS.
      RAISE illegal_node_selection_mode.
  ENDCASE.

  me->hide_selection = hide_selection.
  me->node_selection_mode = node_selection_mode.

* get WAN-Flag
  CALL FUNCTION 'SAPGUI_GET_WAN_FLAG'
       IMPORTING
            WAN_FLAG = wan_flag.

endmethod.


METHOD CONVERT_TO_MODEL_KEYPRESS_KEY.

  CASE view_key.
    WHEN cl_tree_control_base=>key_f1. model_key = key_f1.
    WHEN cl_tree_control_base=>key_f4. model_key = key_f4.
    WHEN cl_tree_control_base=>key_insert. model_key = key_insert.
    WHEN cl_tree_control_base=>key_delete. model_key = key_delete.
    WHEN cl_tree_control_base=>key_enter. model_key = key_enter.
    WHEN cl_tree_control_base=>key_cut. model_key = key_cut.
    WHEN cl_tree_control_base=>key_copy. model_key = key_copy.
    WHEN cl_tree_control_base=>key_paste. model_key = key_paste.
    WHEN OTHERS. CALL METHOD internal_error.
  ENDCASE.

ENDMETHOD.


METHOD COPY_TREE.

  DATA: CHILD_NODE TYPE REF TO CL_TREE_MODEL_NODE,
        W_NODE TYPE TREEM_W_NODE.

  APPEND NODE TO C_NODES.
  NODE->IN_VIEW = 'X'.
  if not node->parent is initial.
    add 1 to node->parent->nr_of_children_in_view.
  endif.
  IF NODE->ISFOLDER IS INITIAL.
    EXIT.
  ENDIF.
* node is a folder
  IF NODE->NR_OF_CHILDREN = 0.
    if not node->expand is initial.
      call method internal_error.
    endif.
    IF NOT NODE->FORCE_PLUS IS INITIAL.
      NODE->EXPANDER = 'X'.
    ENDIF.
    EXIT.
  ENDIF.
* node is a folder and has children
  IF NODE->EXPAND IS INITIAL.
    " node is a parent of w_nodes
    insert node into table p_nodes.
    NODE->EXPANDER = 'X'.
    " append children of node to w_nodes
    CHILD_NODE = NODE->FIRST_CHILD.
    " insert children in w_nodes of node
    WHILE NOT CHILD_NODE IS INITIAL.
      insert child_node into table node->w_nodes.
      CHILD_NODE = CHILD_NODE->NEXT_SIBLING.
    ENDWHILE.
    EXIT.
  ENDIF.

* node is a folder, has children and is expanded
* => children of the node must be copied to view, too

* move the entry of the node in mexp_nodes to exp_nodes

  DELETE TABLE MEXP_NODES FROM NODE->VIEW_KEY.
  IF SY-SUBRC <> 0.
    CALL METHOD INTERNAL_ERROR.
  ENDIF.
  INSERT NODE->VIEW_KEY INTO TABLE EXP_NODES.

  CHILD_NODE = NODE->FIRST_CHILD.

  WHILE NOT CHILD_NODE IS INITIAL.
    CALL METHOD COPY_TREE
      EXPORTING NODE = CHILD_NODE
      CHANGING C_NODES = C_NODES.
    CHILD_NODE = CHILD_NODE->NEXT_SIBLING.
  ENDWHILE.

  CLEAR NODE->EXPAND.
ENDMETHOD.























method COPY_W_BROTHERS.
  data: w_node type ref to cl_tree_model_node,
        node type ref to cl_tree_model_node.

  while not w_nodes is initial.
    " read an element of w_nodes
    loop at w_nodes into w_node.
      exit.
    endloop.

    " find the first predecessor of w_node that is in
    " view or find the first sibling of w_node
    node = w_node.
    while ( not node->prev_sibling is initial )
      and ( node->prev_sibling->in_view is initial ).
      node = node->prev_sibling.
    endwhile.

    " copy the subtrees with roots [node..w_node] to view
    do.
      " delete the node from w_nodes
      delete table w_nodes from node.
      call method copy_tree
        exporting node = node
        changing c_nodes = c_nodes.
      if node = w_node.
        exit.
      endif.
      node = node->next_sibling.
    enddo.

  endwhile.

endmethod.


METHOD CREATE_TREE_CONTROL.


  CALL METHOD create_tree_control_int
    EXPORTING
      LIFETIME                     = lifetime
      parent                       = parent
      SHELLSTYLE                   = shellstyle
    IMPORTING
      CONTROL                      = control
    EXCEPTIONS
      LIFETIME_ERROR               = 1
      CNTL_SYSTEM_ERROR            = 2
      CREATE_ERROR                 = 3
      FAILED                       = 4
      TREE_CONTROL_ALREADY_CREATED = 5
      others                       = 6.
  case sy-subrc.
    when 1. raise LIFETIME_ERROR.
    when 2. raise CNTL_SYSTEM_ERROR.
    when 3. raise CREATE_ERROR.
    when 4. raise FAILED.
    when 5. raise TREE_CONTROL_ALREADY_CREATED.
  endcase.

  if ( flush_notify_disabled is initial )
    and ( not changed is initial ).
    CALL METHOD cl_gui_cfw=>register_flush_notify
      EXPORTING
        ref                = me
      EXCEPTIONS
        wrong_system_state = 1
        already_registered = 2
        OTHERS             = 3.
    IF sy-subrc <> 0.
      CALL METHOD internal_error.
    ENDIF.
  endif.

ENDMETHOD.


method CREATE_TREE_CONTROL_INT .

* ...
ENDMETHOD.


method DELETE_ALL_NODES .

  DATA: node TYPE REF TO cl_tree_model_node,
        next_node type ref to cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  node = first_root_node.

  WHILE NOT node IS INITIAL.
    next_node = node->next_sibling.
    call method delete_node_int
      exporting
        node = node
        del_nodes_entry = ' '.
    node = next_node.
  ENDWHILE.

  clear del_nodes.
  delete_all_nodes_in_control = 'X'.
* JB 10/07/2004: reset View keys
  next_view_key = '1'.
  clear unused_view_keys.

ENDMETHOD.


METHOD DELETE_NODE .
  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  READ TABLE long_key_to_object_map
    WITH TABLE KEY node_key = node_key
      INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.

  node = long_key_to_object_map_entry-node.

  CALL METHOD delete_node_int
    EXPORTING node = node del_nodes_entry = 'X'.


ENDMETHOD.


METHOD DELETE_NODES .

  DATA: node_key TYPE tm_nodekey,
        long_key_to_object_map_entry TYPE treem_long_key_to_object.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* check if all nodes in the table exist
  LOOP AT node_key_table INTO node_key.
    " get the node object
    READ TABLE long_key_to_object_map
      WITH table KEY node_key = node_key
      INTO long_key_to_object_map_entry.
    IF sy-subrc <> 0.
      CALL METHOD handle_error_in_table
        EXPORTING
          method     = 'DELETE_NODES'
          table_name = 'NODE_KEY_TABLE'
          text_id    = 1
          node_key   = node_key.
      RAISE error_in_node_key_table.
    ENDIF.
  ENDLOOP.

* delete the nodes
  LOOP AT node_key_table INTO node_key.
    " get the node object
    READ TABLE long_key_to_object_map
      WITH table KEY node_key = node_key
      INTO long_key_to_object_map_entry.
    IF sy-subrc = 0. " sy-subrc <>0: node is already deleted
      " delete the node
      CALL METHOD delete_node_int
        EXPORTING
          node = long_key_to_object_map_entry-node
          del_nodes_entry = 'X'.
    ENDIF.
  ENDLOOP.

ENDMETHOD.


METHOD DELETE_NODES_IN_CONTROL.

  IF NOT delete_all_nodes_in_control IS INITIAL.
    CALL METHOD base_tree_control->delete_all_nodes
      EXCEPTIONS
        failed = 1
        cntl_system_error = 2.
    CASE sy-subrc.
      WHEN 1. RAISE failed.
      WHEN 2. RAISE cntl_system_error.
    ENDCASE.
  ENDIF.

  CALL METHOD base_tree_control->delete_nodes
    EXPORTING
      node_key_table = del_nodes
    EXCEPTIONS
      failed = 1
      cntl_system_error = 2
      error_in_node_key_table = 3
      dp_error = 4.
  CASE sy-subrc.
    WHEN 1. RAISE failed.
    WHEN 2. RAISE cntl_system_error.
    WHEN 3. CALL METHOD internal_error.
    WHEN 4. RAISE failed.
  ENDCASE.

  CLEAR del_nodes.
  CLEAR delete_all_nodes_in_control.
ENDMETHOD.


method DELETE_NODE_INT.


  call method UNLINK_NODE_FROM_PARENT
    exporting node = node.

  call method delete_subtree
    exporting node = node.

  if ( not del_nodes_entry is initial )
    and ( not node->in_view is initial ).
    append node->view_key to del_nodes.
  endif.

endmethod.


method DELETE_NODE_NC.

* check if node has no children
  if node->nr_of_children > 0.
    call method internal_error.
  endif.

* remove node from some tables...

* long_key_to_object_map
  delete TABLE long_key_to_object_map
    WITH table KEY node_key = node->long_key.
  if sy-subrc <> 0.
    call method internal_error.
  endif.

* unused_view_keys
  append node->view_key to unused_view_keys.

* view_key_to_object_map
  delete TABLE view_key_to_object_map
    WITH table KEY node_key = node->view_key.
  if sy-subrc <> 0.
    call method internal_error.
  endif.

* remove node from selection requests
  CALL METHOD remove_node_from_selection
    EXPORTING node = node.

* COL_NODES
  delete table col_nodes from node->view_key.

* EXP_NODES
  delete table exp_nodes from node->view_key.

* MEXP_NODES
  delete table mexp_nodes from node->view_key.

* P_NODES
  delete table p_nodes from node.

* mod_p_nodes
  delete table mod_p_nodes from node.

* U_NODES
  delete TABLE u_nodes
    WITH table KEY node_key = node->view_key.

* unlink node
  call method unlink_node_from_parent2
    exporting node = node.

* clear the node
  clear node->tree.
  clear node->w_nodes.
  clear node->user_object.
endmethod.


METHOD DELETE_SUBTREE.
  DATA: child_node TYPE REF TO cl_tree_model_node,
        next_node TYPE REF TO cl_tree_model_node.


* delete the children of the node
  child_node = node->first_child.

  WHILE NOT child_node IS INITIAL.
    next_node = child_node->next_sibling.
    CALL METHOD delete_subtree
      EXPORTING node = child_node.

    child_node = next_node.
  ENDWHILE.

* delete the node
  CALL METHOD delete_node_nc
    EXPORTING node = node.
ENDMETHOD.


METHOD DISABLE_FLUSH_NOTIFY.

  flush_notify_disabled = 'X'.

ENDMETHOD.


METHOD DUMP_PREORDER.

  DATA: CHILD TYPE REF TO CL_TREE_MODEL_NODE,
        NEW_LEVEL TYPE I,
        TEXT TYPE CHAR80,
        SNODE TYPE REF TO CL_SIMPLE_TREE_MODEL_NODE,
        LENGTH TYPE I.

DEFINE SHOW_TEXT.
  SNODE ?= &1.
  TEXT = SNODE->TEXT.
  CONDENSE TEXT NO-GAPS.
  LENGTH = STRLEN( TEXT ).
  WRITE AT (LENGTH) TEXT.
END-OF-DEFINITION.
DEFINE SHOW_TEXT_2.
  TEXT = &1.
  CONDENSE TEXT NO-GAPS.
  LENGTH = STRLEN( TEXT ).
  WRITE AT (LENGTH) TEXT.
END-OF-DEFINITION.

  WRITE: AT /LEVEL ' ' NO-GAP.
  SHOW_TEXT NODE.
  WRITE 'P:'.
  IF NOT NODE->PARENT IS INITIAL.
    SHOW_TEXT NODE->PARENT.
  ENDIF.
  WRITE '#Ch:'.
  SHOW_TEXT_2 NODE->NR_OF_CHILDREN.
  WRITE 'FC:'.
  IF NOT NODE->FIRST_CHILD IS INITIAL.
    SHOW_TEXT NODE->FIRST_CHILD.
  ENDIF.
  WRITE 'LC:'.
  IF NOT NODE->LAST_CHILD IS INITIAL.
    SHOW_TEXT NODE->LAST_CHILD.
  ENDIF.
  WRITE 'PS:'.
  IF NOT NODE->PREV_SIBLING IS INITIAL.
    SHOW_TEXT NODE->PREV_SIBLING.
  ENDIF.
  WRITE 'NS:'.
  IF NOT NODE->NEXT_SIBLING IS INITIAL.
    SHOW_TEXT NODE->NEXT_SIBLING.
  ENDIF.



  CHILD = NODE->FIRST_CHILD.
  NEW_LEVEL = LEVEL + 1.
  WHILE NOT CHILD IS INITIAL.
    CALL METHOD DUMP_PREORDER EXPORTING LEVEL = NEW_LEVEL NODE = CHILD.
    CHILD = CHILD->NEXT_SIBLING.
  ENDWHILE.
ENDMETHOD.
























method DUMP_PREORDER2 .

  DATA: CHILD TYPE REF TO CL_TREE_MODEL_NODE,
        NEW_LEVEL TYPE I,
        TEXT TYPE CHAR80,
        w_node type ref to cl_tree_model_node,
        LENGTH TYPE I,
        pos type i,
        is_p_node type as4flag,
        is_mod_p_node type as4flag,
        is_w_node type as4flag,
        is_new_root_node type as4flag,
        is_selected type as4flag,
        color type as4flag,
        error type string.


DEFINE SHOW_TEXT.
  SNODE = &1.
  TEXT = SNODE->long_key.
  CONDENSE TEXT NO-GAPS.
  LENGTH = STRLEN( TEXT ).
  WRITE AT (LENGTH) TEXT color 1.
END-OF-DEFINITION.
DEFINE SHOW_TEXT_2.
  TEXT = &1.
  CONDENSE TEXT NO-GAPS.
  LENGTH = STRLEN( TEXT ).
  WRITE AT (LENGTH) TEXT.
END-OF-DEFINITION.

* check if node is selected
  if node = DELTA_SELECTION-node_to_select.
    is_selected = 'X'.
  endif.
  if node = DELTA_SELECTION-derived_class_selection.
    is_selected = 'X'.
  endif.
  read table DELTA_SELECTION-nodes_to_select from node
    transporting no fields.
  if sy-subrc = 0.
    is_selected = 'X'.
  endif.


  loop at node->w_nodes into w_node.
    if w_node->parent <> node.
      concatenate 'W_NODE has wrong parent' "#EC NOTEXT
        error into error.
    endif.
  endloop.
  read table p_nodes from node TRANSPORTING no fields.
  if sy-subrc = 0.
    is_p_node = 'X'.
    if node->in_view is initial.
      concatenate 'P_NODE is not in view' "#EC NOTEXT
        error into error.
    endif.
  endif.
  read table mod_p_nodes from node TRANSPORTING no fields.
  if sy-subrc = 0.
    is_mod_p_node = 'X'.
    if is_p_node is initial.
      concatenate 'MOD_P_NODE is no P_NODE' "#EC NOTEXT
        error into error.
    endif.
  endif.
  if node->parent is initial.
    read table new_root_nodes from node TRANSPORTING no fields.
    if sy-subrc = 0.
      is_new_root_node = 'X'.
      if not node->in_view is initial.
        concatenate 'new_root_node is in view' error into error.
      endif.
    endif.
  else.
    read table node->parent->w_nodes from node TRANSPORTING no fields.
    if sy-subrc = 0.
      is_w_node = 'X'.
      if not node->in_view is initial.
        concatenate 'W_NODE is in view' "#EC NOTEXT
          error into error.
      endif.
      read table p_nodes from node->parent TRANSPORTING no fields.
      if sy-subrc <> 0.
        concatenate 'Parent of W_NODE is no P_NODE' "#EC NOTEXT
          error into error.
      endif.
      if node->parent->nr_of_children_in_view = 0.
        if node->parent->expander is initial.
          concatenate
            'Parent of W_NODE has no expander ' "#EC NOTEXT
            error into error.
        endif.
      endif.
    endif.
  endif.
  if not node->in_view is initial.
    if not node->parent is initial and node->parent->in_view is initial.
      concatenate 'parent not in view' "#EC NOTEXT
      error into error.
    endif.
    if not node->parent is initial
      and node->parent->nr_of_children_in_view = 0.
      concatenate
        'nr_of_children_in_view of parent wrong' "#EC NOTEXT
        error into error.
    endif.
  endif.

  pos = level * 2.
  WRITE: AT /pos ' ' NO-GAP.
  TEXT = NODE->long_key.
  CONDENSE TEXT NO-GAPS.
  LENGTH = STRLEN( TEXT ).

  if not is_new_root_node is initial.
    write 'R' color 1. color  = 'X'.
  endif.
  if not is_mod_p_node is initial.
    write 'MP' color 1. color  = 'X'.
  elseif not is_p_node is initial.
    write 'P' color 1. color  = 'X'.
  endif.
  if not is_w_node is initial.
    write 'W' color 1. color  = 'X'.
  endif.

  if not error is initial.
    write error color 6.
  endif.
  if color is INITIAL.
    write ' ' color 4.
  endif.

  if is_selected is initial.
    WRITE AT (LENGTH) TEXT.
  else.
    WRITE AT (LENGTH) TEXT color 1.
  endif.

  if not node->in_view is initial.
    write 'V' color 5.
  endif.
  if not node->expander is initial.
    write 'E' color 5.
  endif.
  if not node->expand is initial.
    write 'E+' color 5.
  endif.


*  SHOW_TEXT NODE.
*  WRITE 'P:'.
*  IF NOT NODE->PARENT IS INITIAL.
*    SHOW_TEXT NODE->PARENT.
*  ENDIF.
*  WRITE '#Ch:'.
*  SHOW_TEXT_2 NODE->NR_OF_CHILDREN.
*  WRITE 'FC:'.
*  IF NOT NODE->FIRST_CHILD IS INITIAL.
*    SHOW_TEXT NODE->FIRST_CHILD.
*  ENDIF.
*  WRITE 'LC:'.
*  IF NOT NODE->LAST_CHILD IS INITIAL.
*    SHOW_TEXT NODE->LAST_CHILD.
*  ENDIF.
*  WRITE 'PS:'.
*  IF NOT NODE->PREV_SIBLING IS INITIAL.
*    SHOW_TEXT NODE->PREV_SIBLING.
*  ENDIF.
*  WRITE 'NS:'.
*  IF NOT NODE->NEXT_SIBLING IS INITIAL.
*    SHOW_TEXT NODE->NEXT_SIBLING.
*  ENDIF.



  CHILD = NODE->FIRST_CHILD.
  NEW_LEVEL = LEVEL + 1.
  WHILE NOT CHILD IS INITIAL.
    CALL METHOD DUMP_PREORDER2 EXPORTING LEVEL = NEW_LEVEL NODE = CHILD.
    CHILD = CHILD->NEXT_SIBLING.
  ENDWHILE.
ENDMETHOD.


METHOD DUMP_TREE.

  DATA: NODE TYPE REF TO CL_TREE_MODEL_NODE.

  WRITE: AT / 'nr_of_root_nodes:', NR_OF_ROOT_NODES.

  NODE = FIRST_ROOT_NODE.

  WHILE NOT NODE IS INITIAL.
    CALL METHOD DUMP_PREORDER EXPORTING NODE = NODE LEVEL = 1.
    NODE = NODE->NEXT_SIBLING.
  ENDWHILE.
ENDMETHOD.
























method DUMP_TREE2 .

  DATA: NODE TYPE REF TO CL_TREE_MODEL_NODE.

  WRITE: AT / 'nr_of_root_nodes:', NR_OF_ROOT_NODES.

  NODE = FIRST_ROOT_NODE.

  WHILE NOT NODE IS INITIAL.
    CALL METHOD DUMP_PREORDER2 EXPORTING NODE = NODE LEVEL = 1.
    NODE = NODE->NEXT_SIBLING.
  ENDWHILE.
ENDMETHOD.
























METHOD ENSURE_VISIBLE .
  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* get node object
  READ TABLE long_key_to_object_map
    WITH table KEY node_key = node_key
      INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.

  node = long_key_to_object_map_entry-node.

* check control
  CALL METHOD check_control
    EXCEPTIONS
      control_not_existing = 1
      control_dead = 2.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
  ENDCASE.

* expand the predecessors of the node
* if the node is not in the control
* => node will be copied to control
  IF node->in_view IS INITIAL.
    CALL METHOD expand_predecessors
      EXPORTING node = node.
  ENDIF.

* update view
  CALL METHOD update_view
    EXCEPTIONS
      control_not_existing     = 1
      control_dead             = 2
      cntl_system_error        = 3
      failed                   = 4.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
    WHEN 3. RAISE cntl_system_error.
    WHEN 4. RAISE failed.
  ENDCASE.

* call ensure_visible of control
  CALL METHOD base_tree_control->ensure_visible
    EXPORTING
      node_key = node->view_key
    EXCEPTIONS
      failed                     = 1
      cntl_system_error          = 2
      node_not_found             = 3.
  CASE sy-subrc.
    WHEN 1. RAISE failed.
    WHEN 2. RAISE cntl_system_error.
    WHEN 3. CALL METHOD internal_error.
  ENDCASE.

ENDMETHOD.


METHOD EXPAND_NODE.

   DATA: LONG_KEY_TO_OBJECT_MAP_ENTRY TYPE TREEM_LONG_KEY_TO_OBJECT,
         NODE TYPE REF TO CL_TREE_MODEL_NODE.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  READ TABLE LONG_KEY_TO_OBJECT_MAP
    WITH table KEY NODE_KEY = NODE_KEY
      INTO LONG_KEY_TO_OBJECT_MAP_ENTRY.
    IF SY-SUBRC <> 0.
      RAISE NODE_NOT_FOUND.
    ENDIF.

  NODE = LONG_KEY_TO_OBJECT_MAP_ENTRY-NODE.

* expand the predecessors of the node if requested
  IF NOT EXPAND_PREDECESSORS IS INITIAL.
    call method expand_predecessors
      exporting node = node.
  ENDIF.

  IF NODE->NR_OF_CHILDREN = 0.
    EXIT.
  ENDIF.

* expand subtree with root NODE if requested
  IF NOT EXPAND_subtree IS INITIAL.
    CALL METHOD EXPAND_TREE
      EXPORTING NODE = NODE.
  ELSEIF LEVEL_COUNT > 0.
    CALL METHOD EXPAND_TREE_LEVEL
      EXPORTING NODE = NODE LEVEL_COUNT = LEVEL_COUNT.
  ELSE.
    CALL METHOD EXPAND_NODE_INT EXPORTING NODE = NODE.
  ENDIF.

ENDMETHOD.


METHOD EXPAND_NODES.

  DATA: node_key TYPE tm_nodekey,
        long_key_to_object_map_entry TYPE treem_long_key_to_object.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  LOOP AT node_key_table INTO node_key.
    " get the node object
    READ TABLE long_key_to_object_map
      WITH table KEY node_key = node_key
      INTO long_key_to_object_map_entry.
    IF sy-subrc <> 0.
      CALL METHOD handle_error_in_table
        EXPORTING
          method = 'EXPAND_NODES'
          table_name = 'NODE_KEY_TABLE'
          text_id    = 1
          node_key   = node_key.
      RAISE error_in_node_key_table.
    ENDIF.
    " expand the node
    CALL METHOD expand_node_int
      EXPORTING node = long_key_to_object_map_entry-node.
  ENDLOOP.
ENDMETHOD.


METHOD EXPAND_NODE_INT.

  DATA: VIEW_KEY TYPE TV_NODEKEY.

* node has no children or is already expanded => exit
  IF ( NODE->NR_OF_CHILDREN = 0 )
    OR ( NOT NODE->EXPAND IS INITIAL ).
    EXIT.
  ENDIF.

  VIEW_KEY = NODE->VIEW_KEY.
  NODE->EXPAND = 'X'.

  IF NODE->IN_VIEW IS INITIAL.
    INSERT VIEW_KEY INTO TABLE MEXP_NODES.
  ELSE.
    " check if node is in col_nodes
    READ TABLE COL_NODES FROM VIEW_KEY TRANSPORTING NO FIELDS.
    IF SY-SUBRC = 0.
      " remove node from col_nodes
      DELETE TABLE COL_NODES FROM VIEW_KEY.
    ENDIF.
    INSERT VIEW_KEY INTO TABLE EXP_NODES.
    " check if node is in p_nodes
    read table p_nodes from node
        transporting no fields.
    if sy-subrc = 0.
      " insert node in mod_p_nodes if
      " node is not in mod_p_nodes
      read table mod_p_nodes from node
        transporting no fields.
      if sy-subrc <> 0.
        insert node into table mod_p_nodes.
      endif.
    endif.
  ENDIF.
ENDMETHOD.

























METHOD EXPAND_NODE_PREDECESSORS .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  READ TABLE long_key_to_object_map
    WITH TABLE KEY node_key = node_key
      INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.

  node = long_key_to_object_map_entry-node.

* expand the predecessors of the node
  CALL METHOD expand_predecessors
    EXPORTING node = node.

ENDMETHOD.


METHOD EXPAND_PREDECESSORS.
  DATA: p_node TYPE REF TO cl_tree_model_node.

  p_node = node->parent.
  WHILE NOT p_node IS INITIAL.
    CALL METHOD expand_node_int EXPORTING node = p_node.
    p_node = p_node->parent.
  ENDWHILE.

ENDMETHOD.


METHOD EXPAND_ROOT_NODES .

  DATA: node TYPE REF TO cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  IF level_count < 0.
    RAISE illegal_level_count.
  ENDIF.

  node = first_root_node.

  WHILE NOT node IS INITIAL.
    " expand subtree with root NODE if requested
    IF NOT expand_subtree IS INITIAL.
      CALL METHOD expand_tree
        EXPORTING node = node.
    ELSEIF level_count > 0.
      CALL METHOD expand_tree_level
        EXPORTING node = node level_count = level_count.
    ELSE.
      CALL METHOD expand_node_int EXPORTING node = node.
    ENDIF.
    node = node->next_sibling.
  ENDWHILE.


ENDMETHOD.


METHOD EXPAND_TREE.

  DATA: CHILD TYPE REF TO CL_TREE_MODEL_NODE.

  IF NODE->NR_OF_CHILDREN = 0.
    EXIT.
  ENDIF.
* expand the node
  CALL METHOD EXPAND_NODE_INT EXPORTING NODE = NODE.

* expand the children of the node
  CHILD = NODE->FIRST_CHILD.
  WHILE NOT CHILD IS INITIAL.
    CALL METHOD EXPAND_TREE EXPORTING NODE = CHILD.
    CHILD = CHILD->NEXT_SIBLING.
  ENDWHILE.
ENDMETHOD.

























METHOD EXPAND_TREE_LEVEL.

  DATA: NEW_LEVEL_COUNT TYPE I,
        CHILD TYPE REF TO CL_TREE_MODEL_NODE.

  IF NODE->NR_OF_CHILDREN = 0.
    EXIT.
  ENDIF.
* expand the node
  CALL METHOD EXPAND_NODE_INT EXPORTING NODE = NODE.

  NEW_LEVEL_COUNT = LEVEL_COUNT - 1.

  IF NEW_LEVEL_COUNT >= 0.
* expand the children of the node
    CHILD = NODE->FIRST_CHILD.
    WHILE NOT CHILD IS INITIAL.
      CALL METHOD EXPAND_TREE_LEVEL
        EXPORTING NODE = CHILD LEVEL_COUNT = NEW_LEVEL_COUNT.
      CHILD = CHILD->NEXT_SIBLING.
  ENDWHILE.
  ENDIF.
ENDMETHOD.

























method FIND_INIT.
  DATA: node TYPE REF TO cl_tree_model_node,
        long_key_to_object_map_entry TYPE treem_long_key_to_object,
        item_name type tv_itmname.

* new search => clear old FIND_STACK
  CLEAR find_stack.
  CLEAR find_ignore_expander_node_key.
  find_search_string = search_string.
  find_pattern_search = pattern_search.
  find_stop_at_expander_node = stop_at_expander_node.
  find_item_name_table = item_name_table.

* push root nodes on stack
  IF start_node IS INITIAL.
    node = last_root_node.
    WHILE NOT node IS INITIAL.
      INSERT node->long_key INTO find_stack INDEX 1.
      node = node->prev_sibling.
    ENDWHILE.
  ELSE.
*   get the node object
    READ TABLE long_key_to_object_map
      WITH TABLE KEY node_key = start_node
      INTO long_key_to_object_map_entry.
    IF sy-subrc <> 0.
      RAISE start_node_not_found.
    ENDIF.
    INSERT long_key_to_object_map_entry-node->long_key
      INTO find_stack INDEX 1.
  ENDIF.

endmethod.


METHOD GET_ALL_NODE_KEYS .


  DATA: entry TYPE treem_long_key_to_object.

  CLEAR node_key_table.

  LOOP AT long_key_to_object_map INTO entry.
    APPEND entry-node_key TO node_key_table.
  ENDLOOP.

ENDMETHOD.


method GET_CLASS_NAME.

  class_name = 'CL_TREE_MODEL'.

endmethod.


method GET_CONTROL_LAYOUT_FOR_PRINT .
* ...
endmethod.


method GET_CTX_MENU_SELECT_EVENT_APPL .

  appl_event = base_properties-ctx_menu_select_event_appl.

endmethod.


method GET_DEFAULT_DROP .

  drag_drop = base_properties-default_drop.

endmethod.


METHOD GET_EXPANDED_NODES.

  DATA: view_keys TYPE treev_nks.

* check control
  CALL METHOD check_control
    EXCEPTIONS
      control_not_existing = 1
      control_dead = 2.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
  ENDCASE.

* update view if model changed
  CALL METHOD update_view
    EXCEPTIONS
      control_not_existing     = 1
      control_dead             = 2
      cntl_system_error        = 3
      failed                   = 4.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
    WHEN 3. RAISE cntl_system_error.
    WHEN 4. RAISE failed.
  ENDCASE.

* get the node keys of the expanded nodes from the tree control
  CALL METHOD base_tree_control->get_expanded_nodes
    EXPORTING
      no_hidden_nodes = no_hidden_nodes
    CHANGING
      node_key_table = view_keys
    EXCEPTIONS
      cntl_system_error = 1
      dp_error          = 2
      failed            = 3.
  CASE sy-subrc.
    WHEN 1. RAISE cntl_system_error.
    WHEN 2 OR 3. RAISE failed.
  ENDCASE.

  CALL METHOD cl_gui_cfw=>flush
    EXCEPTIONS
      cntl_system_error = 1
      cntl_error        = 2
      OTHERS            = 3.
  CASE sy-subrc.
    WHEN 1. RAISE cntl_system_error.
    WHEN 2 OR 3. RAISE failed.
  ENDCASE.

* map the view keys to long keys.
  CALL METHOD map_view_keys_to_long_keys
    EXPORTING view_keys = view_keys
    CHANGING long_keys = node_key_table.

ENDMETHOD.


METHOD GET_FIRST_ROOT_NODE.

  IF first_root_node IS INITIAL.
    CLEAR node_key.
  ELSE.
    node_key = first_root_node->long_key.
  ENDIF.

ENDMETHOD.


method GET_FOLDER_SHOW_EXP_IMAGE .

  folder_show_exp_image = base_properties-folder_show_exp_image.

ENDMETHOD.


METHOD GET_HIDE_SELECTION.

  hide_selection = me->hide_selection.

ENDMETHOD.


METHOD GET_ICON_LENGTH.

  DATA: tmpicons TYPE treemictab,
        icon TYPE icon,
        int_icon_id TYPE icon_d.

  IF icons IS INITIAL.
    SELECT * FROM icon INTO TABLE tmpicons.
    icons = tmpicons.
  ENDIF.

  int_icon_id = icon_id.
  int_icon_id+3(1) = '@'. " correct key if icon has quickinfo

  READ TABLE icons WITH TABLE KEY id = int_icon_id INTO icon.
  IF sy-subrc = 0.
    length = icon-oleng.
  ELSE.
    length = 0.
  ENDIF.

ENDMETHOD.


method GET_KEY_STROKES.

  data: key type i.

  clear key_strokes.

  loop at me->keystrokes into key.
    append key to key_strokes.
  endloop.

endmethod.


method GET_LAST_ROOT_NODE .

  IF last_root_node IS INITIAL.
    CLEAR node_key.
  ELSE.
    node_key = last_root_node->long_key.
  ENDIF.

ENDMETHOD.


METHOD GET_LONG_KEY_BY_VIEW_KEY.
  DATA: view_key_to_object_entry TYPE treem_view_key_to_object.

  " get the node object
  READ TABLE view_key_to_object_map
    WITH table KEY node_key = view_key
    INTO view_key_to_object_entry.
  IF sy-subrc <> 0.
    CALL METHOD internal_error.
  ENDIF.
  long_key = view_key_to_object_entry-node->long_key.
ENDMETHOD.


METHOD GET_LONG_KEY_BY_VIEW_KEY_EX .
  DATA: view_key_to_object_entry TYPE treem_view_key_to_object.

* get the node object
  READ TABLE view_key_to_object_map
    WITH TABLE KEY node_key = view_key
    INTO view_key_to_object_entry.
  IF sy-subrc = 0.
    CLEAR node_not_found.
    long_key = view_key_to_object_entry-node->long_key.
  ELSE.
    node_not_found = 'X'.
  ENDIF.
ENDMETHOD.


METHOD GET_MAX_NODE_COPY_COUNT.

  IF wan_flag IS INITIAL.
    max_node_copy_count = 100.
  ELSE.
    max_node_copy_count = 50.
  ENDIF.

ENDMETHOD.


method GET_MAX_NODE_WIDTHS .

  include <symbol>.
  data: node type ref to cl_tree_model_node,
        child_node type ref to cl_tree_model_node,
        stack type standard table of TREEMNREF,
        node_key_table type treemnotab,
        process_children type as4flag,
        pos type i,
        length type i,
        icon type ICON_D,
        data_pos type i.


* put root nodes on stack
  node = last_root_node.
  WHILE NOT node IS INITIAL.
    if node->hidden is initial.
      INSERT node INTO stack INDEX 1.
      node->level = 0.
    endif.
    node = node->prev_sibling.
  ENDWHILE.

* process stack
  WHILE NOT stack IS INITIAL.
    READ TABLE stack INTO node INDEX 1.
*   remove node from stack
    DELETE stack INDEX 1.
*   put children of node on stack
    clear process_children.
    if print_info-all_nodes is initial.
*     process children if node is an expanded folder
      if not node->isfolder is initial.
        read table print_info-expanded_nodes
          from node->long_key transporting no fields.
        if sy-subrc = 0.
          process_children = 'X'.
        endif.
      endif.
    else.
      process_children = 'X'.
    endif.
    if not process_children is initial.
      child_node = node->last_child.
      WHILE NOT child_node IS INITIAL.
        if child_node->hidden is initial.
          INSERT child_node INTO stack INDEX 1.
          child_node->level = node->level + 1.
        endif.
        child_node = child_node->prev_sibling.
      ENDWHILE.
    endif.
*   set start position for output
    pos = node->level * 2 + 1.
    WRITE: AT /pos '' NO-GAP.
    position pos.
*   hierarchy symbol
    if node->nr_of_children > 0.
      if process_children is initial.
        write at (1) sym_right_triangle as symbol no-gap.
        write ' ' no-gap.
      else.
        write at (1) sym_down_triangle as symbol no-gap.
        write ' ' no-gap.
      endif.
    else.
      if node->force_plus is initial.
        write '  ' no-gap.
      else.
        write at (1) sym_right_triangle as symbol no-gap.
        write ' ' no-gap.
      endif.
    endif.
*   setup folder leaf symbol
    if node->isfolder is initial.
      if node->image is initial.
         write at (2) sym_document as symbol no-gap.
         write ' ' no-gap.
      else.
         length = get_icon_length( icon_id = node->image ).
         icon = node->image.
         write at (length) icon as icon no-gap.
         write ' ' no-gap.
      endif.
    else.
      if node->image is initial.
         write at (2) sym_folder as symbol no-gap.
         write ' ' no-gap.
      else.
         length = get_icon_length( icon_id = node->image ).
         icon = node->image.
         write at (length) icon as icon no-gap.
         write ' ' no-gap.
      endif.
    endif.

    CALL METHOD me->print_tree_node_ex
      EXPORTING
        node        = node
        pos         = sy-colno.
  endwhile.


endmethod.


METHOD GET_NODE_BY_LONG_KEY.

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object.

* get the node object
  READ TABLE long_key_to_object_map
    WITH TABLE KEY node_key = long_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    CLEAR node.
  ELSE.
    node = long_key_to_object_map_entry-node.
  ENDIF.

ENDMETHOD.


METHOD GET_NODE_SELECTION_MODE.

  node_selection_mode = me->node_selection_mode.

ENDMETHOD.


method GET_NR_OF_NODES .

  describe table long_key_to_object_map lines nr_of_nodes.

ENDMETHOD.


method GET_NR_OF_ROOT_NODES .

  nr_of_root_nodes = me->nr_of_root_nodes.

ENDMETHOD.


METHOD GET_ROOT_NODES .

  DATA: node TYPE REF TO cl_tree_model_node.

  CLEAR node_key_table.

  node = first_root_node.

  WHILE NOT node IS INITIAL.
    APPEND node->long_key TO node_key_table.
    node = node->next_sibling.
  ENDWHILE.

ENDMETHOD.


METHOD GET_SELECTED_NODE.
  DATA: view_key TYPE tv_nodekey.

* check control
  CALL METHOD check_control
    EXCEPTIONS
      control_not_existing = 1
      control_dead = 2.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
  ENDCASE.

* check node_selection_mode
  IF node_selection_mode <> node_sel_mode_single.
    RAISE single_node_selection_only.
  ENDIF.

* update view if model changed
  CALL METHOD update_view
    EXCEPTIONS
      control_not_existing     = 1
      control_dead             = 2
      cntl_system_error        = 3
      failed                   = 4.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
    WHEN 3. RAISE cntl_system_error.
    WHEN 4. RAISE failed.
  ENDCASE.

* get the selected node from the control
  CALL METHOD base_tree_control->get_selected_node
    IMPORTING
      node_key = view_key
    EXCEPTIONS
      failed                     = 1
      single_node_selection_only = 2
      cntl_system_error          = 3.
  CASE sy-subrc.
    WHEN 1. RAISE failed.
    WHEN 2. CALL METHOD internal_error.
    WHEN 3. RAISE cntl_system_error.
  ENDCASE.
  CALL METHOD cl_gui_cfw=>flush
    EXCEPTIONS
      cntl_system_error = 1
      cntl_error        = 2.
  CASE sy-subrc.
    WHEN 1. RAISE cntl_system_error.
    WHEN 2. RAISE failed.
  ENDCASE.

  IF view_key IS INITIAL.
    " no node is selected
    CLEAR node_key.
  ELSE.
    " convert view key to long key
    CALL METHOD get_long_key_by_view_key
      EXPORTING view_key = view_key
      CHANGING long_key = node_key.
  ENDIF.

ENDMETHOD.


METHOD GET_SELECTED_NODES .

  DATA: view_keys TYPE treev_nks.

  clear node_key_table.

* check control
  CALL METHOD check_control
    EXCEPTIONS
      control_not_existing = 1
      control_dead = 2.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
  ENDCASE.

* check node selection mode
  if node_selection_mode <> node_sel_mode_multiple.
    raise multiple_node_selection_only.
  endif.

* update view if model changed
  CALL METHOD update_view
    EXCEPTIONS
      control_not_existing     = 1
      control_dead             = 2
      cntl_system_error        = 3
      failed                   = 4.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
    WHEN 3. RAISE cntl_system_error.
    WHEN 4. RAISE failed.
  ENDCASE.

* get the node keys of the selected nodes from the tree control
  CALL METHOD base_tree_control->get_selected_nodes
    CHANGING
      node_key_table = view_keys
    EXCEPTIONS
      cntl_system_error            = 1
      dp_error                     = 2
      failed                       = 3
      multiple_node_selection_only = 4.
  CASE sy-subrc.
    WHEN 1. RAISE cntl_system_error.
    WHEN 2 OR 3. RAISE failed.
    WHEN 4. CALL METHOD internal_error.
  ENDCASE.

  CALL METHOD cl_gui_cfw=>flush
    EXCEPTIONS
      cntl_system_error = 1
      cntl_error        = 2
      OTHERS            = 3.
  CASE sy-subrc.
    WHEN 1. RAISE cntl_system_error.
    WHEN 2 OR 3. RAISE failed.
  ENDCASE.

* map the view keys to long keys.
  CALL METHOD map_view_keys_to_long_keys
    EXPORTING view_keys = view_keys
    CHANGING long_keys = node_key_table.

ENDMETHOD.


method GET_TOP_NODE .
  DATA: view_key TYPE tv_nodekey.

* check control
  CALL METHOD check_control
    EXCEPTIONS
      control_not_existing = 1
      control_dead = 2.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
  ENDCASE.

* update view if model changed
  CALL METHOD update_view
    EXCEPTIONS
      control_not_existing     = 1
      control_dead             = 2
      cntl_system_error        = 3
      failed                   = 4.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
    WHEN 3. RAISE cntl_system_error.
    WHEN 4. RAISE failed.
  ENDCASE.

* get the top node from the control
  CALL METHOD base_tree_control->get_top_node
    IMPORTING
      node_key = view_key
    EXCEPTIONS
      failed                     = 1
      cntl_system_error          = 2.
  CASE sy-subrc.
    WHEN 1. RAISE failed.
    WHEN 2. RAISE cntl_system_error.
  ENDCASE.
  CALL METHOD cl_gui_cfw=>flush
    EXCEPTIONS
      cntl_system_error = 1
      cntl_error        = 2.
  CASE sy-subrc.
    WHEN 1. RAISE cntl_system_error.
    WHEN 2. RAISE failed.
  ENDCASE.

  IF view_key IS INITIAL.
    " no top node (tree must be empty)
    CLEAR node_key.
  ELSE.
    " convert view key to long key
    CALL METHOD get_long_key_by_view_key
      EXPORTING view_key = view_key
      CHANGING long_key = node_key.
  ENDIF.

ENDMETHOD.


METHOD HANDLE_DEFAULT_CONTEXT_MENU_RE .

  CALL METHOD check_if_view_is_up_to_date.

  RAISE EVENT default_context_menu_request
    EXPORTING menu = menu.

ENDMETHOD.


method HANDLE_DEFAULT_CONTEXT_MENU_SE .

  RAISE EVENT default_context_menu_select
    EXPORTING fcode = fcode.

endmethod.


METHOD HANDLE_DROP .
  DATA: long_key TYPE tm_nodekey,
        node_not_found TYPE as4flag.

  IF node_key IS INITIAL.
*   drop on white area
    CLEAR long_key.
  ELSE.
    CALL METHOD get_long_key_by_view_key_ex
      EXPORTING view_key = node_key
      IMPORTING node_not_found = node_not_found
      CHANGING long_key = long_key.
  ENDIF.

  IF node_not_found IS INITIAL.
    RAISE EVENT drop
      EXPORTING
        node_key = long_key
        drag_drop_object = drag_drop_object.
  ELSE.
*   cancel drag & drop operation
    CALL METHOD drag_drop_object->abort.
*   display error popup
    CALL METHOD show_error_drop_no_node.
  ENDIF.

ENDMETHOD.


























METHOD HANDLE_DROP_GET_FLAVOR.

  DATA: long_key TYPE tm_nodekey,
        node_not_found TYPE as4flag.

  IF node_key IS INITIAL.
*   drop on white area
    CLEAR long_key.
  ELSE.
    CALL METHOD get_long_key_by_view_key_ex
      EXPORTING view_key = node_key
      IMPORTING node_not_found = node_not_found
      CHANGING long_key = long_key.
  ENDIF.

  IF node_not_found IS INITIAL.
    RAISE EVENT drop_get_flavor
      EXPORTING
        node_key = long_key
        flavors = flavors
        drag_drop_object = drag_drop_object.
  ELSE.
*   cancel drag & drop operation
    CALL METHOD drag_drop_object->abort.
*   display error popup
    CALL METHOD show_error_drop_no_node.
  ENDIF.

ENDMETHOD.


METHOD HANDLE_ERROR_IN_TABLE.


  DATA: class_name TYPE string,
        class_name_c(132) TYPE c,
        node_key_c(132) TYPE c,
        error_text(132) type c.

  class_name = get_class_name( ).
  class_name_c = class_name.
  node_key_c = node_key.

  case text_id.
    when 1. error_text = text-001.
    when 2. error_text = text-002.
    when 3. error_text = text-003.
    when 4. error_text = text-004.
    when 5. error_text = text-005.
    when 6. error_text = text-006.
    when 7. error_text = text-007.
    when 8. error_text = text-008.
    when 9. error_text = text-009.
    when 10. error_text = text-010.
    when 11. error_text = text-011.
    when 12. error_text = text-012.
    when 13. error_text = text-013.
    when 14. error_text = text-014.
    when 15. error_text = text-015.
    when 16. error_text = text-016.
    when 17. error_text = text-017.
*    when 18. error_text = text-018.
*    when 19. error_text = text-019.
*    when 20. error_text = text-020.
  endcase.

  CALL FUNCTION 'TREEM_SHOW_TABLE_ERROR'
       EXPORTING
            class_name    = class_name_c
            method_name   = method
            table_name    = table_name
            error_text    = error_text
            node_key      = node_key_c
            item_name     = item_name.

ENDMETHOD.


METHOD HANDLE_EXPAND_NO_CHILDREN.

  DATA: c_nodes TYPE treem_c_nodes,    " nodes which must be
                                       " copied to the view
        c_node TYPE REF TO cl_tree_model_node,
        view_key_to_object_entry TYPE treem_view_key_to_object,
        node TYPE REF TO cl_tree_model_node,
        child_node TYPE REF TO cl_tree_model_node,
        copied_nodes TYPE i,
        queue TYPE STANDARD TABLE OF treem_c_node,
        sum TYPE i,
        max_node_copy_count type i.

  CALL METHOD check_if_view_is_up_to_date.

* get the node object
  READ TABLE view_key_to_object_map
    WITH TABLE KEY node_key = node_key
    INTO view_key_to_object_entry.
  IF sy-subrc <> 0.
    CALL METHOD internal_error.
  ENDIF.
  node = view_key_to_object_entry-node.

* check if node has FORCE_PLUS Property an no children
  IF NOT node->force_plus IS INITIAL.
    IF node->nr_of_children > 0.
*     a node with force_plus property must not have childen
*     (adding children to such a node removes the force plus
*     property)
      CALL METHOD internal_error.
    ENDIF.
    CLEAR node->force_plus.
    CLEAR node->expander.
*   close folder
    CALL METHOD base_tree_control->collapse_subtree
      EXPORTING
        node_key = node_key
      EXCEPTIONS
        failed            = 1
        node_not_found    = 2
        cntl_system_error = 3.
    IF sy-subrc <> 0.
      CALL METHOD internal_error.
    ENDIF.
*   clear expander property in control
    CALL METHOD base_tree_control->node_set_expander
      EXPORTING
        node_key = node_key
        expander = ' '
      EXCEPTIONS
        failed            = 1
        node_not_found    = 2
        cntl_system_error = 3.
    IF sy-subrc <> 0.
      CALL METHOD internal_error.
    ENDIF.
    RAISE EVENT expand_no_children EXPORTING node_key = node->long_key.
    EXIT.
  ENDIF.

* disable screen update of control
  CALL METHOD base_tree_control->set_screen_update
    EXPORTING
      UPDATE            = ' '
    EXCEPTIONS
      FAILED            = 1
      CNTL_SYSTEM_ERROR = 2.
  IF sy-subrc <> 0.
    CALL METHOD internal_error.
  ENDIF.

* close folder
  CALL METHOD base_tree_control->collapse_subtree
    EXPORTING
      node_key = node_key
    EXCEPTIONS
      failed            = 1
      node_not_found    = 2
      cntl_system_error = 3.
  IF sy-subrc <> 0.
    CALL METHOD internal_error.
  ENDIF.

* remove node from p_nodes and its children from w_nodes
  DELETE TABLE p_nodes FROM node.
  CLEAR node->w_nodes.

  child_node = node->first_child.

* add the children of node to the queue and remove them from w_nodes
  WHILE NOT child_node IS INITIAL.
    APPEND child_node TO queue.
    child_node = child_node->next_sibling.
  ENDWHILE.
  copied_nodes = copied_nodes + node->nr_of_children.
  node->nr_of_children_in_view = node->nr_of_children.

  max_node_copy_count = get_max_node_copy_count( ).

  WHILE NOT queue IS INITIAL.
*   remove first element from the queue
    READ TABLE queue INTO c_node INDEX 1.
    DELETE queue INDEX 1.
    c_node->in_view = 'X'.
    APPEND c_node TO c_nodes.
    IF NOT c_node->isfolder IS INITIAL.
      IF c_node->nr_of_children > 0 .
*       node is a folder and has children
        sum = c_node->nr_of_children + copied_nodes.
        IF sum <= max_node_copy_count.
*         add the children of node to the queue
          child_node = c_node->first_child.
          WHILE NOT child_node IS INITIAL.
            APPEND child_node TO queue.
            child_node = child_node->next_sibling.
          ENDWHILE.
          copied_nodes = copied_nodes + c_node->nr_of_children.
          c_node->nr_of_children_in_view = c_node->nr_of_children.
        ELSE.
          c_node->expander = 'X'.
*         c_node is a parent of w_nodes
          INSERT c_node INTO TABLE p_nodes.
*         append children of c_node to w_nodes
          child_node = c_node->first_child.
*         insert children in w_nodes of node
          WHILE NOT child_node IS INITIAL.
            INSERT child_node INTO TABLE c_node->w_nodes.
            child_node = child_node->next_sibling.
          ENDWHILE.
        ENDIF.
      ELSE.
*       node is folder without children
        IF NOT c_node->force_plus IS INITIAL.
          c_node->expander = 'X'.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDWHILE.

* the derived class copies the nodes in c_nodes to the control
  CALL METHOD insert_c_nodes
    EXPORTING
      c_nodes = c_nodes
    EXCEPTIONS
      cntl_system_error = 1
      failed            = 2.
  CASE sy-subrc.
    WHEN 1 OR 2. CALL METHOD internal_error.
  ENDCASE.

* remove EXPANDER on node
  CLEAR node->expander.
  CALL METHOD base_tree_control->node_set_expander
   EXPORTING
     node_key = node_key
     expander = ' '
   EXCEPTIONS
     failed            = 1
     node_not_found    = 2
     cntl_system_error = 3.
  IF sy-subrc <> 0.
    CALL METHOD internal_error.
  ENDIF.

* expand folder
  CALL METHOD base_tree_control->expand_node
    EXPORTING
      node_key = node_key
    EXCEPTIONS
      illegal_level_count = 1
      cntl_system_error   = 2
      node_not_found      = 3
      cannot_expand_leaf  = 4.
  IF sy-subrc <> 0.
    CALL METHOD internal_error.
  ENDIF.

* enable screen update of control
  CALL METHOD base_tree_control->set_screen_update
    EXPORTING
      UPDATE            = 'X'
    EXCEPTIONS
      FAILED            = 1
      CNTL_SYSTEM_ERROR = 2.
  IF sy-subrc <> 0.
    CALL METHOD internal_error.
  ENDIF.

ENDMETHOD.



METHOD HANDLE_NODE_CONTEXT_MENU_REQ.
*---------------------------------------------------------------------*
*       METHOD handle_node_context_menu_req                           *
*---------------------------------------------------------------------*
*       ........                                                      *
*---------------------------------------------------------------------*
  DATA: long_key TYPE tm_nodekey.

  CALL METHOD check_if_view_is_up_to_date.

  IF node_key IS INITIAL.
*   multiple node selection
    CLEAR long_key.
  ELSE.
    CALL METHOD get_long_key_by_view_key
      EXPORTING
        view_key = node_key
      CHANGING
        long_key = long_key.
  ENDIF.

  RAISE EVENT node_context_menu_request
    EXPORTING node_key = long_key menu = menu.

ENDMETHOD.                    "handle_node_context_menu_req


METHOD HANDLE_NODE_CONTEXT_MENU_SEL.
*---------------------------------------------------------------------*
*       METHOD HANDLE_NODE_CONTEXT_MENU_SEL                           *
*---------------------------------------------------------------------*
*       ........                                                      *
*---------------------------------------------------------------------*
  DATA: long_key TYPE tm_nodekey.

  IF node_key IS INITIAL.
*   multiple node selection
    CLEAR long_key.
  ELSE.
    CALL METHOD get_long_key_by_view_key
      EXPORTING
        view_key = node_key
      CHANGING
        long_key = long_key.
  ENDIF.

  RAISE EVENT node_context_menu_select
    EXPORTING node_key = long_key fcode = fcode.

ENDMETHOD.                    "HANDLE_NODE_CONTEXT_MENU_SEL


METHOD HANDLE_NODE_DOUBLE_CLICK .

  DATA: long_key TYPE tm_nodekey.

  CALL METHOD check_if_view_is_up_to_date.

  CALL METHOD get_long_key_by_view_key
    EXPORTING view_key = node_key
    CHANGING long_key = long_key.

  RAISE EVENT node_double_click EXPORTING node_key = long_key.

ENDMETHOD.



METHOD HANDLE_NODE_KEYPRESS .

*---------------------------------------------------------------------*
*       METHOD handle_node_keypress                                   *
*---------------------------------------------------------------------*
*       ........                                                      *
*---------------------------------------------------------------------*
  DATA: long_key TYPE tm_nodekey,
        model_key TYPE i.

  CALL METHOD check_if_view_is_up_to_date.

  IF node_key IS INITIAL.
*   multiple node selection
    CLEAR long_key.
  ELSE.
    CALL METHOD get_long_key_by_view_key
      EXPORTING
        view_key = node_key
      CHANGING
        long_key = long_key.
  ENDIF.

  CALL METHOD convert_to_model_keypress_key
    EXPORTING
      view_key  = key
    CHANGING
      model_key = model_key.

  RAISE EVENT node_keypress
    EXPORTING node_key = long_key key = model_key.

ENDMETHOD.                    "handle_node_keypress


METHOD HANDLE_SELECTION_CHANGED .

*---------------------------------------------------------------------*
*       METHOD handle_selection_changed                               *
*---------------------------------------------------------------------*
*       ........                                                      *
*---------------------------------------------------------------------*
  DATA: long_key TYPE tm_nodekey.

  CALL METHOD check_if_view_is_up_to_date.

  IF node_key IS INITIAL.
    CLEAR long_key.
  ELSE.
    CALL METHOD get_long_key_by_view_key
      EXPORTING
        view_key = node_key
      CHANGING
        long_key = long_key.
  ENDIF.

  RAISE EVENT selection_changed EXPORTING node_key = long_key.

ENDMETHOD.                    "handle_selection_changed


method IF_FLUSH_NOTIFY~BEFORE_FLUSH_NOTIFY.

  if not changed is initial.
    CALL METHOD me->update_view
      EXCEPTIONS
        CONTROL_NOT_EXISTING = 1
        CONTROL_DEAD         = 2
        CNTL_SYSTEM_ERROR    = 3
        FAILED               = 4
        others               = 5.
    case sy-subrc.
      when 1. exit. " Tree Model has no view
      when 2. exit. " Tree Control is not alive
      when 3. message A003(TREE_MODEL_MSG).
      when 4. message A004(TREE_MODEL_MSG).
      when 5. message A004(TREE_MODEL_MSG).
    endcase.
  endif.

endmethod.


METHOD INSERT_C_NODES.


ENDMETHOD.


METHOD INSERT_NODE.

  NODE->PREV_SIBLING = PRED_NODE.
  NODE->NEXT_SIBLING = SUCC_NODE.
  PRED_NODE->NEXT_SIBLING = NODE.
  SUCC_NODE->PREV_SIBLING = NODE.

  IF PRED_NODE->PARENT IS INITIAL.
    " a root node was added
    ADD 1 TO NR_OF_ROOT_NODES.
  ELSE.
    ADD 1 TO PRED_NODE->PARENT->NR_OF_CHILDREN.
    NODE->PARENT = PRED_NODE->PARENT.
  ENDIF.
ENDMETHOD.
























METHOD INTERNAL_ERROR.

  message A002(TREE_MODEL_MSG).
ENDMETHOD.


METHOD LIST_TREE_ADD_NODES.
  DATA: node_object TYPE REF TO cl_item_tree_model_node,
        node TYPE treemlnodt,
        node_key TYPE tm_nodekey,
        relative_node_key TYPE tm_nodekey.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  LOOP AT node_table INTO node.
    CREATE OBJECT node_object.

    node_object->hidden          = node-hidden.
    node_object->disabled        = node-disabled.
    node_object->isfolder        = node-isfolder.
    node_object->style           = node-style.
    node_object->force_plus      = node-expander.
    node_object->no_branch       = node-no_branch.
    node_object->image           = node-n_image.
    node_object->expanded_image  = node-exp_image.
    node_object->last_hitem      = node-last_hitem.
    node_object->drag_drop_id    = node-dragdropid.
    node_object->user_object     = node-userobject.
    node_object->items_incomplete = node-itemsincom.

    IF ( node_key_prefix IS INITIAL ) OR ( node-node_key IS INITIAL ).
      node_key = node-node_key.
    ELSE.
      CONCATENATE node_key_prefix node-node_key INTO node_key.
    ENDIF.

    IF ( node_key_prefix IS INITIAL ) OR ( node-relatkey IS INITIAL ).
      relative_node_key = node-relatkey.
    ELSE.
      CONCATENATE node_key_prefix node-relatkey
        INTO relative_node_key.
    ENDIF.

* insert the node to the tree
    CALL METHOD add_node_int
      EXPORTING
        node_key          = node_key
        relative_node_key = relative_node_key
        relationship      = node-relatship
        node              = node_object
        new_node          = 'X'
        insert_in_update_structu = 'X'
      EXCEPTIONS
        node_key_exists         = 1
        illegal_relationship    = 2
        relative_node_not_found = 3
        node_key_empty          = 4.
    CASE sy-subrc.
      WHEN 1.
        CALL METHOD handle_error_in_table
          EXPORTING
            method     = 'ADD_NODES'
            table_name = 'NODE_KEY_TABLE'
            text_id    = 2              " Schluessel des Knotens
            node_key   = node_key.      " ist bereits vorhanden
        RAISE error_in_node_table.
      WHEN 2.
        CALL METHOD handle_error_in_table
          EXPORTING
            method     = 'ADD_NODES'
            table_name = 'NODE_KEY_TABLE'
            text_id   = 3 " Unzulaessiger Wert im Feld RELATSHIP
            node_key   = node_key.
        RAISE error_in_node_table.
      WHEN 3.
        CALL METHOD handle_error_in_table
          EXPORTING
            method     = 'ADD_NODES'
            table_name = 'NODE_KEY_TABLE'
            text_id    = 4              " Knoten mit Schluessel
            node_key   = node_key.      " RELATKEY existiert nicht
        RAISE error_in_node_table.
      WHEN 4.
        CALL METHOD handle_error_in_table
          EXPORTING
            method     = 'ADD_NODES'
            table_name = 'NODE_KEY_TABLE'
            text_id    = 15             " node_key initial
            node_key   = node_key.      " or consists of blanks
        RAISE error_in_node_table.
    ENDCASE.
  ENDLOOP.

ENDMETHOD.


METHOD MAP_NODE_REFS_TO_VIEW_KEYS .
  DATA: node TYPE REF TO cl_tree_model_node.

  LOOP AT node_refs INTO node.
    APPEND node->view_key TO view_keys.
  ENDLOOP.

ENDMETHOD.


METHOD MAP_VIEW_KEYS_TO_LONG_KEYS.
  DATA: view_key TYPE tv_nodekey,
        view_key_to_object_entry TYPE treem_view_key_to_object.

  LOOP AT view_keys INTO view_key.
    " get the node object
    READ TABLE view_key_to_object_map
      WITH table KEY node_key = view_key
      INTO view_key_to_object_entry.
    IF sy-subrc <> 0.
      CALL METHOD internal_error.
    ENDIF.
    APPEND view_key_to_object_entry-node->long_key TO long_keys.
  ENDLOOP.

ENDMETHOD.


METHOD MAP_VIEW_KEYS_TO_LONG_KEYS_EX .
  DATA: view_key TYPE tv_nodekey,
        view_key_to_object_entry TYPE treem_view_key_to_object.

  CLEAR node_not_found.

  LOOP AT view_keys INTO view_key.
*   get the node object
    READ TABLE view_key_to_object_map
      WITH TABLE KEY node_key = view_key
      INTO view_key_to_object_entry.
    IF sy-subrc <> 0.
      node_not_found = 'X'.
      CLEAR long_keys.
      EXIT.
    ENDIF.
    APPEND view_key_to_object_entry-node->long_key TO long_keys.
  ENDLOOP.

ENDMETHOD.


METHOD MOVE_NODE.
  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        relative_node TYPE REF TO cl_tree_model_node,
        node TYPE REF TO cl_tree_model_node,
        dest_node TYPE REF TO cl_tree_model_node,
        tmp_node TYPE REF TO cl_tree_model_node,
        dest_node_in_view type as4flag.


* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* get the node object
  READ TABLE long_key_to_object_map
    WITH table KEY node_key = node_key
      INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.

  node = long_key_to_object_map_entry-node.

* check if NODE_KEY = RELATIVE_NODE_KEY
  IF node_key = relative_node_key.
    RAISE move_error.
  ENDIF.

* get relative node object
  IF NOT relative_node_key IS INITIAL.
    READ TABLE long_key_to_object_map
      WITH table KEY node_key = relative_node_key
      INTO long_key_to_object_map_entry.
    IF sy-subrc <> 0.
      RAISE relative_node_not_found.
    ENDIF.
    relative_node = long_key_to_object_map_entry-node.
  ENDIF.

* check RELATIONSHIP
  CASE relationship.
    WHEN relat_first_child
    OR relat_first_sibling
    OR relat_last_child
    OR relat_last_sibling
    OR relat_next_sibling
    OR relat_prev_sibling.
    WHEN OTHERS. RAISE illegal_relationship.
  ENDCASE.

* check if node is a predecessor of the destination node
  IF NOT relative_node IS INITIAL.
    CASE relationship.
      WHEN relat_first_child
      OR relat_last_child.
        dest_node = relative_node.
      WHEN relat_first_sibling
      OR relat_last_sibling
      OR relat_next_sibling
      OR relat_prev_sibling.
        dest_node = relative_node->parent.
      WHEN OTHERS. RAISE illegal_relationship.
    ENDCASE.
  ENDIF.

  IF NOT dest_node IS INITIAL.
    tmp_node = dest_node.
    WHILE NOT tmp_node IS INITIAL.
      IF tmp_node = node.
        RAISE move_error.
      ENDIF.
      tmp_node = tmp_node->parent.
    ENDWHILE.
  ENDIF.

* move the node

* NOTE: dest_node is initial means that NODE ist
* a root node after moving.
*
*


  if dest_node is initial.
    dest_node_in_view = 'X'. " node will become a root node
  elseif not dest_node->in_view is initial.
    dest_node_in_view = 'X'.
  else.
    clear dest_node_in_view.
  endif.


 if node->in_view is initial.
   if dest_node_in_view is initial.
*    node not in control, dest_node not in control
     call method move_node_node_out
       exporting
         node = node
         relative_node = relative_node
         relationship = relationship.
   else.
*    node not in control, dest_node in control
     call method move_node_node_out
       exporting
         node = node
         relative_node = relative_node
         relationship = relationship.
   endif.
 else.
   if dest_node_in_view is initial.
*    node in control, dest_node not in control
     call method move_node_node_in_dest_out
       exporting
         node = node
         relative_node = relative_node
         relationship = relationship
       exceptions
         failed = 1
         cntl_system_error = 2
         control_not_existing = 3
         control_dead = 4.
     case sy-subrc.
       when 1. raise failed.
       when 2. raise cntl_system_error.
       when 3. raise control_not_existing.
       when 4. raise control_dead.
     endcase.
   else.
*    node in control, dest_node in control
     call method move_node_node_in_dest_in
       exporting
         node = node
         relative_node = relative_node
         relationship = relationship
         dest_node = dest_node
       exceptions
         failed = 1
         cntl_system_error = 2
         control_not_existing = 3
         control_dead = 4.
     case sy-subrc.
       when 1. raise failed.
       when 2. raise cntl_system_error.
       when 3. raise control_not_existing.
       when 4. raise control_dead.
     endcase.
   endif.
 endif.

ENDMETHOD.


METHOD MOVE_NODE_NODE_IN_DEST_IN.
  DATA: c_nodes TYPE treem_c_nodes,
        view_relatship TYPE i,
        relatkey TYPE tv_nodekey.

* update view
  CALL METHOD update_view
    EXCEPTIONS
      control_not_existing     = 1
      control_dead             = 2
      cntl_system_error        = 3
      failed                   = 4.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
    WHEN 3. RAISE cntl_system_error.
    WHEN 4. RAISE failed.
  ENDCASE.

  IF NOT dest_node IS INITIAL.
*   change dest_node to folder if it is a leaf
    IF dest_node->isfolder IS INITIAL.
      dest_node->isfolder = 'X'.
      CALL METHOD base_tree_control->node_set_is_folder
        EXPORTING
          node_key = dest_node->view_key
          is_folder = 'X'
        EXCEPTIONS
          failed = 1
          node_not_found = 2
          cntl_system_error = 3
          node_has_children = 4.
      CASE sy-subrc.
        WHEN 1. RAISE failed.
        WHEN 3. RAISE cntl_system_error.
        WHEN 2 OR 4. CALL METHOD internal_error.
      ENDCASE.
    ENDIF.

*   remove FORCE_PLUS on dest_node
    CLEAR dest_node->force_plus.

*   dest_node gets a child => expander on dest_node must be removed
    IF NOT dest_node->expander IS INITIAL.
*     remove EXPANDER on dest_node
      CLEAR dest_node->expander.
      CALL METHOD base_tree_control->node_set_expander
        EXPORTING
          node_key = dest_node->view_key
          expander = ' '
        EXCEPTIONS
          failed            = 1
          node_not_found    = 2
          cntl_system_error = 3.
      CASE sy-subrc.
        WHEN 1. RAISE failed.
        WHEN 2. CALL METHOD internal_error.
        WHEN 3. RAISE cntl_system_error.
      ENDCASE.
    ENDIF.

*   all children of destination node must be in the view
    IF  NOT dest_node->w_nodes IS INITIAL.
      DELETE TABLE p_nodes FROM dest_node.
*     copy W-children of dest_node to view
      CALL METHOD copy_w_brothers
        CHANGING
          w_nodes = dest_node->w_nodes
          c_nodes = c_nodes.
      CALL METHOD insert_c_nodes
        EXPORTING
          c_nodes = c_nodes
        EXCEPTIONS
          cntl_system_error = 1
          failed            = 2.
      CASE sy-subrc.
        WHEN 1. RAISE cntl_system_error.
        WHEN 2. RAISE failed.
      ENDCASE.
    ENDIF.

  ENDIF.

* unlink node from its parent
  CALL METHOD unlink_node_from_parent EXPORTING node = node.
  CALL METHOD unlink_node_from_parent2 EXPORTING node = node.

* link node to the destination node
  CALL METHOD add_node_int
    EXPORTING
      relationship      = relationship
      node              = node
      relative_node     = relative_node
      new_node          = ' '
      insert_in_update_structu = ' '
    EXCEPTIONS
      node_key_exists         = 1
      illegal_relationship    = 2
      relative_node_not_found = 3
      node_key_empty          = 4.
  IF sy-subrc <> 0.
    CALL METHOD internal_error.
  ENDIF.

* increase nr_of_children_in_view of DEST_NODE
  IF NOT dest_node IS INITIAL.
    ADD 1 TO dest_node->nr_of_children_in_view.
  ENDIF.

* move node in control

* convert RELATIONSHIP
  CASE relationship.
    WHEN relat_first_child.
      view_relatship = cl_tree_control_base=>relat_first_child.
    WHEN relat_first_sibling.
      view_relatship = cl_tree_control_base=>relat_first_sibling.
    WHEN relat_last_child.
      view_relatship = cl_tree_control_base=>relat_last_child.
    WHEN relat_last_sibling.
      view_relatship = cl_tree_control_base=>relat_last_sibling.
    WHEN relat_next_sibling.
      view_relatship = cl_tree_control_base=>relat_next_sibling.
    WHEN relat_prev_sibling.
      view_relatship = cl_tree_control_base=>relat_prev_sibling.
  ENDCASE.

  IF NOT relative_node IS INITIAL.
    relatkey = relative_node->view_key.
  ELSE.
    CLEAR relatkey.
  ENDIF.

  CALL METHOD base_tree_control->move_node
    EXPORTING
      node_key  = node->view_key
      relatkey  = relatkey
      relatship = view_relatship
    EXCEPTIONS
      failed = 1
      cntl_system_error = 2
      node_not_found = 3
      move_error = 4
      relative_not_found = 5
      illegal_relatship = 6
      parent_is_leaf = 7.
  CASE sy-subrc.
    WHEN 1. RAISE failed.
    WHEN 2. RAISE cntl_system_error.
    WHEN 3 OR 4 OR 5 OR 6 OR 7.
      CALL METHOD internal_error.
  ENDCASE.


ENDMETHOD.


METHOD MOVE_NODE_NODE_IN_DEST_OUT.

* update view
* This clears del_nodes, u_nodes, expand/collapse info, selection info.
* Reason: before deleting node in the control, node must be removed from
* from these tables!

  CALL METHOD update_view
    EXCEPTIONS
      control_not_existing     = 1
      control_dead             = 2
      cntl_system_error        = 3
      failed                   = 4.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
    WHEN 3. RAISE cntl_system_error.
    WHEN 4. RAISE failed.
  ENDCASE.

* delete node in the control
  CALL METHOD base_tree_control->delete_node
    EXPORTING
      node_key          = node->view_key
    EXCEPTIONS
      FAILED            = 1
      NODE_NOT_FOUND    = 2
      CNTL_SYSTEM_ERROR = 3.
  case sy-subrc.
    when 1. raise failed.
    when 2. call method internal_error.
    when 3. raise cntl_system_error.
  endcase.

* unlink node from its parent
  CALL METHOD unlink_node_from_parent EXPORTING node = node.
  CALL METHOD unlink_node_from_parent2 EXPORTING node = node.

* the subtree NODE ist no longer in view
* => remove view specific properties
  CALL METHOD remove_view_marks
    EXPORTING node = node.

* link node to the destination node
  CALL METHOD add_node_int
    EXPORTING
      relationship      = relationship
      node              = node
      relative_node     = relative_node
      new_node          = ' '
      insert_in_update_structu = 'X'
    EXCEPTIONS
      node_key_exists         = 1
      illegal_relationship    = 2
      relative_node_not_found = 3
      node_key_empty          = 4.
  IF sy-subrc <> 0.
    CALL METHOD internal_error.
  ENDIF.

ENDMETHOD.


method MOVE_NODE_NODE_OUT .

* unselect subtree NODE
  CALL METHOD me->unselect_tree
    EXPORTING
      node     = node
      collapse = ' '.

* unlink node from its parent
  CALL METHOD unlink_node_from_parent EXPORTING node = node.
  CALL METHOD unlink_node_from_parent2 EXPORTING node = node.

* link node to the destination node
  CALL METHOD add_node_int
    EXPORTING
      relationship      = relationship
      node              = node
      relative_node     = relative_node
      new_node          = ' '
      insert_in_update_structu = 'X'
    EXCEPTIONS
      node_key_exists         = 1
      illegal_relationship    = 2
      relative_node_not_found = 3
      node_key_empty          = 4.
  IF sy-subrc <> 0.
    CALL METHOD internal_error.
  ENDIF.

ENDMETHOD.


method NODE_GET_CHILDREN .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node,
        child_node TYPE REF TO cl_tree_model_node.

* get the node object
  READ TABLE long_key_to_object_map
    WITH TABLE KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

  CLEAR node_key_table.

  child_node = node->first_child.

  WHILE NOT child_node IS INITIAL.
    APPEND child_node->long_key TO node_key_table.
    child_node = child_node->next_sibling.
  ENDWHILE.


ENDMETHOD.


METHOD NODE_GET_FIRST_CHILD .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* get the node object
  READ TABLE long_key_to_object_map
    WITH TABLE KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

  IF node->first_child IS INITIAL.
    CLEAR child_node_key.
  ELSE.
    child_node_key = node->first_child->long_key.
  ENDIF.

ENDMETHOD.


method NODE_GET_LAST_CHILD .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* get the node object
  READ TABLE long_key_to_object_map
    WITH TABLE KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

  IF node->last_child IS INITIAL.
    CLEAR child_node_key.
  ELSE.
    child_node_key = node->last_child->long_key.
  ENDIF.

ENDMETHOD.


method NODE_GET_NEXT_SIBLING .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* get the node object
  READ TABLE long_key_to_object_map
    WITH TABLE KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

  IF node->next_sibling IS INITIAL.
    CLEAR sibling_node_key.
  ELSE.
    sibling_node_key = node->next_sibling->long_key.
  ENDIF.

ENDMETHOD.


method NODE_GET_NR_OF_CHILDREN .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* get the node object
  READ TABLE long_key_to_object_map
    WITH TABLE KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

  nr_of_children = node->nr_of_children.

ENDMETHOD.


method NODE_GET_PARENT .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* get the node object
  READ TABLE long_key_to_object_map
    WITH TABLE KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

  if node->parent is initial.
    clear parent_node_key.
  else.
    parent_node_key = node->parent->long_key.
  endif.

ENDMETHOD.


method NODE_GET_PREV_SIBLING .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* get the node object
  READ TABLE long_key_to_object_map
    WITH TABLE KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

  IF node->prev_sibling IS INITIAL.
    CLEAR sibling_node_key.
  ELSE.
    sibling_node_key = node->prev_sibling->long_key.
  ENDIF.

ENDMETHOD.


method NODE_GET_USER_OBJECT .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* get the node object
  READ TABLE long_key_to_object_map
    WITH TABLE KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

  user_object = node->user_object.

ENDMETHOD.


METHOD NODE_KEYS_IN_TREE .

  DATA: node_key TYPE tm_nodekey.

  clear node_keys_in_tree.
  clear node_keys_not_in_tree.

  LOOP AT node_key_table INTO node_key.
    READ TABLE long_key_to_object_map
      WITH TABLE KEY node_key = node_key
      TRANSPORTING NO FIELDS.
    IF sy-subrc = 0.
      APPEND node_key TO node_keys_in_tree.
    ELSE.
      APPEND node_key TO node_keys_not_in_tree.
    ENDIF.
  ENDLOOP.

ENDMETHOD.


METHOD NODE_KEY_IN_TREE .

  READ TABLE long_key_to_object_map
    WITH TABLE KEY node_key = node_key
    transporting no fields.
  IF sy-subrc = 0.
    key_in_tree = 'X'.
  ELSE.
    CLEAR key_in_tree.
  ENDIF.

ENDMETHOD.


METHOD NODE_SET_DISABLED.

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* get the node object
  READ TABLE long_key_to_object_map
    WITH TABLE KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

* change disabled property of the node
  node->disabled = disabled.

* a disabled node cannot be selected
  IF NOT disabled IS INITIAL.
    CALL METHOD remove_node_from_selection
      EXPORTING node = node.
  ENDIF.

* node must be updated if it is in the view
  IF NOT node->in_view IS INITIAL.
    CALL METHOD node_update_request
      EXPORTING
        view_key    = node->view_key
        update_node = 'X'.
  ENDIF.

ENDMETHOD.


method NODE_SET_DRAGDROPID .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* get the node object
  READ TABLE long_key_to_object_map
    WITH table KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

* change dragdropid property of the node
  node->drag_drop_id = dragdropid.

* node must be updated if it is in the view
  IF NOT node->in_view IS INITIAL.
    CALL METHOD node_update_request
      EXPORTING
        view_key    = node->view_key
        update_node = 'X'.
  ENDIF.

ENDMETHOD.


method NODE_SET_EXPANDED_IMAGE .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* get the node object
  READ TABLE long_key_to_object_map
    WITH table KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

* change expanded_image property of the node
  node->expanded_image = exp_image.

* node must be updated if it is in the view
  IF NOT node->in_view IS INITIAL.
    CALL METHOD node_update_request
      EXPORTING
        view_key    = node->view_key
        update_node = 'X'.
  ENDIF.

ENDMETHOD.


METHOD NODE_SET_EXPANDER .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* get the node object
  READ TABLE long_key_to_object_map
    WITH TABLE KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

* expander property can only set if node has no children
  IF node->nr_of_children <> 0.
    EXIT.
  ENDIF.

  CALL METHOD update_node_force_plus
    EXPORTING node = node
    force_plus = expander.

* node must be updated if it is in the view
  IF NOT node->in_view IS INITIAL.
    CALL METHOD node_update_request
      EXPORTING
        view_key    = node->view_key
        update_node = 'X'.
  ENDIF.

ENDMETHOD.


method NODE_SET_HIDDEN .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* get the node object
  READ TABLE long_key_to_object_map
    WITH table KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

* change hidden property of the node
  node->hidden = hidden.

* a hidden node cannot be selected
  IF NOT hidden IS INITIAL.
    CALL METHOD remove_node_from_selection
      EXPORTING node = node.
  ENDIF.

* node must be updated if it is in the view
  IF NOT node->in_view IS INITIAL.
    CALL METHOD node_update_request
      EXPORTING
        view_key    = node->view_key
        update_node = 'X'.
  ENDIF.

ENDMETHOD.


method NODE_SET_IMAGE .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* get the node object
  READ TABLE long_key_to_object_map
    WITH table KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

* change image property of the node
  node->image = image.

* node must be updated if it is in the view
  IF NOT node->in_view IS INITIAL.
    CALL METHOD node_update_request
      EXPORTING
        view_key    = node->view_key
        update_node = 'X'.
  ENDIF.

ENDMETHOD.


METHOD NODE_SET_IS_FOLDER .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* get the node object
  READ TABLE long_key_to_object_map
    WITH table KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

* a node with children cannot become a leaf
  IF ( is_folder IS INITIAL ) AND ( node->nr_of_children > 0 ).
    RAISE node_has_children.
  ENDIF.

* change disabled property of the node
  node->isfolder = is_folder.

* node must be updated if it is in the view
  IF NOT node->in_view IS INITIAL.
    CALL METHOD node_update_request
      EXPORTING
        view_key    = node->view_key
        update_node = 'X'.
  ENDIF.

ENDMETHOD.


method NODE_SET_NO_BRANCH .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* get the node object
  READ TABLE long_key_to_object_map
    WITH table KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

* change no_branch property of the node
  node->no_branch = no_branch.

* node must be updated if it is in the view
  IF NOT node->in_view IS INITIAL.
    CALL METHOD node_update_request
      EXPORTING
        view_key    = node->view_key
        update_node = 'X'.
  ENDIF.

ENDMETHOD.


method NODE_SET_STYLE .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* get the node object
  READ TABLE long_key_to_object_map
    WITH table KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

* change style property of the node
  node->style = style.

* node must be updated if it is in the view
  IF NOT node->in_view IS INITIAL.
    CALL METHOD node_update_request
      EXPORTING
        view_key    = node->view_key
        update_node = 'X'.
  ENDIF.

ENDMETHOD.


method NODE_SET_USER_OBJECT .

  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* NOTE: changing user object does not change view

* get the node object
  READ TABLE long_key_to_object_map
    WITH table KEY node_key = node_key
    INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.
  node = long_key_to_object_map_entry-node.

* change user_object property of the node
  node->user_object = user_object.

ENDMETHOD.


METHOD NODE_UPDATE_REQUEST.

  FIELD-SYMBOLS: <u_node> TYPE treem_u_node.
  DATA: u_node TYPE treem_u_node.

  IF update_node IS INITIAL AND update_data IS INITIAL.
    CALL METHOD internal_error.
  ENDIF.

  READ TABLE u_nodes
    WITH TABLE KEY node_key = view_key
    ASSIGNING <u_node>.
  IF sy-subrc <> 0.
*   node is not in u_nodes
    u_node-node_key = view_key.
    u_node-update_node = update_node.
    u_node-update_data = update_data.
    INSERT u_node INTO TABLE u_nodes.
  ELSE.
*   u_node is already in u_nodes
    IF NOT update_node IS INITIAL.
      <u_node>-update_node = 'X'.
    ENDIF.
    IF NOT update_data IS INITIAL.
      <u_node>-update_data = 'X'.
    ENDIF.
  ENDIF.

ENDMETHOD.






















METHOD PRINT_TREE .
  DATA: node_key_table TYPE treemnotab,
        nr_of_rows TYPE i,
        nr_of_columns TYPE i,
        length type i.

  CLEAR print_info.

* setup print_info
  print_info-all_nodes = all_nodes.
  print_info-title = title.

  IF all_nodes IS INITIAL.
* get the keys of the expanded nodes from the control
* and put them into the hash table EXPANDED_NODES
    CALL METHOD me->get_expanded_nodes
      importing
        node_key_table       = node_key_table
      EXCEPTIONS
        control_not_existing = 1
        control_dead         = 2
        cntl_system_error    = 3
        failed               = 4.
    CASE sy-subrc.
      WHEN 1. RAISE control_not_existing.
      WHEN 2. RAISE control_dead.
      WHEN 3. RAISE cntl_system_error.
      WHEN 4. RAISE failed.
    ENDCASE.
    print_info-expanded_nodes = node_key_table.
  ENDIF.

* calc initial print layout
  CALL METHOD me->calc_initial_print_layout
    EXPORTING
      all_nodes      = all_nodes
      expanded_nodes = print_info-expanded_nodes
    IMPORTING
      nr_of_rows     = nr_of_rows
      nr_of_columns  = nr_of_columns.

* add title to initial print layout
  if not title is initial.
    add 2 to nr_of_rows.
    length = strlen( title ).
    if length > nr_of_columns.
      nr_of_columns = length.
    endif.
  endif.


  CALL FUNCTION 'TREEM_PRINT'
       EXPORTING
            preview       = preview
            tree_model    = me
            nr_of_rows    = nr_of_rows
            nr_of_columns = nr_of_columns
            print_callback = print_callback.


ENDMETHOD.


method PRINT_TREE_EX .

  FORMAT INTENSIFIED OFF COLOR = print_default_color.

  if not print_info-title is initial.
    write print_info-title color = print_title_color.
    write /.
  endif.

  call method print_tree_header.

*  FORMAT INTENSIFIED OFF COLOR = 1.

  CALL METHOD me->print_tree_int
    EXPORTING
      all_nodes      = print_info-all_nodes
      expanded_nodes = print_info-expanded_nodes.

endmethod.


method PRINT_TREE_HEADER.
* ...
endmethod.


METHOD PRINT_TREE_INT .
  CONSTANTS: hs_spacing TYPE i VALUE 0," hierarchy symbol spacing
             fl_spacing TYPE i VALUE 0." folder/leaf symbol spacing

  INCLUDE <symbol>.
  DATA: node TYPE REF TO cl_tree_model_node,
        child_node TYPE REF TO cl_tree_model_node,
        stack TYPE STANDARD TABLE OF treemnref,
        node_key_table TYPE treemnotab,
        process_children TYPE as4flag,
        pos TYPE i,
        length TYPE i,
        icon TYPE icon_d,
        data_pos TYPE i,
        print_icon TYPE as4flag,
        image TYPE tv_image.

* put root nodes on stack
  node = last_root_node.
  WHILE NOT node IS INITIAL.
    IF node->hidden IS INITIAL.
      INSERT node INTO stack INDEX 1.
      node->level = 0.
    ENDIF.
    node = node->prev_sibling.
  ENDWHILE.

  nr_of_visible_nodes = 0.
* process stack
  WHILE NOT stack IS INITIAL.
    READ TABLE stack INTO node INDEX 1.
*   remove node from stack
    DELETE stack INDEX 1.
*   put children of node on stack
    CLEAR process_children.
    IF all_nodes IS INITIAL.
*     process children if node is an expanded folder
      IF NOT node->isfolder IS INITIAL.
        READ TABLE expanded_nodes
          FROM node->long_key TRANSPORTING NO FIELDS.
        IF sy-subrc = 0.
          process_children = 'X'.
        ENDIF.
      ENDIF.
    ELSE.
      process_children = 'X'.
    ENDIF.
    IF NOT process_children IS INITIAL.
      child_node = node->last_child.
      WHILE NOT child_node IS INITIAL.
        IF child_node->hidden IS INITIAL.
          INSERT child_node INTO stack INDEX 1.
          child_node->level = node->level + 1.
        ENDIF.
        child_node = child_node->prev_sibling.
      ENDWHILE.
    ENDIF.
*   set start position for output
    pos = node->level * 2 + 1.
    IF no_output IS INITIAL.
      WRITE: AT /pos '' NO-GAP.
      POSITION pos.
    ENDIF.
*   hierarchy symbol
    IF node->nr_of_children > 0.
      IF process_children IS INITIAL.
        IF no_output IS INITIAL.
          WRITE AT (1) sym_right_triangle AS SYMBOL NO-GAP.
        ENDIF.
        pos = pos + 1.
      ELSE.
        IF no_output IS INITIAL.
          WRITE AT (1) sym_down_triangle AS SYMBOL NO-GAP.
        ENDIF.
        pos = pos + 1.
      ENDIF.
    ELSE.
      IF node->force_plus IS INITIAL.
        IF no_output IS INITIAL.
          WRITE ' ' NO-GAP.
        ENDIF.
        pos = pos + 1.
      ELSE.
        IF no_output IS INITIAL.
          WRITE AT (1) sym_right_triangle AS SYMBOL NO-GAP.
        ENDIF.
        pos = pos + 1.
      ENDIF.
    ENDIF.
*   spacing behind hierarchy symbol
    IF no_output IS INITIAL.
      DO hs_spacing TIMES.
        WRITE ' ' NO-GAP.
      ENDDO.
    ENDIF.
    pos = pos + hs_spacing.
*   setup folder leaf symbol
    CLEAR print_icon.
    IF node->isfolder IS INITIAL.
      IF node->image IS INITIAL.
        IF no_output IS INITIAL.
          WRITE AT (2) sym_document AS SYMBOL NO-GAP.
        ENDIF.
        pos = pos + 2.
      ELSE.
        print_icon = 'X'.
      ENDIF.
    ELSE.
      IF node->image IS INITIAL.
        IF no_output IS INITIAL.
          WRITE AT (2) sym_folder AS SYMBOL NO-GAP.
        ENDIF.
        pos = pos + 2.
      ELSE.
        print_icon = 'X'.
      ENDIF.
    ENDIF.
    IF NOT print_icon IS INITIAL.
      image = node->image.
      TRANSLATE image TO UPPER CASE. "#EC SYNTCHAR
      IF image = 'BNONE'.
        length = 0.
      ELSE.
        length = get_icon_length( icon_id = node->image ).
        IF length > 0.
          icon = node->image.
          IF no_output IS INITIAL.
            WRITE AT (length) icon AS ICON NO-GAP.
          ENDIF.
        ELSE.
*         unknown icon => write two blanks
          length = 2.
          IF no_output IS INITIAL.
            WRITE '  ' NO-GAP.
          ENDIF.
        ENDIF.
      ENDIF.
      pos = pos + length.
    ENDIF.
*   spacing behind folder / leaf symbol
    IF no_output IS INITIAL.
      DO fl_spacing TIMES.
        WRITE ' ' NO-GAP.
      ENDDO.
    ENDIF.
    pos = pos + fl_spacing.

    IF no_output IS INITIAL.
      CALL METHOD me->print_tree_node_ex
        EXPORTING
          node        = node
          pos         = pos.
    ELSE.
      CALL METHOD add_node_extension_to_layout
        EXPORTING
          node        = node
          pos         = pos.
    ENDIF.
    ADD 1 TO nr_of_visible_nodes.
  ENDWHILE.

ENDMETHOD.


method PRINT_TREE_NODE_EX .

endmethod.


method PROCESS_FIND_STACK.
  field-symbols: <item> type treemiitem.
  DATA: node TYPE REF TO cl_tree_model_node,
        child_node TYPE REF TO cl_tree_model_node,
        node_key TYPE tm_nodekey,
        long_key_to_object_map_entry TYPE treem_long_key_to_object,
        exit_method TYPE as4flag,
        simple_tree_node TYPE REF TO cl_simple_tree_model_node,
        item_tree_node TYPE REF TO cl_item_tree_model_node,
        item_key type treemikey,
        search_all_items type as4flag,
        item_name type tv_itmname,
        item_found type as4flag.


  result_type = find_no_match.

* process stack
  WHILE NOT find_stack IS INITIAL.
    READ TABLE find_stack INTO node_key INDEX 1.
*   get the node object
    READ TABLE long_key_to_object_map
      WITH TABLE KEY node_key = node_key
      INTO long_key_to_object_map_entry.
    IF sy-subrc <> 0.
      if not ignore_not_existing_nodes is initial.
        delete find_stack index 1.
        continue.
      else.
        CALL METHOD internal_error.
      endif.
    ENDIF.
    node = long_key_to_object_map_entry-node.
*   check if node has FORCE_PLUS Property
    IF ( NOT find_stop_at_expander_node IS INITIAL )
      AND ( NOT node->force_plus IS INITIAL )
      and ( node->long_key <> find_ignore_expander_node_key ).
      find_ignore_expander_node_key = node->long_key.
      result_type = find_expander_node_hit.
      result_node_key = node->long_key.
      exit_method = 'X'.
      EXIT.
    ENDIF.
*   remove node from stack
    DELETE find_stack INDEX 1.
*   put children of node on stack
    child_node = node->last_child.
    WHILE NOT child_node IS INITIAL.
      INSERT child_node->long_key INTO find_stack INDEX 1.
      child_node = child_node->prev_sibling.
    ENDWHILE.
*   node is a simple tree node or an item tree node...
    CATCH SYSTEM-EXCEPTIONS move_cast_error = 1.
      simple_tree_node ?= node.
    endcatch.
    if sy-subrc = 1.
      clear simple_tree_node.
      item_tree_node ?= node.
    endif.

    if not simple_tree_node is initial.
*   simple tree: node->text contains search_string?
    IF ( ( find_pattern_search IS INITIAL )
         AND ( simple_tree_node->text CS find_search_string ) )
      OR ( ( NOT find_pattern_search IS INITIAL )
            AND ( simple_tree_node->text CP find_search_string ) ).
      result_type = find_match.
      if find_all is initial.
        result_node_key = node->long_key.
        exit_method = 'X'.
        EXIT.
      else.
        append node->long_key to result_node_key_table.
      endif.
    ENDIF.
    else.
*     item tree: items of the node contain search string?
      clear item_found.
      if find_item_name_table is initial.
        loop at item_tree_node->items assigning <item>.
          IF ( ( find_pattern_search IS INITIAL )
            AND ( <item>-text CS find_search_string ) )
            OR ( ( NOT find_pattern_search IS INITIAL )
            AND ( <item>-text CP find_search_string ) ).
            item_found = 'X'.
            item_key-node_key = node->long_key.
            item_key-item_name = <item>-item_name.
            append item_key to result_item_key_table.
          endif.
        endloop.
      else.
        loop at find_item_name_table into item_name.
          read table item_tree_node->items
            with table key item_name = item_name
            assigning <item>.
          if sy-subrc = 0.
            IF ( ( find_pattern_search IS INITIAL )
              AND ( <item>-text CS find_search_string ) )
              OR ( ( NOT find_pattern_search IS INITIAL )
              AND ( <item>-text CP find_search_string ) ).
              item_found = 'X'.
              item_key-node_key = node->long_key.
              item_key-item_name = <item>-item_name.
              append item_key to result_item_key_table.
            endif.
          endif.
        endloop.
      endif.
      if not item_found is initial.
        result_type = find_match.
        if find_all is initial.
          exit_method = 'X'.
          EXIT.
        endif.
      endif.
    endif.
  ENDWHILE.

* check for exit-request
  IF NOT exit_method IS INITIAL.
  ENDIF.

endmethod.


method REMOVE_ALL_KEY_STROKES.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  keystrokes_changed = 'X'.
  clear keystrokes.

endmethod.


method REMOVE_NODE_FROM_SELECTION.

  IF node = delta_selection-node_to_select.
    CLEAR delta_selection-node_to_select.
  ENDIF.
  IF node = delta_selection-derived_class_selection.
    CLEAR delta_selection-derived_class_selection.
  ENDIF.
  DELETE TABLE delta_selection-nodes_to_select FROM node.

endmethod.


method REMOVE_VIEW_MARKS .

  DATA: child TYPE REF TO cl_tree_model_node.

  clear node->in_view.
  node->nr_of_children_in_view = 0.
  clear node->w_nodes.
  clear node->expander.

* P_NODES
  DELETE TABLE p_nodes FROM node.

* mod_p_nodes
  DELETE TABLE mod_p_nodes FROM node.

* view marks of node data
  CALL METHOD remove_view_marks_of_node_data
    EXPORTING
      base_node   = node.

* preocess children
  child = node->first_child.
  WHILE NOT child IS INITIAL.
    CALL METHOD REMOVE_VIEW_MARKS
      EXPORTING node = child.
    child = child->next_sibling.
  ENDWHILE.
ENDMETHOD.

























method REMOVE_VIEW_MARKS_OF_NODE_DATA .


ENDMETHOD.

























METHOD SAVE_EXPAND_ALL_NODES.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  CALL METHOD collapse_all_nodes.

  CALL METHOD me->save_expand_all_nodes_int
       IMPORTING
            all_nodes_expanded = all_nodes_expanded.

ENDMETHOD.


METHOD SAVE_EXPAND_ALL_NODES_INT .

  DATA: queue TYPE treemnrfs2,
        new_nodes TYPE i,
        max_new_nodes TYPE i,
        node TYPE REF TO cl_tree_model_node,
        max_new_nodes_reached TYPE as4flag,
        start_node TYPE REF TO cl_tree_model_node,
        node_only TYPE as4flag.

  IF subtree_root IS INITIAL.
*   init queue with all root nodes
    CLEAR node_only.
    start_node = first_root_node.
  ELSE.
*   init queue with subtree_root
    node_only = 'X'.
    start_node = subtree_root.
  ENDIF.

* max. number of nodes to be copied to the control
  max_new_nodes = get_max_node_copy_count( ) * 10.
* init queue
  CALL METHOD me->add_nodes_to_queue
    EXPORTING
      node                  = start_node
      max_new_nodes         = max_new_nodes
      node_only             = node_only
    CHANGING
      queue                 = queue
      new_nodes             = new_nodes
      max_new_nodes_reached = max_new_nodes_reached.

* process queue
  WHILE NOT queue IS INITIAL.
*   remove first element from the queue
    READ TABLE queue INTO node INDEX 1.
    DELETE queue INDEX 1.
*   expand the node
    CALL METHOD expand_node_int EXPORTING node = node.
*   add child folders of node to queue
    IF max_new_nodes_reached IS INITIAL.
      CALL METHOD me->add_nodes_to_queue
        EXPORTING
          node                  = node->first_child
          max_new_nodes         = max_new_nodes
          node_only             = ' '
        CHANGING
          queue                 = queue
          new_nodes             = new_nodes
          max_new_nodes_reached = max_new_nodes_reached.
    ENDIF.
  ENDWHILE.

  IF max_new_nodes_reached IS INITIAL.
    all_nodes_expanded = 'X'.
  ELSE.
    CLEAR all_nodes_expanded.
  ENDIF.
ENDMETHOD.


METHOD SAVE_EXPAND_SUBTREE .
  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  READ TABLE long_key_to_object_map
    WITH TABLE KEY node_key = node_key
      INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.

  node = long_key_to_object_map_entry-node.

* expand the predecessors of the node
  CALL METHOD expand_predecessors
    EXPORTING node = node.

* check if node has children
  IF node->nr_of_children = 0.
    EXIT.
  ENDIF.

  CALL METHOD me->save_expand_all_nodes_int
       EXPORTING
            subtree_root       = node
       IMPORTING
            all_nodes_expanded = all_nodes_expanded.

ENDMETHOD.


METHOD SCROLL .
  DATA: view_scroll_command TYPE i.

* check control
  CALL METHOD check_control
    EXCEPTIONS
      control_not_existing = 1
      control_dead = 2.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
  ENDCASE.

* check and convert scroll command
  CASE scroll_command.
    WHEN scroll_up_line.
      view_scroll_command = cl_tree_control_base=>scroll_up_line.
    WHEN scroll_down_line.
      view_scroll_command = cl_tree_control_base=>scroll_down_line.
    WHEN scroll_up_page.
      view_scroll_command = cl_tree_control_base=>scroll_up_page.
    WHEN scroll_down_page.
      view_scroll_command = cl_tree_control_base=>scroll_down_page.
    WHEN scroll_home.
      view_scroll_command = cl_tree_control_base=>scroll_home.
    WHEN scroll_end.
      view_scroll_command = cl_tree_control_base=>scroll_end.
    WHEN OTHERS.
      RAISE illegal_scroll_command.
  ENDCASE.


* update view
  CALL METHOD update_view
    EXCEPTIONS
      control_not_existing     = 1
      control_dead             = 2
      cntl_system_error        = 3
      failed                   = 4.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
    WHEN 3. RAISE cntl_system_error.
    WHEN 4. RAISE failed.
  ENDCASE.

* call insure_visible of control
  CALL METHOD base_tree_control->scroll
    EXPORTING
      scroll_command = view_scroll_command
    EXCEPTIONS
      failed                     = 1
      cntl_system_error          = 2
      illegal_scroll_command     = 3.
  CASE sy-subrc.
    WHEN 1. RAISE failed.
    WHEN 2. RAISE cntl_system_error.
    WHEN 3. CALL METHOD internal_error.
  ENDCASE.

ENDMETHOD.


METHOD SELECT_NODES.
  DATA: node_key TYPE tm_nodekey,
        long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* check node selection mode
  IF node_selection_mode <> node_sel_mode_multiple.
    RAISE multiple_node_selection_only.
  ENDIF.

* nodes are selected => remove other selection requests
  CLEAR delta_selection-derived_class_selection.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  LOOP AT node_key_table INTO node_key.
    " get the node object
    READ TABLE long_key_to_object_map
      WITH table KEY node_key = node_key
      INTO long_key_to_object_map_entry.
    IF sy-subrc <> 0.
      CALL METHOD handle_error_in_table
        EXPORTING
          method     = 'SELECT_NODES'
          table_name = 'NODE_KEY_TABLE'
          text_id    = 1
          node_key   = node_key.
      RAISE error_in_node_key_table.
    ENDIF.
    node = long_key_to_object_map_entry-node.
    IF node->disabled IS INITIAL.
      " expand predecessors of node
      CALL METHOD expand_predecessors
        EXPORTING node = node.
      " remove node from table nodes_to_unselect
      DELETE TABLE delta_selection-nodes_to_unselect FROM node.
      " select the node
      READ TABLE delta_selection-nodes_to_select FROM node
        TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        INSERT node INTO TABLE delta_selection-nodes_to_select.
      ENDIF.
    ENDIF.
  ENDLOOP.

ENDMETHOD.


METHOD SET_CHANGED_FLAG.

  changed = 'X'.

  IF ( flush_notify_disabled IS INITIAL ) AND
    ( NOT base_tree_control IS INITIAL ) AND
    ( base_tree_control->is_alive( ) <> cl_gui_control=>state_dead ).
*   control exists and is alive!
    CALL METHOD cl_gui_cfw=>register_flush_notify
      EXPORTING
        ref                = me
      EXCEPTIONS
        wrong_system_state = 1
        already_registered = 2
        OTHERS             = 3.
    CASE sy-subrc.
      WHEN 1 OR 3.
        CALL METHOD internal_error.
      WHEN 2.
*       Note: This can happen on the follwing sequence:
*         1) Tree Model Methods are called
*         2) update view is called manually
*         3) Tree Model Methods are called: Now the changed flag
*            is set again and this register_flush_notify called again!
    ENDCASE.
  ENDIF.


ENDMETHOD.


method SET_CTX_MENU_SELECT_EVENT_APPL.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  base_properties-ctx_menu_select_event_appl_cha = 'X'.

  base_properties-ctx_menu_select_event_appl = appl_event.

endmethod.


method SET_DEFAULT_DROP.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  base_properties-default_drop_changed = 'X'.

  base_properties-default_drop = drag_drop.

endmethod.


method SET_DISABLE_SEL_CHANGE_CTX_MEN.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  base_properties-DISABLE_SEL_CHANGE_CTX_MEN_CHD = 'X'.

  base_properties-DISABLE_SEL_CHANGE_CTX_MEN =
    DISABLE_SEL_CHANGE_CTX_MEN.

endmethod.


METHOD SET_EVENT_HANDLERS .
  SET HANDLER handle_expand_no_children FOR base_tree_control.
  SET HANDLER handle_node_double_click FOR base_tree_control.
  SET HANDLER handle_selection_changed FOR base_tree_control.
  SET HANDLER handle_node_keypress FOR base_tree_control.
  SET HANDLER handle_node_context_menu_req FOR base_tree_control.
  SET HANDLER handle_node_context_menu_sel FOR base_tree_control.
  SET HANDLER handle_default_context_menu_re FOR base_tree_control.
  SET HANDLER handle_default_context_menu_se FOR base_tree_control.
  SET HANDLER handle_drop FOR base_tree_control.
  SET HANDLER handle_drop_get_flavor FOR base_tree_control.


ENDMETHOD.























METHOD SET_FOLDER_SHOW_EXP_IMAGE .

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  base_properties-folder_show_exp_image_changed = 'X'.

  base_properties-folder_show_exp_image = folder_show_exp_image.

ENDMETHOD.


METHOD SET_HAS_3D_FRAME .

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  base_properties-has_3d_frame_changed = 'X'.

  base_properties-has_3d_frame = has_3d_frame.

ENDMETHOD.


METHOD SET_ROOT_NODE .

  DATA: root_node_key TYPE tm_nodekey.

* check node_key
  IF get_node_by_long_key( long_key = node_key ) IS INITIAL.
    raise node_not_found.
  endif.

* undo last set_root_node call
  CALL METHOD me->unset_root_node
    EXCEPTIONS
      unset_not_possible   = 1
      control_not_existing = 2
      control_dead         = 3
      failed               = 4
      cntl_system_error    = 5.
  CASE sy-subrc.
    WHEN 1. RAISE unset_not_possible.
    WHEN 2. RAISE control_not_existing.
    WHEN 3. RAISE control_dead.
    WHEN 4. RAISE failed.
    WHEN 5. RAISE cntl_system_error.
  ENDCASE.

* store position of focus node
* focus_node
  focus-node = node_key.
* focus_parent_node
  CALL METHOD me->node_get_parent
    EXPORTING
      node_key        = node_key
     IMPORTING
       parent_node_key = focus-parent_node
     EXCEPTIONS
       node_not_found  = 1
       OTHERS          = 2.
  IF sy-subrc <> 0.
    CALL METHOD internal_error.
  ENDIF.
* focus_prev_sibling_node
  CALL METHOD me->node_get_prev_sibling
    EXPORTING
      node_key         = node_key
     IMPORTING
       sibling_node_key = focus-prev_sibling_node
     EXCEPTIONS
       node_not_found   = 1
       OTHERS           = 2.
  IF sy-subrc <> 0.
    CALL METHOD internal_error.
  ENDIF.

* move node with key NODE_KEY to first root node
  CALL METHOD move_node
    EXPORTING
      node_key                = node_key
      relative_node_key       = ''
      relationship            = cl_tree_model=>relat_first_sibling
     EXCEPTIONS
       control_not_existing    = 1
       control_dead            = 2
       failed                  = 3
       cntl_system_error       = 4
       node_not_found          = 5
       move_error              = 6
       relative_node_not_found = 7
       illegal_relationship    = 8
       OTHERS                  = 9.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
    WHEN 3. RAISE failed.
    WHEN 4. RAISE cntl_system_error.
    WHEN 5 or 6 OR 7 OR 8 OR 9. CALL METHOD internal_error.
  ENDCASE.

* hide other root nodes
  root_node_key = get_first_root_node( ).
  WHILE NOT root_node_key IS INITIAL.
    IF root_node_key <> node_key.
*     hide root node
      CALL METHOD me->node_set_hidden
        EXPORTING
          node_key       = root_node_key
          hidden         = 'X'
        EXCEPTIONS
          node_not_found = 1
          OTHERS         = 2.
      IF sy-subrc <> 0.
        CALL METHOD internal_error.
      ENDIF.
    ENDIF.
*   get next root node
    CALL METHOD me->node_get_next_sibling
      EXPORTING
        node_key         = root_node_key
      IMPORTING
        sibling_node_key = root_node_key
      EXCEPTIONS
        node_not_found   = 1
        OTHERS           = 2.
    IF sy-subrc <> 0.
      CALL METHOD internal_error.
    ENDIF.
  ENDWHILE.

ENDMETHOD.


METHOD SET_SELECTED_NODE.
  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* check node selection mode
  IF node_selection_mode <> node_sel_mode_single.
    RAISE single_node_selection_only.
  ENDIF.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* get the node object
  READ TABLE long_key_to_object_map
    WITH table KEY node_key = node_key
      INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.

  node = long_key_to_object_map_entry-node.

* exit if the node is disabled
  if not node->disabled is initial.
    exit.
  endif.

* expand predecessors of node
  call method EXPAND_PREDECESSORS
    exporting node = node.

* clear delta selection
  CALL METHOD unselect_all.

* select node
  delta_selection-node_to_select = node.

ENDMETHOD.


method SET_TOP_NODE .
  DATA: long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* get node object
  READ TABLE long_key_to_object_map
    WITH table KEY node_key = node_key
      INTO long_key_to_object_map_entry.
  IF sy-subrc <> 0.
    RAISE node_not_found.
  ENDIF.

  node = long_key_to_object_map_entry-node.

* check control
  CALL METHOD check_control
    EXCEPTIONS
      control_not_existing = 1
      control_dead = 2.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
  ENDCASE.

* expand the predecessors of the node
* if the node is not in the control
* => node will be copied to control
  IF node->in_view IS INITIAL.
    CALL METHOD expand_predecessors
      EXPORTING node = node.
  ENDIF.

* update view
  CALL METHOD update_view
    EXCEPTIONS
      control_not_existing     = 1
      control_dead             = 2
      cntl_system_error        = 3
      failed                   = 4.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
    WHEN 3. RAISE cntl_system_error.
    WHEN 4. RAISE failed.
  ENDCASE.

* call insure_visible of control
  CALL METHOD base_tree_control->set_top_node
    EXPORTING
      node_key = node->view_key
    EXCEPTIONS
      failed                     = 1
      cntl_system_error          = 2
      node_not_found             = 3.
  CASE sy-subrc.
    WHEN 1. RAISE failed.
    WHEN 2. RAISE cntl_system_error.
    WHEN 3. CALL METHOD internal_error.
  ENDCASE.

ENDMETHOD.


method SHOW_ERROR_DROP_COMPMU_NO_NODE .

    CALL FUNCTION 'POPUP_DISPLAY_TEXT'
         EXPORTING
*             LANGUAGE       = SY-LANGU
              popup_title    = ''
*             START_COLUMN   = 10
*             START_ROW      = 3
              text_object    = 'TREEM_DROP_COMPLETEM_NO_NODE'
*             HELP_MODAL     = 'X'
*        IMPORTING
*             CANCELLED      =
         EXCEPTIONS
              TEXT_NOT_FOUND = 1
              OTHERS         = 2.
    IF sy-subrc <> 0.
      call method internal_error.
    ENDIF.

endmethod.


method SHOW_ERROR_DROP_COMP_NO_NODE .

    CALL FUNCTION 'POPUP_DISPLAY_TEXT'
         EXPORTING
*             LANGUAGE       = SY-LANGU
              popup_title    = ''
*             START_COLUMN   = 10
*             START_ROW      = 3
              text_object    = 'TREEM_DROP_COMPLETE_NO_NODE'
*             HELP_MODAL     = 'X'
*        IMPORTING
*             CANCELLED      =
         EXCEPTIONS
              TEXT_NOT_FOUND = 1
              OTHERS         = 2.
    IF sy-subrc <> 0.
      call method internal_error.
    ENDIF.

endmethod.


method SHOW_ERROR_DROP_NO_NODE.

    CALL FUNCTION 'POPUP_DISPLAY_TEXT'
         EXPORTING
*             LANGUAGE       = SY-LANGU
              popup_title    = ''
*             START_COLUMN   = 10
*             START_ROW      = 3
              text_object    = 'TREEM_DROP_NO_NODE'
*             HELP_MODAL     = 'X'
*        IMPORTING
*             CANCELLED      =
         EXCEPTIONS
              TEXT_NOT_FOUND = 1
              OTHERS         = 2.
    IF sy-subrc <> 0.
      call method internal_error.
    ENDIF.

endmethod.


METHOD SIMPLE_TREE_ADD_NODES.
  DATA: node_object TYPE REF TO cl_simple_tree_model_node,
        node TYPE treemsnodt.
*        node_key type tm_nodekey,
*        relative_node_key type tm_nodekey.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

  LOOP AT node_table INTO node.
    CREATE OBJECT node_object.

    node_object->hidden          = node-hidden.
    node_object->disabled        = node-disabled.
    node_object->isfolder        = node-isfolder.
    node_object->style           = node-style.
    node_object->force_plus      = node-expander.
    node_object->no_branch       = node-no_branch.
    node_object->image           = node-n_image.
    node_object->expanded_image  = node-exp_image.
    node_object->text            = node-text.
    node_object->drag_drop_id    = node-dragdropid.
    node_object->user_object     = node-userobject.

* insert the node to the tree
    CALL METHOD add_node_int
      EXPORTING
        node_key          = node-node_key
        relative_node_key = node-relatkey
        relationship      = node-relatship
        node              = node_object
        new_node          = 'X'
        insert_in_update_structu = 'X'
      EXCEPTIONS
        node_key_exists         = 1
        illegal_relationship    = 2
        relative_node_not_found = 3
        node_key_empty          = 4.
    CASE sy-subrc.
      WHEN 1.
        CALL METHOD handle_error_in_table
          EXPORTING
            method     = 'ADD_NODES'
            table_name = 'NODE_KEY_TABLE'
            text_id    = 2              " Schluessel des Knotens
            node_key   = node-node_key. " ist bereits vorhanden
        RAISE error_in_node_table.
      WHEN 2.
        CALL METHOD handle_error_in_table
          EXPORTING
            method     = 'ADD_NODES'
            table_name = 'NODE_KEY_TABLE'
            text_id    = 3    " Unzulaessiger Wert im Feld RELATSHIP
            node_key   = node-node_key.
        RAISE error_in_node_table.
      WHEN 3.
        CALL METHOD handle_error_in_table
          EXPORTING
            method     = 'ADD_NODES'
            table_name = 'NODE_KEY_TABLE'
            text_id    = 4              " Knoten mit Schluessel
            node_key   = node-node_key. " RELATKEY existiert nicht
        RAISE error_in_node_table.
      WHEN 4.
        CALL METHOD handle_error_in_table
          EXPORTING
            method     = 'ADD_NODES'
            table_name = 'NODE_KEY_TABLE'
            text_id    = 15             " node_key initial
            node_key   = node-node_key.      " or consists of blanks
        RAISE error_in_node_table.
    ENDCASE.
  ENDLOOP.

ENDMETHOD.


method UNLINK_NODE_FROM_PARENT .

  data: parent type ref to cl_tree_model_node.

*
* update the following properties of the parent node
* nr_of_children_in_view, expand, expander, w_nodes
*
* if the node is a root node that
* is not in the view, it must be removed from
* new_root_nodes
*
* if the parent node is a p_node and node
* is the only one child that is not in the view,
* the parent node must be removed from P_NODES (and MOD_P_NODES)

  parent = node->parent.

  if parent is initial.
* node is a root node
    if node->in_view is initial.
      delete table new_root_nodes from node.
    endif.
  else.
* node has a parent node
    " collapse parent if parent had only one child
    if ( parent->nr_of_children = 1 )
      and ( not parent->expand is initial ).
      call method collapse_node_int
        exporting node = parent.
    endif.
    if not node->in_view is initial.
      " node is in the view
      subtract 1 from parent->nr_of_children_in_view.
    endif.
    read table p_nodes from parent transporting no fields.
    if sy-subrc = 0.
      " parent is a P_NODE
      " parent must have an expander = 'X'
      " if it has only W_CHILDS now
      if ( parent->nr_of_children_in_view = 0 )
        and ( parent->nr_of_children > 1 )
        and ( parent->expander is initial ).
          PARENT->EXPANDER = 'X'.
          CALL METHOD NODE_UPDATE_REQUEST
            EXPORTING
              VIEW_KEY = PARENT->VIEW_KEY
              UPDATE_NODE = 'X'.
      elseif ( parent->nr_of_children = 1 )
        and ( parent->expander = 'X' ).
        " expander of parent must be removed
        " if parent has no children now
        PARENT->EXPANDER = ' '.
        CALL METHOD NODE_UPDATE_REQUEST
          EXPORTING
            VIEW_KEY = PARENT->VIEW_KEY
            UPDATE_NODE = 'X'.
      endif.
      if node->in_view is initial.
        delete table parent->w_nodes from node.
        if parent->w_nodes is initial.
          " parent has no more W_NODES =>
          " parent is no longer a P_NODE
          delete table p_nodes from parent.
          delete table mod_p_nodes from parent.
        endif.
      endif.
    else.
      " parent is no P_NODE
    endif.
  endif.

endmethod.


method UNLINK_NODE_FROM_PARENT2.

  data: parent type ref to cl_tree_model_node,
        next_node type ref to cl_tree_model_node,
        prev_node type ref to cl_tree_model_node.

* remove / reassign pointers from / to node
  parent = node->parent.

  if node->prev_sibling is initial.
    if node->next_sibling is initial.
      " no prev node, no next node
      if parent is initial.
        clear first_root_node.
        clear last_root_node.
      else.
        clear parent->first_child.
        clear parent->last_child.
      endif.
    else.
      " no prev node, next node
      next_node = node->next_sibling.
      if parent is initial.
        first_root_node = next_node.
      else.
        parent->first_child = next_node.
      endif.
      clear next_node->prev_sibling.
      clear node->next_sibling.
    endif.
  else.
    if node->next_sibling is initial.
      " prev node, no next node
      prev_node = node->prev_sibling.
      if parent is initial.
        last_root_node = prev_node.
      else.
        parent->last_child = prev_node.
      endif.
      clear prev_node->next_sibling.
      clear node->prev_sibling.
    else.
      " prev node, next node
      prev_node = node->prev_sibling.
      next_node = node->next_sibling.
      prev_node->next_sibling = next_node.
      next_node->prev_sibling = prev_node.
      clear node->prev_sibling.
      clear node->next_sibling.
    endif.
  endif.
  if not parent is initial.
    subtract 1 from parent->nr_of_children.
  else.
    subtract 1 from nr_of_root_nodes.
  endif.
  clear node->parent.

endmethod.


METHOD UNSELECT_ALL.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* remove additional selections
  CLEAR delta_selection-node_to_select.
  clear delta_selection-nodes_to_select.
  clear delta_selection-nodes_to_unselect.

  clear delta_selection-derived_class_selection.

* store unselect all request
  delta_selection-unselect_all = 'X'.

ENDMETHOD.


method UNSELECT_NODES .
  DATA: node_key TYPE tm_nodekey,
        long_key_to_object_map_entry TYPE treem_long_key_to_object,
        node TYPE REF TO cl_tree_model_node.

* check node selection mode
  IF node_selection_mode <> node_sel_mode_multiple.
    RAISE multiple_node_selection_only.
  ENDIF.

* set changed flag
  IF changed IS INITIAL.
    CALL METHOD set_changed_flag.
  ENDIF.

* nodes are unselected => remove other selection requests
  CLEAR delta_selection-derived_class_selection.

  LOOP AT node_key_table INTO node_key.
    " get the node object
    READ TABLE long_key_to_object_map
      WITH table KEY node_key = node_key
      INTO long_key_to_object_map_entry.
    IF sy-subrc <> 0.
      CALL METHOD handle_error_in_table
        EXPORTING
          method = 'UNSELECT_NODES'
          table_name = 'NODE_KEY_TABLE'
          text_id    = 1
          node_key   = node_key.
      RAISE error_in_node_key_table.
    ENDIF.
    node = long_key_to_object_map_entry-node.
    " remove the node from nodes_to_select
    delete table delta_selection-nodes_to_select FROM node.
    " insert node into table nodes_to_unselect
    READ TABLE delta_selection-nodes_to_unselect FROM node
      TRANSPORTING NO FIELDS.
    IF sy-subrc <> 0.
      INSERT node INTO TABLE delta_selection-nodes_to_unselect.
    ENDIF.
  ENDLOOP.

ENDMETHOD.


METHOD UNSELECT_TREE .

  DATA: child TYPE REF TO cl_tree_model_node.

* collapse the node
  IF NOT collapse IS INITIAL.
    CALL METHOD collapse_node_int EXPORTING node = node.
  ENDIF.

* remove node from selection requests
  CALL METHOD remove_node_from_selection
    EXPORTING node = node.

* unselect / collapse the children of the node
  child = node->first_child.
  WHILE NOT child IS INITIAL.
    CALL METHOD unselect_tree
      EXPORTING node = child collapse = collapse.
    child = child->next_sibling.
  ENDWHILE.
ENDMETHOD.

























METHOD UNSET_ROOT_NODE .
  DATA: relative_node TYPE tm_nodekey,
        relationship TYPE i,
        root_node_key TYPE tm_nodekey,
        focus_node type tm_nodekey,
        focus_parent_node type tm_nodekey,
        focus_prev_sibling_node type tm_nodekey.

* check if a focus was set
  IF focus-node IS INITIAL.
    EXIT.
  ENDIF.

* get focus information
  focus_node = focus-node.
  focus_parent_node = focus-parent_node.
  focus_prev_sibling_node = focus-prev_sibling_node.
  clear focus.

* check if focus node exists
  IF get_node_by_long_key( long_key = focus_node ) IS INITIAL.
    RAISE unset_not_possible.
  ENDIF.
  IF NOT focus_parent_node IS INITIAL.
*   check if parent node of focus node exists
    IF get_node_by_long_key( long_key = focus_parent_node )
      IS INITIAL.
      RAISE unset_not_possible.
    ENDIF.
  ENDIF.
  IF NOT focus_prev_sibling_node IS INITIAL.
*   check if the prev sibling of focus node exists
    IF get_node_by_long_key( long_key = focus_prev_sibling_node )
      IS INITIAL.
      RAISE unset_not_possible.
    ENDIF.
  ENDIF.
* set destination for move operation
  IF focus_prev_sibling_node IS INITIAL.
    IF focus_parent_node IS INITIAL.
      relationship = relat_first_child.
      CLEAR relative_node.
    ELSE.
      relationship = relat_first_child.
      relative_node = focus_parent_node.
    ENDIF.
  ELSE.
    relationship = relat_next_sibling.
    relative_node = focus_prev_sibling_node.
  ENDIF.

* move node
  CALL METHOD move_node
    EXPORTING
      node_key                = focus_node
      relative_node_key       = relative_node
      relationship            = relationship
     EXCEPTIONS
       control_not_existing    = 1
       control_dead            = 2
       failed                  = 3
       cntl_system_error       = 4
       node_not_found          = 5
       move_error              = 6
       relative_node_not_found = 7
       illegal_relationship    = 8
       OTHERS                  = 9.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
    WHEN 3. RAISE failed.
    WHEN 4. RAISE cntl_system_error.
    WHEN 5 OR 6 OR 7 OR 8 OR 9. CALL METHOD internal_error.
  ENDCASE.

* clear hidden flag of all root nodes
  root_node_key = get_first_root_node( ).
  WHILE NOT root_node_key IS INITIAL.
    CALL METHOD me->node_set_hidden
      EXPORTING
        node_key       = root_node_key
        hidden         = ' '
       EXCEPTIONS
         node_not_found = 1
         OTHERS         = 2.
    IF sy-subrc <> 0.
      CALL METHOD internal_error.
    ENDIF.
* get next root node
    CALL METHOD me->node_get_next_sibling
      EXPORTING
        node_key         = root_node_key
       IMPORTING
         sibling_node_key = root_node_key
       EXCEPTIONS
         node_not_found   = 1
         OTHERS           = 2.
    IF sy-subrc <> 0.
      CALL METHOD internal_error.
    ENDIF.
  ENDWHILE.

ENDMETHOD.


method UPDATE_BASE_PROPERTIES .
*    BEGIN OF base_properties_type,
*          keystrokes TYPE treem_integer_set,
*          keystrokes_changed TYPE as4flag,
*          default_drop TYPE REF TO cl_dragdrop,
*          default_drop_changed TYPE as4flag,
*          ctx_menu_select_event_appl TYPE as4flag,
*          ctx_menu_select_event_appl_cha TYPE as4flag,
*          folder_show_exp_image TYPE as4flag,
*          folder_show_exp_image_changed TYPE as4flag,
*          has_3d_frame TYPE as4flag,
*          has_3d_frame_changed TYPE as4flag,
*        END OF base_properties_type ,

* keystrokes
  call method update_key_strokes
    exceptions
      failed = 1
      cntl_system_error = 2.
  case sy-subrc.
    when 1. raise failed.
    when 2. raise cntl_system_error.
  endcase.
* style infos
  call method update_style_infos
    exceptions
      failed = 1
      cntl_system_error = 2.
  case sy-subrc.
    when 1. raise failed.
    when 2. raise cntl_system_error.
  endcase.

* default drop
  if not base_properties-default_drop_changed is initial.
    clear base_properties-default_drop_changed.
    call method base_tree_control->SET_DEFAULT_DROP
      exporting
        DRAG_DROP = base_properties-default_drop
      exceptions
        FAILED                = 1
        CNTL_SYSTEM_ERROR     = 2
        INVALID_DRAG_DROP_OBJ = 3.
    case sy-subrc.
      when 1. raise failed.
      when 2. raise cntl_system_error.
      when 3.
    endcase.
  endif.

* ctx_menu_select_event_appl
  if not base_properties-ctx_menu_select_event_appl_cha is initial.
    clear base_properties-ctx_menu_select_event_appl_cha.
    call method base_tree_control->set_ctx_menu_select_event_appl
      exporting
        APPL_EVENT = base_properties-ctx_menu_select_event_appl.
  endif.

* folder_show_exp_image
  if not base_properties-folder_show_exp_image_changed is initial.
    clear base_properties-folder_show_exp_image_changed.
    call method base_tree_control->SET_FOLDER_SHOW_EXP_IMAGE
      exporting
        FOLDER_SHOW_EXP_IMAGE = base_properties-FOLDER_SHOW_EXP_IMAGE
      exceptions
        FAILED                = 1
        CNTL_SYSTEM_ERROR     = 2.
    case sy-subrc.
      when 1. raise failed.
      when 2. raise cntl_system_error.
    endcase.
  endif.

* has_3d_frame
  if not base_properties-has_3d_frame_changed is initial.
    clear base_properties-has_3d_frame_changed.
    call method base_tree_control->SET_HAS_3D_FRAME
      exporting
        has_3d_frame = base_properties-has_3d_frame
      exceptions
        FAILED                = 1
        CNTL_SYSTEM_ERROR     = 2.
    case sy-subrc.
      when 1. raise failed.
      when 2. raise cntl_system_error.
    endcase.
  endif.

* has_3d_frame
  if not base_properties-DISABLE_SEL_CHANGE_CTX_MEN_CHD is initial.
    clear base_properties-DISABLE_SEL_CHANGE_CTX_MEN_CHD.
    call method base_tree_control->SET_DISABLE_SEL_CHANGE_CTX_MEN
      exporting
        DISABLE_SEL_CHANGE_CTX_MEN =
          base_properties-DISABLE_SEL_CHANGE_CTX_MEN
      exceptions
        FAILED                = 1
        CNTL_SYSTEM_ERROR     = 2.
    case sy-subrc.
      when 1. raise failed.
      when 2. raise cntl_system_error.
    endcase.
  endif.


ENDMETHOD.


METHOD UPDATE_KEY_STROKES.
  DATA: key TYPE i,
        view_key TYPE i.

  IF NOT keystrokes_changed IS INITIAL.
    CLEAR keystrokes_changed.
    " remove all keystrokes in control
    CALL METHOD base_tree_control->remove_all_key_strokes
      EXCEPTIONS
        failed            = 1
        cntl_system_error = 2.
    CASE sy-subrc.
      WHEN 1. RAISE failed.
      WHEN 2. RAISE cntl_system_error.
    ENDCASE.
    " set the current key strokes
    LOOP AT keystrokes INTO key.
      CASE key.
        WHEN key_f1. view_key = cl_tree_control_base=>key_f1.
        WHEN key_f4. view_key = cl_tree_control_base=>key_f4.
        WHEN key_insert. view_key = cl_tree_control_base=>key_insert.
        WHEN key_delete. view_key = cl_tree_control_base=>key_delete.
        WHEN key_enter. view_key = cl_tree_control_base=>key_enter.
        WHEN key_cut. view_key = cl_tree_control_base=>key_cut.
        WHEN key_copy. view_key = cl_tree_control_base=>key_copy.
        WHEN key_paste. view_key = cl_tree_control_base=>key_paste.
        WHEN OTHERS. CALL METHOD internal_error.
      ENDCASE.
      CALL METHOD base_tree_control->add_key_stroke
        EXPORTING
          key = view_key
        EXCEPTIONS
          failed            = 1
          illegal_key       = 2
          cntl_system_error = 3.
      CASE sy-subrc.
        WHEN 1. RAISE failed.
        WHEN 2. CALL METHOD internal_error.
        WHEN 3. RAISE cntl_system_error.
      ENDCASE.
    ENDLOOP.
  ENDIF.

ENDMETHOD.


























method UPDATE_NODE_FORCE_PLUS.

* force_plus property can only set if node has no children
  if node->nr_of_children <> 0.
    exit.
  endif.

* change force_plus property of the node
  node->force_plus = force_plus.

* convert node to folder if node is a leaf
  IF ( node->isfolder IS INITIAL )
    and ( not force_plus is initial ).
    node->isfolder = 'X'.
  ENDIF.

* EXPANDER Property of node must be updated if node is in view
  IF NOT node->in_view IS INITIAL.
    node->expander = force_plus.
  ENDIF.

endmethod.


method UPDATE_REGISTERED_EVENTS.
* ...
endmethod.


METHOD UPDATE_SELECTION.
  DATA: view_keys TYPE treev_nks.

* unselect all request
  IF NOT delta_selection-unselect_all IS INITIAL.
    CALL METHOD base_tree_control->unselect_all
      EXCEPTIONS
        failed            = 1
        cntl_system_error = 2.
    CASE sy-subrc.
      WHEN 1. RAISE failed.
      WHEN 2. RAISE cntl_system_error.
    ENDCASE.
  ENDIF.

  IF NOT delta_selection-derived_class_selection IS INITIAL.
* derived class sets a selection.
* Note: in this case, nodes_to_select, nodes_to_unselect and
* node_to_select must be initial.
    CALL METHOD update_selection_ex
      EXCEPTIONS
        cntl_system_error = 1
        failed            = 2.
    CASE sy-subrc.
      WHEN 1. RAISE cntl_system_error.
      WHEN 2. RAISE failed.
    ENDCASE.
  ELSE.
    IF node_selection_mode = node_sel_mode_single.
* single node selection: set the selected node
      IF NOT delta_selection-node_to_select IS INITIAL.
        CALL METHOD base_tree_control->set_selected_node
          EXPORTING
            node_key = delta_selection-node_to_select->view_key
          EXCEPTIONS
            failed                     = 1
            single_node_selection_only = 2
            node_not_found             = 3
            cntl_system_error          = 4.
        CASE sy-subrc.
          WHEN 1. RAISE failed.
          WHEN 2 OR 3. CALL METHOD internal_error.
          WHEN 4. RAISE cntl_system_error.
        ENDCASE.
      ENDIF.
    ELSE.
* multiple node selection: unselect nodes_to_unselect and
* select nodes_to_select
      CALL METHOD map_node_refs_to_view_keys
        EXPORTING node_refs = delta_selection-nodes_to_unselect
        CHANGING view_keys = view_keys.
      CALL METHOD base_tree_control->unselect_nodes
        EXPORTING
          node_key_table = view_keys
        EXCEPTIONS
          failed                       = 1
          cntl_system_error            = 2
          error_in_node_key_table      = 3
          dp_error                     = 4
          multiple_node_selection_only = 5.
      CASE sy-subrc.
        WHEN 1. RAISE failed.
        WHEN 2. RAISE cntl_system_error.
        WHEN 3 OR 4 OR 5. CALL METHOD internal_error.
      ENDCASE.
      CLEAR view_keys.
      CALL METHOD map_node_refs_to_view_keys
        EXPORTING node_refs = delta_selection-nodes_to_select
        CHANGING view_keys = view_keys.
      CALL METHOD base_tree_control->select_nodes
        EXPORTING
          node_key_table = view_keys
        EXCEPTIONS
          failed                       = 1
          cntl_system_error            = 2
          error_in_node_key_table      = 3
          dp_error                     = 4
          multiple_node_selection_only = 5.
      CASE sy-subrc.
        WHEN 1. RAISE failed.
        WHEN 2. RAISE cntl_system_error.
        WHEN 3 OR 4 OR 5. CALL METHOD internal_error.
      ENDCASE.
    ENDIF.
  ENDIF.

* clear delta_selection
  clear delta_selection.

ENDMETHOD.


method UPDATE_SELECTION_EX .

ENDMETHOD.


METHOD UPDATE_STYLE_INFOS .
  DATA: l_style_info TYPE style_info,
        info(300) TYPE c.

  IF NOT style_infos_changed IS INITIAL.
    CLEAR style_infos_changed.
    " remove all style infos in control
    CALL METHOD base_tree_control->clear_all_style_infos
      EXCEPTIONS
        failed            = 1
        cntl_system_error = 2.
    CASE sy-subrc.
      WHEN 1. RAISE failed.
      WHEN 2. RAISE cntl_system_error.
    ENDCASE.
    " set the current style infos
    LOOP AT style_infos INTO l_style_info.
      info = l_style_info-info.
      CALL METHOD base_tree_control->add_style_info
        EXPORTING
          style             = l_style_info-style
          info              = info
        EXCEPTIONS
          failed            = 1
          cntl_system_error = 2.
      CASE sy-subrc.
        WHEN 1. RAISE failed.
        WHEN 2. RAISE cntl_system_error.
      ENDCASE.
    ENDLOOP.
  ENDIF.

ENDMETHOD.


METHOD UPDATE_TREE_STRUCTURE.

* ...
ENDMETHOD.


METHOD UPDATE_U_NODES .

* ...
ENDMETHOD.


METHOD UPDATE_VIEW.

  DATA: C_NODES TYPE TREEM_C_NODES. " keys of the nodes which must be
                                    " copied to the view

* check control
  CALL METHOD check_control
    EXCEPTIONS
      control_not_existing = 1
      control_dead = 2.
  CASE sy-subrc.
    WHEN 1. RAISE control_not_existing.
    WHEN 2. RAISE control_dead.
  ENDCASE.

* JB 10.03.2000 exit if nothing changed to avoid set_screen_update calls
  if changed is initial.
    exit.
  endif.

  clear changed.

* disable screen update of control
  CALL METHOD base_tree_control->set_screen_update
    EXPORTING
      UPDATE            = ' '
    EXCEPTIONS
      FAILED            = 1
      CNTL_SYSTEM_ERROR = 2.
  case sy-subrc.
    when 1. raise failed.
    when 2. raise cntl_system_error.
  endcase.

* update base properties
  call method update_base_properties
    exceptions
      failed = 1
      cntl_system_error = 2.
  case sy-subrc.
    when 1. raise failed.
    when 2. raise cntl_system_error.
  endcase.

* update the registered events
  call method UPDATE_REGISTERED_EVENTS
    exceptions
      failed = 1
      cntl_system_error = 2.
  case sy-subrc.
    when 1. raise failed.
    when 2. raise cntl_system_error.
  endcase.

* delete the deleted nodes in the control
  call method delete_nodes_in_control
    exceptions
      failed = 1
      cntl_system_error = 2.
  case sy-subrc.
    when 1. raise failed.
    when 2. raise cntl_system_error.
  endcase.

* collect the keys of the nodes which must be inserted in the view
  CALL METHOD CALC_NODES_TO_INSERT_IN_VIEW_2
    CHANGING
      C_NODES = C_NODES.

* the derived class updates its tree structure now (like Columns and
* Headers)
  CALL METHOD UPDATE_TREE_STRUCTURE
    EXCEPTIONS
      CNTL_SYSTEM_ERROR = 1
      FAILED            = 2.
  CASE SY-SUBRC.
    WHEN 1. RAISE CNTL_SYSTEM_ERROR.
    WHEN 2. RAISE FAILED.
  ENDCASE.

* the derived class updates the nodes in u_nodes in the control
* Note: update of the nodes in the control must be performermed
* BEFORE inserting the new nodes. Example: node in is a leaf in
* the control. In the model tree, n has become a folder and has children
* => n must be updated to folder before its children are inserted in the
* control
  CALL METHOD UPDATE_U_NODES
    EXPORTING
      U_NODES = U_NODES
    EXCEPTIONS
      CNTL_SYSTEM_ERROR = 1
      FAILED            = 2.
  CASE SY-SUBRC.
    WHEN 1. RAISE CNTL_SYSTEM_ERROR.
    WHEN 2. RAISE FAILED.
  ENDCASE.
  clear u_nodes.

* the derived class copies the nodes in c_nodes to the control
  CALL METHOD INSERT_C_NODES
    EXPORTING
      C_NODES = C_NODES
    EXCEPTIONS
      CNTL_SYSTEM_ERROR = 1
      FAILED            = 2.
  CASE SY-SUBRC.
    WHEN 1. RAISE CNTL_SYSTEM_ERROR.
    WHEN 2. RAISE FAILED.
  ENDCASE.

* collapse / expand nodes
  call method collapse_and_expand
    exceptions
      FAILED                  = 1
      CNTL_SYSTEM_ERROR       = 2.
  CASE SY-SUBRC.
    WHEN 1. RAISE FAILED.
    WHEN 2. RAISE CNTL_SYSTEM_ERROR.
  ENDCASE.

* update selection
  call method update_selection
    EXCEPTIONS
      CNTL_SYSTEM_ERROR = 1
      FAILED            = 2.
  CASE SY-SUBRC.
    WHEN 1. RAISE CNTL_SYSTEM_ERROR.
    WHEN 2. RAISE FAILED.
  ENDCASE.

* enable screen update of control
  CALL METHOD base_tree_control->set_screen_update
    EXPORTING
      UPDATE            = 'X'
    EXCEPTIONS
      FAILED            = 1
      CNTL_SYSTEM_ERROR = 2.
  case sy-subrc.
    when 1. raise failed.
    when 2. raise cntl_system_error.
  endcase.


ENDMETHOD.
ENDCLASS.
