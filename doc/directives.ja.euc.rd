=begin

= mod_ruby Apache�ǥ��쥯�ƥ���

[((<�ܼ�|URL:index.ja.jis.html>))
|((<RD����|URL:directives.ja.euc.rd>))]

* ((<RubyAddPath|RubyAddPath directory...>))
* ((<RubyRequire|RubyRequire library...>))
* ((<RubyHandler|RubyHandler expr>))
* ((<RubyPassEnv|RubyPassEnv name...>))
* ((<RubyTransHandler|RubyTransHandler expr>))
* ((<RubyAuthenHandler|RubyAuthenHandler expr>))
* ((<RubyAuthzHandler|RubyAuthzHandler expr>))
* ((<RubyAccessHandler|RubyAccessHandler expr>))
* ((<RubyTypeHandler|RubyTypeHandler expr>))
* ((<RubyFixupHandler|RubyFixupHandler expr>))
* ((<RubyLogHandler|RubyLogHandler expr>))
* ((<RubyHeaderParserHandler|RubyHeaderParserHandler expr>))
* ((<RubyPostReadRequestHandler|RubyPostReadRequestHandler expr>))
* ((<RubyInitHandler|RubyInitHandler expr>))
* ((<RubyCleanupHandler|RubyCleanupHandler expr>))
* ((<RubySetEnv|RubySetEnv name val>))
* ((<RubyTimeOut|RubyTimeOut sec>))
* ((<RubySafeLevel|RubySafeLevel level>))
* ((<RubyOutputMode|RubyOutputMode mode>))
* ((<RubyRestrictDirectives|RubyRestrictDirectives flag>))
* ((<RubyGcPerRequest|RubyGcPerRequest flag>))
* ((<RubyKanjiCode|RubyKanjiCode kcode>))

--- RubyAddPath directory...
      �饤�֥��θ����ѥ��˥ǥ��쥯�ȥ���ɲä��롣

      ��:

        RubyAddPath /home/shugo/ruby

--- RubyRequire library...
      ((|library|))��(({require}))���롣

      ��:

        RubyRequire apache/ruby-run
        RubyRequire cgi

--- RubyHandler expr
      ruby-object�ϥ�ɥ�Ǽºݤ˽�����Ԥ����֥������Ȥ��֤�������ꤹ�롣
      request���֥������Ȥ������((|handler|))�᥽�åɤ��ƤФ�롣

      ��:

        <Location /ruby>
          SetHandler ruby-object
          RubyHandler Apache::RubyRun.instance
        </Location>

--- RubyTransHandler expr
      URI�ν񤭴�����Ԥ����֥������Ȥ��֤�������ꤹ�롣
      request���֥������Ȥ������((|translate_uri|))�᥽�åɤ��ƤФ�롣

      ��:

        <Location /ruby>
          RubyTransHandler Apache::Foo.instance
        </Location>

--- RubyAuthenHandler expr
      �桼��ID�ȥѥ���ɤγ�ǧ��Ԥ����֥������Ȥ��֤�������ꤹ�롣
      request���֥������Ȥ������((|authenticate|))�᥽�åɤ��ƤФ�롣

      ��:

        <Location /ruby>
          RubyAuthenHandler Apache::Foo.instance
        </Location>

--- RubyAuthzHandler expr
      �꥽���������¤�ɬ�פȤ��뤫�ɤ����γ�ǧ��Ԥ����֥������Ȥ��֤���
      ����ꤹ�롣
      request���֥������Ȥ������((|authorize|))�᥽�åɤ��ƤФ�롣

      ��:

        <Location /ruby>
          RubyAuthzHandler Apache::Foo.instance
        </Location>

--- RubyAccessHandler expr
      �������������Ԥ����֥������Ȥ��֤�������ꤹ�롣
      request���֥������Ȥ������((|check_access|))�᥽�åɤ��ƤФ�롣

      ��:

        <Location /ruby>
          RubyAccessHandler Apache::Foo.instance
        </Location>

--- RubyTypeHandler expr
      MIME-type�Υ����å���Ԥ����֥������Ȥ��֤�������ꤹ�롣
      request���֥������Ȥ������((|find_types|))�᥽�åɤ��ƤФ�롣

      ��:

        <Location /ruby>
          RubyTypeHandler Apache::Foo.instance
        </Location>

--- RubyFixupHandler expr
      ���������Ƥ�Ǹ���ѹ����륪�֥������Ȥ��֤�������ꤹ�롣
      request���֥������Ȥ������((|fixup|))�᥽�åɤ��ƤФ�롣

      ��:

        <Location /ruby>
          RubyFixupHandler Apache::Foo.instance
        </Location>

--- RubyLogHandler expr
      �ꥯ�����ȤˤĤ��Ƥξ����Ͽ���륪�֥������Ȥ��֤�������ꤹ�롣
      request���֥������Ȥ������((|log_transaction|))�᥽�åɤ��ƤФ�롣

      ��:

        <Location /ruby>
          RubyLogHandler Apache::Foo.instance
        </Location>

--- RubyHeaderParserHandler expr
      �إå��Υѡ����򤹤륪�֥������Ȥ��֤�������ꤹ�롣
      request���֥������Ȥ������((|log_transaction|))�᥽�åɤ��ƤФ�롣
      Apache 1.x �ǤΤ߻��ѤǤ��롣

      ��:

        <Location /ruby>
          RubyHeaderParserHandler Apache::Foo.instance
        </Location>


--- RubyPostReadRequestHandler expr
      �ꥯ�����Ȥ��ɤߤ�����塢¾�Υե����������˸ƤФ�륪�֥������Ȥ�
      �֤�������ꤹ�롣
      request���֥������Ȥ������((|post_read_request|))�᥽�åɤ��ƤФ�롣

      ��:

        <Location /ruby>
          RubyPostReadRequestHandler Apache::Foo.instance
        </Location>

--- RubyInitHandler expr
      �ҥץ��뵯ưľ��˸ƤФ�륪�֥������Ȥ��֤�������ꤹ�롣
      request���֥������Ȥ������((|init|))�᥽�åɤ��ƤФ�롣
      �����Х�٥������(�Ĥޤ�((|<Location>|))��((|<Directory>|))��
      ((|<Files>|))�γ�)�ǻ��ꤹ��ȡ�((<RubyPostReadRequestHandler>))��
      ������˼¹Ԥ��졢�����Ǥʤ����((<RubyHeaderParserHandler>))������
      �¹Ԥ���롣

      ��:

        RubyInitHandler Apache::Foo.instance

        <Location /ruby>
          RubyInitHandler Apache::Foo.instance
        </Location>

--- RubyCleanupHandler expr
      ���꡼�󥢥å׻��˸ƤФ�륪�֥������Ȥ��֤�������ꤹ�롣
      �ꥯ�����ȴ�λ���ˡ�request���֥������Ȥ������((|cleanup|))�᥽�åɤ�
      �ƤФ�롣

      ��:

        RubyCleanupHandler Apache::Foo.instance

        <Location /ruby>
          RubyCleanupHandler Apache::Foo.instance
        </Location>

--- RubyPassEnv name...
      ������ץȤ˼����Ϥ��Ķ��ѿ���̾������ꤹ�롣
      ���Υǥ��쥯�ƥ��֤����ꤵ��ʤ��ä���硢CGI�Ķ��ѿ�(QUERY_STRING�ʤ�)
      �Τߤ�Ruby������ץȤ��Ϥ���롣
      ���Υƥ��쥯�ƥ��֤����ꤵ�줿��硢���٤Ƥ�CGI�Ķ��ѿ��ȡ��ꥹ�Ȥ��줿
      ¾�δĶ��ѿ�����Ruby������ץȤ������Ѳ�ǽ�Ȥʤ롣
      ����������Τߤ˻���ġ�

      ��:

        RubyPassEnv HOSTNAME OSTYPE MACHTYPE

--- RubySetEnv name val
      ������ץȤ˼����Ϥ��Ķ��ѿ����ͤ���ꤹ�롣

      ��:

        RubySetEnv LANG "ja_JP.eucJP"

--- RubyTimeOut sec
      ������ץȤΥ����ॢ���Ȼ���(ñ�̤���)����ꤹ�롣
      �����ॢ���Ȼ��֤��᤮�Ƥ�¹Ԥ���Ƥ��륹����ץȤ϶���Ū��
      ��λ����롣
      ����������Τߤ˻���ġ�

      ��:

        RubyTimeOut 60

--- RubySafeLevel level
      ((|$SAFE|))�Υǥե�����ͤ���ꤹ�롣
      ����������Τߤ˻���ġ�

      $SAFE�ϥ������ƥ���٥�Ǥ��롣
      $SAFE���ͤ�0����4�ޤǤ������Ǥʤ���Фʤ�ʤ���
      mod_ruby�Ǥ�$SAFE�Υǥե�����ͤ�1�Ǥ��롣

      $SAFE��1�ʾ�ξ�硢Ruby�ϥ桼�����������줿�ǡ���������Ū�����Τ���
      �������Ѥ���Τ�ػߤ��롣

      $SAFE��2�ʾ�ξ�硢Ruby�Ϥ���Ǥ�񤭹��ळ�ȤΤǤ����꤫��ץ����
      �ե��������ɤ��뤳�Ȥ�ػߤ��롣
      writable locations.

      $SAFE��3�ʾ�ξ�硢�������������줿���٤ƤΥ��֥������Ȥϱ�������롣

      $SAFE��4�ʾ�ξ�硢Ruby�ϥ����Х��ѿ��ʤɤΥ����Х�ʾ��֤��ѹ���
      �ػߤ��롣

      ��:

        RubySafeLevel 2

--- RubyOutputMode mode
      ������ץȤν��ϥ⡼�ɤ���ꤹ�롣((|mode|))��(({nosync})), (({sync})),
      (({syncheader}))�Τ����Τɤ줫��ĤǤʤ���Фʤ�ʤ���((|mode|))��
      (({nosync}))�ξ�硢������ץȤΤ��٤Ƥν��ϤϥХåե���󥰤��졢�������
      �Ȥμ¹Ԥν�λ���˥ե�å��夵��롣((|mode|))��(({sync}))�ξ�硢�������
      �ȤΤ��٤Ƥν��ϤϤ������˥��饤��Ȥ���������롣((|mode|))��
      (({syncheader}))�ξ�硢�إå��ν��ϤΤߤ����������������졢¾�ν��ϤϥХ�
      �ե���󥰤���롣�ǥե�����ͤ�(({nosync}))��
      
      ��:

        RubyOutputMode syncheader

--- RubyRestrictDirectives flag
      ¾�Ρ�Ruby�ǻϤޤ�ǥ��쥯�ƥ���(RubyHandler��RubySetEnv�ʤ�)��
      ��.htaccess�����¤��뤫�ɤ�������ꤹ�롣�ǥե���Ȥ�(({off}))��
      ��ͭ�����Фʤ�ʣ���Υ桼�������Ѥ�����ʤɤ�(({on}))�ˤ���ȡ�
      �����д����Ԥ�����mod_ruby��Ȥ����Ȥ��Ǥ��롣����������ǤΤ߻���
      ���뤳�Ȥ��Ǥ��롣

      ��:

        RubyRestrictDirectives on

--- RubyGcPerRequest flag
      �ƥꥯ�����Ȥν������GC��¹Ԥ��뤫�ɤ�������ꤹ�롣

      ��:

        RubyGcPerRequest on

--- RubyKanjiCode kcode
      Ruby��((|$KCODE|))����ꤹ�롣�ǥե�����ͤ�(({"NONE"}))��

      ��:

        RubyKanjiCode euc

=end
