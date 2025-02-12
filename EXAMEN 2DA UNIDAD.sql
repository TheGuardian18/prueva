PGDMP  8        
    
    
    |            supermercado    16.4    16.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    50155    supermercado    DATABASE     ~   CREATE DATABASE supermercado WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Peru.1252';
    DROP DATABASE supermercado;
                postgres    false            i           1247    50157    tipo_factura_enum    TYPE     U   CREATE TYPE public.tipo_factura_enum AS ENUM (
    'A',
    'B',
    'C',
    'D'
);
 $   DROP TYPE public.tipo_factura_enum;
       public          postgres    false            l           1247    50166    tipo_pago_enum    TYPE     y   CREATE TYPE public.tipo_pago_enum AS ENUM (
    'EFECTIVO',
    'CHEQUE',
    'TARJETA CREDITO',
    'TARJETA DEBITO'
);
 !   DROP TYPE public.tipo_pago_enum;
       public          postgres    false            �            1259    50175    bitacoraventas    TABLE     �   CREATE TABLE public.bitacoraventas (
    id integer NOT NULL,
    fecha date NOT NULL,
    total numeric
)
PARTITION BY RANGE (fecha);
 "   DROP TABLE public.bitacoraventas;
       public            postgres    false            �            1259    50178    bitacoraventas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacoraventas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.bitacoraventas_id_seq;
       public          postgres    false    215            �           0    0    bitacoraventas_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.bitacoraventas_id_seq OWNED BY public.bitacoraventas.id;
          public          postgres    false    216            �            1259    50179    bitacoraventas_enero2021    TABLE     �   CREATE TABLE public.bitacoraventas_enero2021 (
    id integer DEFAULT nextval('public.bitacoraventas_id_seq'::regclass) NOT NULL,
    fecha date NOT NULL,
    total numeric
);
 ,   DROP TABLE public.bitacoraventas_enero2021;
       public         heap    postgres    false    216    215            �            1259    50185 
   id_sec_cli    SEQUENCE     s   CREATE SEQUENCE public.id_sec_cli
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.id_sec_cli;
       public          postgres    false            �            1259    50186    clientes    TABLE     �  CREATE TABLE public.clientes (
    id integer DEFAULT nextval('public.id_sec_cli'::regclass) NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    tipo_doc character varying(20) NOT NULL,
    nro_doc character varying(20) NOT NULL,
    nro_tel_princ character varying(40) NOT NULL,
    nro_tel_sec character varying(40),
    email character varying(40)
);
    DROP TABLE public.clientes;
       public         heap    postgres    false    218            �            1259    50190    id_sec_compr_cli    SEQUENCE     y   CREATE SEQUENCE public.id_sec_compr_cli
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.id_sec_compr_cli;
       public          postgres    false            �            1259    50191    compras_clientes    TABLE     �   CREATE TABLE public.compras_clientes (
    id integer DEFAULT nextval('public.id_sec_compr_cli'::regclass) NOT NULL,
    id_venta integer NOT NULL,
    id_cliente integer NOT NULL
);
 $   DROP TABLE public.compras_clientes;
       public         heap    postgres    false    220            �            1259    50366 	   empleados    TABLE     �  CREATE TABLE public.empleados (
    id bigint NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    edad integer NOT NULL,
    fecha_nac date NOT NULL,
    tipo_doc character varying(50) NOT NULL,
    nro_doc character varying(20) NOT NULL,
    cuil character varying(30) NOT NULL,
    direccion character varying(40) NOT NULL,
    nro_tel_princ character varying(40) NOT NULL,
    nro_tel_sec character varying(40),
    email character varying(40),
    cargo character varying(40) NOT NULL,
    antiguedad character varying(30) NOT NULL,
    fecha_ingreso date NOT NULL,
    salario_anual numeric(10,2) NOT NULL
)
PARTITION BY RANGE (fecha_ingreso);
    DROP TABLE public.empleados;
       public            postgres    false            �            1259    50376    empleados_2020_2021    TABLE     �  CREATE TABLE public.empleados_2020_2021 (
    id bigint NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    edad integer NOT NULL,
    fecha_nac date NOT NULL,
    tipo_doc character varying(50) NOT NULL,
    nro_doc character varying(20) NOT NULL,
    cuil character varying(30) NOT NULL,
    direccion character varying(40) NOT NULL,
    nro_tel_princ character varying(40) NOT NULL,
    nro_tel_sec character varying(40),
    email character varying(40),
    cargo character varying(40) NOT NULL,
    antiguedad character varying(30) NOT NULL,
    fecha_ingreso date NOT NULL,
    salario_anual numeric(10,2) NOT NULL
);
 '   DROP TABLE public.empleados_2020_2021;
       public         heap    postgres    false    237            �            1259    50371    empleados_antiguos    TABLE     �  CREATE TABLE public.empleados_antiguos (
    id bigint NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    edad integer NOT NULL,
    fecha_nac date NOT NULL,
    tipo_doc character varying(50) NOT NULL,
    nro_doc character varying(20) NOT NULL,
    cuil character varying(30) NOT NULL,
    direccion character varying(40) NOT NULL,
    nro_tel_princ character varying(40) NOT NULL,
    nro_tel_sec character varying(40),
    email character varying(40),
    cargo character varying(40) NOT NULL,
    antiguedad character varying(30) NOT NULL,
    fecha_ingreso date NOT NULL,
    salario_anual numeric(10,2) NOT NULL
);
 &   DROP TABLE public.empleados_antiguos;
       public         heap    postgres    false    237            �            1259    50381    empleados_recientes    TABLE     �  CREATE TABLE public.empleados_recientes (
    id bigint NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    edad integer NOT NULL,
    fecha_nac date NOT NULL,
    tipo_doc character varying(50) NOT NULL,
    nro_doc character varying(20) NOT NULL,
    cuil character varying(30) NOT NULL,
    direccion character varying(40) NOT NULL,
    nro_tel_princ character varying(40) NOT NULL,
    nro_tel_sec character varying(40),
    email character varying(40),
    cargo character varying(40) NOT NULL,
    antiguedad character varying(30) NOT NULL,
    fecha_ingreso date NOT NULL,
    salario_anual numeric(10,2) NOT NULL
);
 '   DROP TABLE public.empleados_recientes;
       public         heap    postgres    false    237            �            1259    50204    id_sec_fact    SEQUENCE     t   CREATE SEQUENCE public.id_sec_fact
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.id_sec_fact;
       public          postgres    false            �            1259    50205    facturas    TABLE     �  CREATE TABLE public.facturas (
    id integer DEFAULT nextval('public.id_sec_fact'::regclass) NOT NULL,
    numero character varying(200) NOT NULL,
    codigo character varying(200) NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    importe_total numeric(10,2) NOT NULL,
    CONSTRAINT check_facturas_fecha CHECK (((fecha <= CURRENT_DATE) OR (fecha >= CURRENT_DATE))),
    CONSTRAINT check_facturas_hora CHECK ((((hora)::time with time zone <= CURRENT_TIME) OR ((hora)::time with time zone >= CURRENT_TIME))),
    CONSTRAINT check_facturas_importe_total CHECK ((importe_total > (0)::numeric)),
    CONSTRAINT check_facturas_numero_codigo CHECK ((((codigo)::text <> ''::text) AND ((numero)::text <> ''::text)))
);
    DROP TABLE public.facturas;
       public         heap    postgres    false    223            �            1259    50389    facturas_particion    TABLE     $  CREATE TABLE public.facturas_particion (
    id integer NOT NULL,
    numero character varying(200) NOT NULL,
    codigo character varying(200) NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    importe_total numeric(10,2) NOT NULL
)
PARTITION BY RANGE (fecha);
 &   DROP TABLE public.facturas_particion;
       public            postgres    false            �            1259    50399    facturas_2020_2021    TABLE     	  CREATE TABLE public.facturas_2020_2021 (
    id integer NOT NULL,
    numero character varying(200) NOT NULL,
    codigo character varying(200) NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    importe_total numeric(10,2) NOT NULL
);
 &   DROP TABLE public.facturas_2020_2021;
       public         heap    postgres    false    241            �            1259    50394    facturas_antiguas    TABLE       CREATE TABLE public.facturas_antiguas (
    id integer NOT NULL,
    numero character varying(200) NOT NULL,
    codigo character varying(200) NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    importe_total numeric(10,2) NOT NULL
);
 %   DROP TABLE public.facturas_antiguas;
       public         heap    postgres    false    241            �            1259    50213    id_sec_fact_det    SEQUENCE     x   CREATE SEQUENCE public.id_sec_fact_det
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.id_sec_fact_det;
       public          postgres    false            �            1259    50214    facturas_detalles    TABLE     �  CREATE TABLE public.facturas_detalles (
    id integer DEFAULT nextval('public.id_sec_fact_det'::regclass) NOT NULL,
    id_factura integer NOT NULL,
    tipo public.tipo_factura_enum NOT NULL,
    descr_factura character varying(100) NOT NULL,
    costo_asoc numeric(8,2) NOT NULL,
    iva numeric(10,2) NOT NULL,
    medio_de_pago public.tipo_pago_enum NOT NULL,
    descr_pago character varying(100) NOT NULL,
    CONSTRAINT check_facturas_detalles_costo_asoc CHECK ((costo_asoc > (0)::numeric))
);
 %   DROP TABLE public.facturas_detalles;
       public         heap    postgres    false    225    876    873            �            1259    50404    facturas_recientes    TABLE     	  CREATE TABLE public.facturas_recientes (
    id integer NOT NULL,
    numero character varying(200) NOT NULL,
    codigo character varying(200) NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    importe_total numeric(10,2) NOT NULL
);
 &   DROP TABLE public.facturas_recientes;
       public         heap    postgres    false    241            �            1259    50195    id_sec_empl    SEQUENCE     t   CREATE SEQUENCE public.id_sec_empl
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.id_sec_empl;
       public          postgres    false            �            1259    50219    id_sec_produc    SEQUENCE     v   CREATE SEQUENCE public.id_sec_produc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.id_sec_produc;
       public          postgres    false            �            1259    50220    id_sec_provee    SEQUENCE     v   CREATE SEQUENCE public.id_sec_provee
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.id_sec_provee;
       public          postgres    false            �            1259    50221    id_sec_vent    SEQUENCE     t   CREATE SEQUENCE public.id_sec_vent
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.id_sec_vent;
       public          postgres    false            �            1259    50222    id_sec_vent_prod    SEQUENCE     y   CREATE SEQUENCE public.id_sec_vent_prod
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.id_sec_vent_prod;
       public          postgres    false            �            1259    50223 	   productos    TABLE     t  CREATE TABLE public.productos (
    id integer DEFAULT nextval('public.id_sec_produc'::regclass) NOT NULL,
    id_proveedor integer NOT NULL,
    codigo character varying(100) NOT NULL,
    imagen character varying(600),
    nombre character varying(100) NOT NULL,
    marca character varying(60) NOT NULL,
    tipo character varying(60) NOT NULL,
    grupo character varying(60) NOT NULL,
    peso numeric(8,3) NOT NULL,
    precio_unidad numeric(8,3) NOT NULL,
    stock smallint NOT NULL,
    CONSTRAINT check_nombre_marca_tipo_grupo CHECK ((((nombre)::text <> ''::text) AND ((marca)::text <> ''::text) AND ((tipo)::text <> ''::text) AND ((grupo)::text <> ''::text))),
    CONSTRAINT check_productos_peso CHECK ((peso > (0)::numeric)),
    CONSTRAINT check_productos_precio_unidad CHECK ((precio_unidad > (0)::numeric)),
    CONSTRAINT check_productos_stock CHECK ((stock > 0))
);
    DROP TABLE public.productos;
       public         heap    postgres    false    227            �            1259    50412    productos_particiones    TABLE     �  CREATE TABLE public.productos_particiones (
    id integer NOT NULL,
    id_proveedor integer NOT NULL,
    codigo character varying(100) NOT NULL,
    imagen character varying(600),
    nombre character varying(100) NOT NULL,
    marca character varying(60) NOT NULL,
    tipo character varying(60) NOT NULL,
    grupo character varying(60) NOT NULL,
    peso numeric(8,3) NOT NULL,
    precio_unidad numeric(8,3) NOT NULL,
    stock smallint NOT NULL
)
PARTITION BY RANGE (peso);
 )   DROP TABLE public.productos_particiones;
       public            postgres    false            �            1259    50417    productos_ligeros    TABLE     �  CREATE TABLE public.productos_ligeros (
    id integer NOT NULL,
    id_proveedor integer NOT NULL,
    codigo character varying(100) NOT NULL,
    imagen character varying(600),
    nombre character varying(100) NOT NULL,
    marca character varying(60) NOT NULL,
    tipo character varying(60) NOT NULL,
    grupo character varying(60) NOT NULL,
    peso numeric(8,3) NOT NULL,
    precio_unidad numeric(8,3) NOT NULL,
    stock smallint NOT NULL
);
 %   DROP TABLE public.productos_ligeros;
       public         heap    postgres    false    245            �            1259    50424    productos_medianos    TABLE     �  CREATE TABLE public.productos_medianos (
    id integer NOT NULL,
    id_proveedor integer NOT NULL,
    codigo character varying(100) NOT NULL,
    imagen character varying(600),
    nombre character varying(100) NOT NULL,
    marca character varying(60) NOT NULL,
    tipo character varying(60) NOT NULL,
    grupo character varying(60) NOT NULL,
    peso numeric(8,3) NOT NULL,
    precio_unidad numeric(8,3) NOT NULL,
    stock smallint NOT NULL
);
 &   DROP TABLE public.productos_medianos;
       public         heap    postgres    false    245            �            1259    50431    productos_pesados    TABLE     �  CREATE TABLE public.productos_pesados (
    id integer NOT NULL,
    id_proveedor integer NOT NULL,
    codigo character varying(100) NOT NULL,
    imagen character varying(600),
    nombre character varying(100) NOT NULL,
    marca character varying(60) NOT NULL,
    tipo character varying(60) NOT NULL,
    grupo character varying(60) NOT NULL,
    peso numeric(8,3) NOT NULL,
    precio_unidad numeric(8,3) NOT NULL,
    stock smallint NOT NULL
);
 %   DROP TABLE public.productos_pesados;
       public         heap    postgres    false    245            �            1259    50233    proveedores    TABLE     �  CREATE TABLE public.proveedores (
    id integer DEFAULT nextval('public.id_sec_provee'::regclass) NOT NULL,
    empresa character varying(60) NOT NULL,
    tipo_producto character varying(100) NOT NULL,
    direccion character varying(60) NOT NULL,
    nro_tel_princ character varying(40) NOT NULL,
    nro_tel_sec character varying(40),
    email character varying(60) NOT NULL,
    CONSTRAINT check_proveedores_empresa_tipo_productos_direccion_nro_tel_prin CHECK ((((empresa)::text <> ''::text) AND ((tipo_producto)::text <> ''::text) AND ((direccion)::text <> ''::text) AND ((nro_tel_princ)::text <> ''::text) AND ((nro_tel_sec)::text <> ''::text) AND ((email)::text <> ''::text)))
);
    DROP TABLE public.proveedores;
       public         heap    postgres    false    228            �            1259    50238    ventas    TABLE     �   CREATE TABLE public.ventas (
    id integer DEFAULT nextval('public.id_sec_vent'::regclass) NOT NULL,
    id_empleado integer NOT NULL,
    id_factura integer NOT NULL
);
    DROP TABLE public.ventas;
       public         heap    postgres    false    229            �            1259    50242    ventas_particionado    TABLE     �   CREATE TABLE public.ventas_particionado (
    codigo integer NOT NULL,
    producto text,
    ventas numeric,
    fecha_actualizacion date,
    usuario text,
    accion text,
    fecharegistro date NOT NULL
)
PARTITION BY RANGE (fecharegistro);
 '   DROP TABLE public.ventas_particionado;
       public            postgres    false            �            1259    50245 "   ventas_particionado_septiembre2024    TABLE     �   CREATE TABLE public.ventas_particionado_septiembre2024 (
    codigo integer NOT NULL,
    producto text,
    ventas numeric,
    fecha_actualizacion date,
    usuario text,
    accion text,
    fecharegistro date NOT NULL
);
 6   DROP TABLE public.ventas_particionado_septiembre2024;
       public         heap    postgres    false    234            �            1259    50250    ventas_productos    TABLE       CREATE TABLE public.ventas_productos (
    id integer DEFAULT nextval('public.id_sec_vent_prod'::regclass) NOT NULL,
    id_venta integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad integer NOT NULL,
    CONSTRAINT check_ventas_productos_cantidad CHECK ((cantidad > 0))
);
 $   DROP TABLE public.ventas_productos;
       public         heap    postgres    false    230            �           0    0    bitacoraventas_enero2021    TABLE ATTACH     �   ALTER TABLE ONLY public.bitacoraventas ATTACH PARTITION public.bitacoraventas_enero2021 FOR VALUES FROM ('2021-01-01') TO ('2021-01-31');
          public          postgres    false    217    215            �           0    0    empleados_2020_2021    TABLE ATTACH     �   ALTER TABLE ONLY public.empleados ATTACH PARTITION public.empleados_2020_2021 FOR VALUES FROM ('2020-01-01') TO ('2022-01-01');
          public          postgres    false    239    237            �           0    0    empleados_antiguos    TABLE ATTACH     {   ALTER TABLE ONLY public.empleados ATTACH PARTITION public.empleados_antiguos FOR VALUES FROM (MINVALUE) TO ('2020-01-01');
          public          postgres    false    238    237            �           0    0    empleados_recientes    TABLE ATTACH     |   ALTER TABLE ONLY public.empleados ATTACH PARTITION public.empleados_recientes FOR VALUES FROM ('2022-01-01') TO (MAXVALUE);
          public          postgres    false    240    237            �           0    0    facturas_2020_2021    TABLE ATTACH     �   ALTER TABLE ONLY public.facturas_particion ATTACH PARTITION public.facturas_2020_2021 FOR VALUES FROM ('2020-01-01') TO ('2022-01-01');
          public          postgres    false    243    241            �           0    0    facturas_antiguas    TABLE ATTACH     �   ALTER TABLE ONLY public.facturas_particion ATTACH PARTITION public.facturas_antiguas FOR VALUES FROM (MINVALUE) TO ('2020-01-01');
          public          postgres    false    242    241            �           0    0    facturas_recientes    TABLE ATTACH     �   ALTER TABLE ONLY public.facturas_particion ATTACH PARTITION public.facturas_recientes FOR VALUES FROM ('2022-01-01') TO (MAXVALUE);
          public          postgres    false    244    241            �           0    0    productos_ligeros    TABLE ATTACH        ALTER TABLE ONLY public.productos_particiones ATTACH PARTITION public.productos_ligeros FOR VALUES FROM (MINVALUE) TO (1.000);
          public          postgres    false    246    245            �           0    0    productos_medianos    TABLE ATTACH     ~   ALTER TABLE ONLY public.productos_particiones ATTACH PARTITION public.productos_medianos FOR VALUES FROM (1.000) TO (10.000);
          public          postgres    false    247    245            �           0    0    productos_pesados    TABLE ATTACH     �   ALTER TABLE ONLY public.productos_particiones ATTACH PARTITION public.productos_pesados FOR VALUES FROM (10.000) TO (MAXVALUE);
          public          postgres    false    248    245            �           0    0 "   ventas_particionado_septiembre2024    TABLE ATTACH     �   ALTER TABLE ONLY public.ventas_particionado ATTACH PARTITION public.ventas_particionado_septiembre2024 FOR VALUES FROM ('2024-09-01') TO ('2024-10-01');
          public          postgres    false    235    234            �           2604    50255    bitacoraventas id    DEFAULT     v   ALTER TABLE ONLY public.bitacoraventas ALTER COLUMN id SET DEFAULT nextval('public.bitacoraventas_id_seq'::regclass);
 @   ALTER TABLE public.bitacoraventas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            �          0    50179    bitacoraventas_enero2021 
   TABLE DATA           D   COPY public.bitacoraventas_enero2021 (id, fecha, total) FROM stdin;
    public          postgres    false    217   A�       �          0    50186    clientes 
   TABLE DATA           n   COPY public.clientes (id, nombre, apellido, tipo_doc, nro_doc, nro_tel_princ, nro_tel_sec, email) FROM stdin;
    public          postgres    false    219   ^�       �          0    50191    compras_clientes 
   TABLE DATA           D   COPY public.compras_clientes (id, id_venta, id_cliente) FROM stdin;
    public          postgres    false    221   5�       �          0    50376    empleados_2020_2021 
   TABLE DATA           �   COPY public.empleados_2020_2021 (id, nombre, apellido, edad, fecha_nac, tipo_doc, nro_doc, cuil, direccion, nro_tel_princ, nro_tel_sec, email, cargo, antiguedad, fecha_ingreso, salario_anual) FROM stdin;
    public          postgres    false    239   \�       �          0    50371    empleados_antiguos 
   TABLE DATA           �   COPY public.empleados_antiguos (id, nombre, apellido, edad, fecha_nac, tipo_doc, nro_doc, cuil, direccion, nro_tel_princ, nro_tel_sec, email, cargo, antiguedad, fecha_ingreso, salario_anual) FROM stdin;
    public          postgres    false    238   O�       �          0    50381    empleados_recientes 
   TABLE DATA           �   COPY public.empleados_recientes (id, nombre, apellido, edad, fecha_nac, tipo_doc, nro_doc, cuil, direccion, nro_tel_princ, nro_tel_sec, email, cargo, antiguedad, fecha_ingreso, salario_anual) FROM stdin;
    public          postgres    false    240   ��       �          0    50205    facturas 
   TABLE DATA           R   COPY public.facturas (id, numero, codigo, fecha, hora, importe_total) FROM stdin;
    public          postgres    false    224   w�       �          0    50399    facturas_2020_2021 
   TABLE DATA           \   COPY public.facturas_2020_2021 (id, numero, codigo, fecha, hora, importe_total) FROM stdin;
    public          postgres    false    243   ��       �          0    50394    facturas_antiguas 
   TABLE DATA           [   COPY public.facturas_antiguas (id, numero, codigo, fecha, hora, importe_total) FROM stdin;
    public          postgres    false    242   ��       �          0    50214    facturas_detalles 
   TABLE DATA           |   COPY public.facturas_detalles (id, id_factura, tipo, descr_factura, costo_asoc, iva, medio_de_pago, descr_pago) FROM stdin;
    public          postgres    false    226   �       �          0    50404    facturas_recientes 
   TABLE DATA           \   COPY public.facturas_recientes (id, numero, codigo, fecha, hora, importe_total) FROM stdin;
    public          postgres    false    244   ��       �          0    50223 	   productos 
   TABLE DATA           }   COPY public.productos (id, id_proveedor, codigo, imagen, nombre, marca, tipo, grupo, peso, precio_unidad, stock) FROM stdin;
    public          postgres    false    231   ��       �          0    50417    productos_ligeros 
   TABLE DATA           �   COPY public.productos_ligeros (id, id_proveedor, codigo, imagen, nombre, marca, tipo, grupo, peso, precio_unidad, stock) FROM stdin;
    public          postgres    false    246   b�       �          0    50424    productos_medianos 
   TABLE DATA           �   COPY public.productos_medianos (id, id_proveedor, codigo, imagen, nombre, marca, tipo, grupo, peso, precio_unidad, stock) FROM stdin;
    public          postgres    false    247   �       �          0    50431    productos_pesados 
   TABLE DATA           �   COPY public.productos_pesados (id, id_proveedor, codigo, imagen, nombre, marca, tipo, grupo, peso, precio_unidad, stock) FROM stdin;
    public          postgres    false    248   ��       �          0    50233    proveedores 
   TABLE DATA           o   COPY public.proveedores (id, empresa, tipo_producto, direccion, nro_tel_princ, nro_tel_sec, email) FROM stdin;
    public          postgres    false    232   ��       �          0    50238    ventas 
   TABLE DATA           =   COPY public.ventas (id, id_empleado, id_factura) FROM stdin;
    public          postgres    false    233   ��       �          0    50245 "   ventas_particionado_septiembre2024 
   TABLE DATA           �   COPY public.ventas_particionado_septiembre2024 (codigo, producto, ventas, fecha_actualizacion, usuario, accion, fecharegistro) FROM stdin;
    public          postgres    false    235   ��       �          0    50250    ventas_productos 
   TABLE DATA           O   COPY public.ventas_productos (id, id_venta, id_producto, cantidad) FROM stdin;
    public          postgres    false    236   %�       �           0    0    bitacoraventas_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.bitacoraventas_id_seq', 1, false);
          public          postgres    false    216            �           0    0 
   id_sec_cli    SEQUENCE SET     8   SELECT pg_catalog.setval('public.id_sec_cli', 3, true);
          public          postgres    false    218            �           0    0    id_sec_compr_cli    SEQUENCE SET     >   SELECT pg_catalog.setval('public.id_sec_compr_cli', 2, true);
          public          postgres    false    220            �           0    0    id_sec_empl    SEQUENCE SET     9   SELECT pg_catalog.setval('public.id_sec_empl', 8, true);
          public          postgres    false    222            �           0    0    id_sec_fact    SEQUENCE SET     9   SELECT pg_catalog.setval('public.id_sec_fact', 3, true);
          public          postgres    false    223            �           0    0    id_sec_fact_det    SEQUENCE SET     =   SELECT pg_catalog.setval('public.id_sec_fact_det', 3, true);
          public          postgres    false    225            �           0    0    id_sec_produc    SEQUENCE SET     <   SELECT pg_catalog.setval('public.id_sec_produc', 20, true);
          public          postgres    false    227            �           0    0    id_sec_provee    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.id_sec_provee', 8, true);
          public          postgres    false    228            �           0    0    id_sec_vent    SEQUENCE SET     9   SELECT pg_catalog.setval('public.id_sec_vent', 3, true);
          public          postgres    false    229            �           0    0    id_sec_vent_prod    SEQUENCE SET     >   SELECT pg_catalog.setval('public.id_sec_vent_prod', 6, true);
          public          postgres    false    230            �           2606    50257 "   bitacoraventas bitacoraventas_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.bitacoraventas
    ADD CONSTRAINT bitacoraventas_pkey PRIMARY KEY (id, fecha);
 L   ALTER TABLE ONLY public.bitacoraventas DROP CONSTRAINT bitacoraventas_pkey;
       public            postgres    false    215    215            �           2606    50259 6   bitacoraventas_enero2021 bitacoraventas_enero2021_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.bitacoraventas_enero2021
    ADD CONSTRAINT bitacoraventas_enero2021_pkey PRIMARY KEY (id, fecha);
 `   ALTER TABLE ONLY public.bitacoraventas_enero2021 DROP CONSTRAINT bitacoraventas_enero2021_pkey;
       public            postgres    false    217    217    4828    217            �           2606    50261    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    219            �           2606    50263 &   compras_clientes compras_clientes_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.compras_clientes
    ADD CONSTRAINT compras_clientes_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.compras_clientes DROP CONSTRAINT compras_clientes_pkey;
       public            postgres    false    221                       2606    50370    empleados empleados_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id, fecha_ingreso);
 B   ALTER TABLE ONLY public.empleados DROP CONSTRAINT empleados_pkey;
       public            postgres    false    237    237                       2606    50380 ,   empleados_2020_2021 empleados_2020_2021_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.empleados_2020_2021
    ADD CONSTRAINT empleados_2020_2021_pkey PRIMARY KEY (id, fecha_ingreso);
 V   ALTER TABLE ONLY public.empleados_2020_2021 DROP CONSTRAINT empleados_2020_2021_pkey;
       public            postgres    false    239    4885    239    239                       2606    50375 *   empleados_antiguos empleados_antiguos_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.empleados_antiguos
    ADD CONSTRAINT empleados_antiguos_pkey PRIMARY KEY (id, fecha_ingreso);
 T   ALTER TABLE ONLY public.empleados_antiguos DROP CONSTRAINT empleados_antiguos_pkey;
       public            postgres    false    238    238    238    4885                       2606    50385 ,   empleados_recientes empleados_recientes_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.empleados_recientes
    ADD CONSTRAINT empleados_recientes_pkey PRIMARY KEY (id, fecha_ingreso);
 V   ALTER TABLE ONLY public.empleados_recientes DROP CONSTRAINT empleados_recientes_pkey;
       public            postgres    false    240    240    4885    240                       2606    50393 *   facturas_particion facturas_particion_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.facturas_particion
    ADD CONSTRAINT facturas_particion_pkey PRIMARY KEY (id, fecha);
 T   ALTER TABLE ONLY public.facturas_particion DROP CONSTRAINT facturas_particion_pkey;
       public            postgres    false    241    241            !           2606    50403 *   facturas_2020_2021 facturas_2020_2021_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.facturas_2020_2021
    ADD CONSTRAINT facturas_2020_2021_pkey PRIMARY KEY (id, fecha);
 T   ALTER TABLE ONLY public.facturas_2020_2021 DROP CONSTRAINT facturas_2020_2021_pkey;
       public            postgres    false    243    243    4893    243                       2606    50398 (   facturas_antiguas facturas_antiguas_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.facturas_antiguas
    ADD CONSTRAINT facturas_antiguas_pkey PRIMARY KEY (id, fecha);
 R   ALTER TABLE ONLY public.facturas_antiguas DROP CONSTRAINT facturas_antiguas_pkey;
       public            postgres    false    242    4893    242    242            �           2606    50267 (   facturas_detalles facturas_detalles_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.facturas_detalles
    ADD CONSTRAINT facturas_detalles_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.facturas_detalles DROP CONSTRAINT facturas_detalles_pkey;
       public            postgres    false    226            �           2606    50269    facturas facturas_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.facturas DROP CONSTRAINT facturas_pkey;
       public            postgres    false    224            #           2606    50408 *   facturas_recientes facturas_recientes_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.facturas_recientes
    ADD CONSTRAINT facturas_recientes_pkey PRIMARY KEY (id, fecha);
 T   ALTER TABLE ONLY public.facturas_recientes DROP CONSTRAINT facturas_recientes_pkey;
       public            postgres    false    244    244    244    4893            %           2606    50416 0   productos_particiones productos_particiones_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.productos_particiones
    ADD CONSTRAINT productos_particiones_pkey PRIMARY KEY (id, peso);
 Z   ALTER TABLE ONLY public.productos_particiones DROP CONSTRAINT productos_particiones_pkey;
       public            postgres    false    245    245            '           2606    50421 (   productos_ligeros productos_ligeros_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.productos_ligeros
    ADD CONSTRAINT productos_ligeros_pkey PRIMARY KEY (id, peso);
 R   ALTER TABLE ONLY public.productos_ligeros DROP CONSTRAINT productos_ligeros_pkey;
       public            postgres    false    4901    246    246    246            )           2606    50428 *   productos_medianos productos_medianos_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.productos_medianos
    ADD CONSTRAINT productos_medianos_pkey PRIMARY KEY (id, peso);
 T   ALTER TABLE ONLY public.productos_medianos DROP CONSTRAINT productos_medianos_pkey;
       public            postgres    false    4901    247    247    247            +           2606    50435 (   productos_pesados productos_pesados_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.productos_pesados
    ADD CONSTRAINT productos_pesados_pkey PRIMARY KEY (id, peso);
 R   ALTER TABLE ONLY public.productos_pesados DROP CONSTRAINT productos_pesados_pkey;
       public            postgres    false    4901    248    248    248            �           2606    50271    productos productos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    231                       2606    50273    proveedores proveedores_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.proveedores DROP CONSTRAINT proveedores_pkey;
       public            postgres    false    232            �           2606    50275    clientes unique_clientes_id 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT unique_clientes_id UNIQUE (id);
 E   ALTER TABLE ONLY public.clientes DROP CONSTRAINT unique_clientes_id;
       public            postgres    false    219            �           2606    50277 (   clientes unique_clientes_nombre_apellido 
   CONSTRAINT     o   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT unique_clientes_nombre_apellido UNIQUE (nombre, apellido);
 R   ALTER TABLE ONLY public.clientes DROP CONSTRAINT unique_clientes_nombre_apellido;
       public            postgres    false    219    219            �           2606    50279 &   clientes unique_clientes_nro_tel_princ 
   CONSTRAINT     j   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT unique_clientes_nro_tel_princ UNIQUE (nro_tel_princ);
 P   ALTER TABLE ONLY public.clientes DROP CONSTRAINT unique_clientes_nro_tel_princ;
       public            postgres    false    219            �           2606    50281 +   clientes unique_clientes_tipo_nro_documento 
   CONSTRAINT     s   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT unique_clientes_tipo_nro_documento UNIQUE (nro_doc, tipo_doc);
 U   ALTER TABLE ONLY public.clientes DROP CONSTRAINT unique_clientes_tipo_nro_documento;
       public            postgres    false    219    219            �           2606    50283 +   compras_clientes unique_compras_clientes_id 
   CONSTRAINT     d   ALTER TABLE ONLY public.compras_clientes
    ADD CONSTRAINT unique_compras_clientes_id UNIQUE (id);
 U   ALTER TABLE ONLY public.compras_clientes DROP CONSTRAINT unique_compras_clientes_id;
       public            postgres    false    221            �           2606    50293 -   facturas_detalles unique_facturas_detalles_id 
   CONSTRAINT     f   ALTER TABLE ONLY public.facturas_detalles
    ADD CONSTRAINT unique_facturas_detalles_id UNIQUE (id);
 W   ALTER TABLE ONLY public.facturas_detalles DROP CONSTRAINT unique_facturas_detalles_id;
       public            postgres    false    226            �           2606    50295 5   facturas_detalles unique_facturas_detalles_id_factura 
   CONSTRAINT     v   ALTER TABLE ONLY public.facturas_detalles
    ADD CONSTRAINT unique_facturas_detalles_id_factura UNIQUE (id_factura);
 _   ALTER TABLE ONLY public.facturas_detalles DROP CONSTRAINT unique_facturas_detalles_id_factura;
       public            postgres    false    226            �           2606    50297    facturas unique_facturas_id 
   CONSTRAINT     T   ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT unique_facturas_id UNIQUE (id);
 E   ALTER TABLE ONLY public.facturas DROP CONSTRAINT unique_facturas_id;
       public            postgres    false    224            �           2606    50299 !   productos unique_productos_codigo 
   CONSTRAINT     ^   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT unique_productos_codigo UNIQUE (codigo);
 K   ALTER TABLE ONLY public.productos DROP CONSTRAINT unique_productos_codigo;
       public            postgres    false    231            �           2606    50301 (   productos unique_productos_codigo_nombre 
   CONSTRAINT     m   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT unique_productos_codigo_nombre UNIQUE (codigo, nombre);
 R   ALTER TABLE ONLY public.productos DROP CONSTRAINT unique_productos_codigo_nombre;
       public            postgres    false    231    231                        2606    50303    productos unique_productos_id 
   CONSTRAINT     V   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT unique_productos_id UNIQUE (id);
 G   ALTER TABLE ONLY public.productos DROP CONSTRAINT unique_productos_id;
       public            postgres    false    231                       2606    50305 !   proveedores unique_proveedores_id 
   CONSTRAINT     Z   ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT unique_proveedores_id UNIQUE (id);
 K   ALTER TABLE ONLY public.proveedores DROP CONSTRAINT unique_proveedores_id;
       public            postgres    false    232                       2606    50309    ventas unique_ventas_id 
   CONSTRAINT     P   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT unique_ventas_id UNIQUE (id);
 A   ALTER TABLE ONLY public.ventas DROP CONSTRAINT unique_ventas_id;
       public            postgres    false    233            	           2606    50311    ventas unique_ventas_id_factura 
   CONSTRAINT     `   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT unique_ventas_id_factura UNIQUE (id_factura);
 I   ALTER TABLE ONLY public.ventas DROP CONSTRAINT unique_ventas_id_factura;
       public            postgres    false    233                       2606    50313 +   ventas_productos unique_ventas_productos_id 
   CONSTRAINT     d   ALTER TABLE ONLY public.ventas_productos
    ADD CONSTRAINT unique_ventas_productos_id UNIQUE (id);
 U   ALTER TABLE ONLY public.ventas_productos DROP CONSTRAINT unique_ventas_productos_id;
       public            postgres    false    236                       2606    50315 ,   ventas_particionado ventas_particionado_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.ventas_particionado
    ADD CONSTRAINT ventas_particionado_pkey PRIMARY KEY (codigo, fecharegistro);
 V   ALTER TABLE ONLY public.ventas_particionado DROP CONSTRAINT ventas_particionado_pkey;
       public            postgres    false    234    234                       2606    50317 J   ventas_particionado_septiembre2024 ventas_particionado_septiembre2024_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ventas_particionado_septiembre2024
    ADD CONSTRAINT ventas_particionado_septiembre2024_pkey PRIMARY KEY (codigo, fecharegistro);
 t   ALTER TABLE ONLY public.ventas_particionado_septiembre2024 DROP CONSTRAINT ventas_particionado_septiembre2024_pkey;
       public            postgres    false    4877    235    235    235                       2606    50319    ventas ventas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pkey;
       public            postgres    false    233                       2606    50321 &   ventas_productos ventas_productos_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.ventas_productos
    ADD CONSTRAINT ventas_productos_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.ventas_productos DROP CONSTRAINT ventas_productos_pkey;
       public            postgres    false    236            �           1259    50322    indiceclientes    INDEX     G   CREATE INDEX indiceclientes ON public.clientes USING btree (tipo_doc);
 "   DROP INDEX public.indiceclientes;
       public            postgres    false    219            �           1259    50323    indicenombredni    INDEX     P   CREATE INDEX indicenombredni ON public.clientes USING btree (nombre, tipo_doc);
 #   DROP INDEX public.indicenombredni;
       public            postgres    false    219    219                       1259    50324    prodcutosproveedor    INDEX     S   CREATE INDEX prodcutosproveedor ON public.proveedores USING btree (tipo_producto);
 &   DROP INDEX public.prodcutosproveedor;
       public            postgres    false    232            ,           0    0    bitacoraventas_enero2021_pkey    INDEX ATTACH     ^   ALTER INDEX public.bitacoraventas_pkey ATTACH PARTITION public.bitacoraventas_enero2021_pkey;
          public          postgres    false    4828    217    4830    4828    217    215            /           0    0    empleados_2020_2021_pkey    INDEX ATTACH     T   ALTER INDEX public.empleados_pkey ATTACH PARTITION public.empleados_2020_2021_pkey;
          public          postgres    false    239    4889    4885    4885    239    237            .           0    0    empleados_antiguos_pkey    INDEX ATTACH     S   ALTER INDEX public.empleados_pkey ATTACH PARTITION public.empleados_antiguos_pkey;
          public          postgres    false    4885    238    4887    4885    238    237            0           0    0    empleados_recientes_pkey    INDEX ATTACH     T   ALTER INDEX public.empleados_pkey ATTACH PARTITION public.empleados_recientes_pkey;
          public          postgres    false    4891    240    4885    4885    240    237            2           0    0    facturas_2020_2021_pkey    INDEX ATTACH     \   ALTER INDEX public.facturas_particion_pkey ATTACH PARTITION public.facturas_2020_2021_pkey;
          public          postgres    false    4897    243    4893    4893    243    241            1           0    0    facturas_antiguas_pkey    INDEX ATTACH     [   ALTER INDEX public.facturas_particion_pkey ATTACH PARTITION public.facturas_antiguas_pkey;
          public          postgres    false    4893    242    4895    4893    242    241            3           0    0    facturas_recientes_pkey    INDEX ATTACH     \   ALTER INDEX public.facturas_particion_pkey ATTACH PARTITION public.facturas_recientes_pkey;
          public          postgres    false    4893    4899    244    4893    244    241            4           0    0    productos_ligeros_pkey    INDEX ATTACH     ^   ALTER INDEX public.productos_particiones_pkey ATTACH PARTITION public.productos_ligeros_pkey;
          public          postgres    false    246    4903    4901    4901    246    245            5           0    0    productos_medianos_pkey    INDEX ATTACH     _   ALTER INDEX public.productos_particiones_pkey ATTACH PARTITION public.productos_medianos_pkey;
          public          postgres    false    247    4905    4901    4901    247    245            6           0    0    productos_pesados_pkey    INDEX ATTACH     ^   ALTER INDEX public.productos_particiones_pkey ATTACH PARTITION public.productos_pesados_pkey;
          public          postgres    false    248    4901    4907    4901    248    245            -           0    0 '   ventas_particionado_septiembre2024_pkey    INDEX ATTACH     m   ALTER INDEX public.ventas_particionado_pkey ATTACH PARTITION public.ventas_particionado_septiembre2024_pkey;
          public          postgres    false    4877    4879    235    4877    235    234            7           2606    50325 /   compras_clientes fk_compras_clientes_id_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.compras_clientes
    ADD CONSTRAINT fk_compras_clientes_id_cliente FOREIGN KEY (id_cliente) REFERENCES public.clientes(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.compras_clientes DROP CONSTRAINT fk_compras_clientes_id_cliente;
       public          postgres    false    221    4832    219            8           2606    50330 -   compras_clientes fk_compras_clientes_id_venta    FK CONSTRAINT     �   ALTER TABLE ONLY public.compras_clientes
    ADD CONSTRAINT fk_compras_clientes_id_venta FOREIGN KEY (id_venta) REFERENCES public.ventas(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.compras_clientes DROP CONSTRAINT fk_compras_clientes_id_venta;
       public          postgres    false    221    233    4871            9           2606    50335 1   facturas_detalles fk_facturas_detalles_id_factura    FK CONSTRAINT     �   ALTER TABLE ONLY public.facturas_detalles
    ADD CONSTRAINT fk_facturas_detalles_id_factura FOREIGN KEY (id_factura) REFERENCES public.facturas(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.facturas_detalles DROP CONSTRAINT fk_facturas_detalles_id_factura;
       public          postgres    false    224    4848    226            :           2606    50340 #   productos fk_productos_id_proveedor    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_id_proveedor FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.productos DROP CONSTRAINT fk_productos_id_proveedor;
       public          postgres    false    231    232    4867            ;           2606    50350    ventas fk_ventas_id_factura    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_ventas_id_factura FOREIGN KEY (id_factura) REFERENCES public.facturas(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.ventas DROP CONSTRAINT fk_ventas_id_factura;
       public          postgres    false    233    224    4848            <           2606    50355 0   ventas_productos fk_ventas_productos_id_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas_productos
    ADD CONSTRAINT fk_ventas_productos_id_producto FOREIGN KEY (id_producto) REFERENCES public.productos(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.ventas_productos DROP CONSTRAINT fk_ventas_productos_id_producto;
       public          postgres    false    231    4858    236            =           2606    50360 -   ventas_productos fk_ventas_productos_id_venta    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas_productos
    ADD CONSTRAINT fk_ventas_productos_id_venta FOREIGN KEY (id_venta) REFERENCES public.ventas(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.ventas_productos DROP CONSTRAINT fk_ventas_productos_id_venta;
       public          postgres    false    233    4871    236            �      x������ � �      �   �  x�e��n�0���W)L�"��%MڴARI��-1I4(�(�63x��U/�+��Dw��s>]^�#S�f�Z�9�4F�������"O�4/"�����4�x�
XC3����/��P5)u���Q?+�ۃ��I�<K�$g�4�dI��bҮKm*�/z�yD���3��X��"I3�B�`F���$勑8�D��7w43���?P�Y�pS��b��ñ�o��j9R�a��$�o,ǻc��{.I	���(�+aj��]��s��0�<��ֻ3R��ӟZk#���ԓD+Hc��r�;��H���ʲ,*�ĳϪ�@^� }@+��«�On�� �4�iC��F#�G��И�ndY�̳�|����GyȢx�r��.m�YV�|��c��--d�p��V�#n�|����
Ϣ�Uz҉Q�<�Z���8�D��h�_P#8:��8�q�Fe���f+�e�q�9�n��Q��qԇ�#�`E�^|i���9�ahi&C�Kᳬ�N"�۫���P�s	.���AJ��|�U�x����X!:7��"���4�>���r���/���.0�s-39�nr��n��(���2����G�`k��D} �k��a	�:x�O:(Dtn��E�M������X>������4�_�~[�<g9rȣ5���_�8���1Qa;0�s="���*b2��d�Z����3      �      x�3�4�4�2�B�=... 
      �   �   x�]�=n�0��>�. A?�dm�%�Q�@�,D�*�������3�b�gh9=px�h�N�o�����-(�G.�����h�GZ�G�=�`���vs9RfJPʺ��{\S�Nť�?�/<� t�m(�3��G�`^��#Zq���m��]�LX1E�g,5�D������7��7�Z��ܜ�K���D�֖���,�'����6�1nJ,5�����g��ۋ��~��W�      �   =  x��WKr�6\C���E����$K�K�UR�+o�H��CN@�*�m����0K?|HP9�
5�<��{���ٻ��������d���$�^��뷌��(+Y3�%�4�Lu�^]�nT+|�8��t�Q2�iT�E����N��a�.�I���V���0�&IV$<cU��4�N;��<|�������L$��xjY�E.8�	�f�Ϻo7ju��������Y���M��z�>�������Nm��\�p��+J.�7�yu���B_��_Qc�
�Dz�nLۯ۝�V��s�,�џ8[��nؽ@	Z�v|R����Z�o�a��+��n�-ڙ}9�%"��,�F��9�<�;���eZ�"���Z�T65(�@u6�OD�br��L+j��d7zc���'�h�0JcUXh�o'A礜:{��1`��gK��N	_ۿ2qb��,��T3(����Ц?��oH9��������pN�@���as����P��U] ��C��y�g�J�)���C��ήU���G�U�ZL��57`�s�=���<i?j�-<�䉚铭y|ĊSC�p�cj�������е�jN"��]&��E�D"m"�~�#p9��*���[[����fd�O���#'�C���v��IҬ �hyēd�`�F��1P�_D���ꦽ��Z/��Lt�\�f���U��u��0f�/�o�*�bO��4K]8O~{�����<26c���u�n�̟�*�ab`��U���{ؓ*bPRw3wWD�������i�����6��������o@�4�p�*�vq�)�)�j�����5QG��#+؈���F�T4%�{E���r�`RW_�ۑ��?�ӂ!�����G��'"��R���S�:�M�]��5z3� 4��X`��Ȫ�s���l0<��M�6�Q�p��w�Gsf�v�_��ff����ҀP�w�x��>��1nܵ�,N�Hm @��Du�~[�}F�T�x?R�v|��� oն���)r������s"�
D�w��d���������� Z{����ss+� �I�Pō�w{�4����2�|#�du#+����e�:�z\��T��Rݟݕ2��"d&�����q=���S���.�je���3�'q�s��+f���>ܒ>�m^���?����-�V� 8goz��H�����Y�}z��"�y����6ڟ�>���cN2��H7{�>��e��������ߎ�3L���jڒ1�ޢ��T��T���sz��
����lz����fP��Aʠf��1���Dm����MD�&����8m+q����ږ<�����ڰj�H�.�M��6Ι+ȇ��]F;�|hΓ��}�USCU_1�廄���	�$;��#-=p�a���Z�`�zΰ���\�XܪpC:�W��=���� �T\��<+X�����f�N&#QȤ8 ��� ";[>ݹ�ǧn pk�ȓll�]�Ӡs��a~������@�y#�r��`0N��`�|o˦ʖ}�R�)�m���Gm��v�د�L��݂���:Vk���_���۞]���S��~q���˷3�$L������_?JWW      �   �   x���=�0��=E/��v�7t`�'`��Rڠ��F�����@��=Y��B�epp��2���h�!�eU7ę�͚��y/i;͒�E	D�sM�FZ��n���7rw�͋=���U�� ���
�����B	1�Z���_���.� �eMSţT}�y�eQ�fC����:��(} �:8/���X�N�Dq�;�$I>�1U.      �   P   x�}ͻ�0�v��?ĳd�9�Ik5j�N���V�����`\@����+t�&J���v'��J[կ̏_�ꞈ� �e�      �      x������ � �      �      x������ � �      �   e   x�3�4�t�t��+.��L�/Rp��K��0�30� �n��!�a���y
��9�
���\F�F�8y��8*8��x���õs����	Cw� � 2d      �      x������ � �      �   �  x��W�nܶ}���Oy:�H�7۵�/M0�H�F�F�#Qv���&5OҺN`X���e�-�(:>����-�_�dY��t����LK��N�׿ͯo�`B��jv̕Ԍ2�4���4�I�b�������+;<4>7���o1~�T��2�ghAo좩�w!� �B�#�8��V��7/�WP�r��'R��9%��$w���sxњ�t�d��_���+ApY�h3S�fvH���V"�U�3��#�����	��j̺wU����fU�颇���̓��2��\��2]2��u�IN\��뚮��K��ɜ����^�\q��DS��
��ًK؋�{1K�������fÀ�
�
��c�G�#��k�)����rIs��$[t'��8���뛺�L��3Lߣ�%�(U�itrs1"w0�|��ܳ���v˴l�X����ig}6x��!Ӓf\�,8h,��y�6Ie3���D�EnuQ�JI����
��!�r�p�	�@`g��3<\���m����ѹ�pߔ������o�P��a�w�;܂�%/�B�H��K��=��Y��i�We�E �fe��(S��|e+�+;_;x�C�(=������G���.��@��������Xp<v�sDn�	_�yo�O���=T�E*��(M�&&���uR��l�q�:�7#y6�Y ֍�t�՛w����0Y�6�6O �dv��.�5`����|����1��k;����0-2J���A5��O��-П��Y�S����7:W?,5R�Djހ��ƻ!�}|q������$H�y�5L	�s"e�f�9�Є:�Ű�F��o�2�뱮�T�o-�(�E��TQ�r����9۱�4���5�d"R4� ��8����@491�w��z Tj��zl*�|�Zڦ^��a�+3�m�_�~��Q�4�����PlXڀd�ԣ��q݃v![���_��b�k�,&gqZ���X@(⧗�@Y�>�L�2�7��n-H!�JX��v_��
����tlK���df˥��у4AaY� ��&4yWÅk.9ٻ[Q!������ӱx:W��`�6�LӅcq�=/L�4�������&��)e;C�UϴniV�s�g����f�����6Y@�t��b6��a��ȼ��x��|����B~��@��9�Y@Q�7�#��*$ aŖQ�f3}��8������r�ML+!��D0A_�1�Y"�g�r���5��؂���@3\z(�A��	ϿB�,�e<j�>�R*���r�&���{��{{��~��D�.�Ȕ*8����9a��+���SL���R�[#�f3�r.��z�E���1c9�����@#o#�M޵p����p𝔱h�����k��ք�C;��/��jl}��'�[В8�,�x�c2՛jF��^X�ع���|@!9웓X^
�~�1?>'{�
1t~�A)��O�����	 ��;@�8'�ize�m=$]h��m�zm<�g������w��`d،FK�چ�KN���.	PsJB�^=A���	Tʀ氏���aB�����p6�)���<�J*�m��s�y.(����Bk	
	FE��b����=�>|����L3��olk�&�ծ]��v	�]4�*[��+(��w����N8|ۈ�B��e���R���      �      x������ � �      �      x������ � �      �      x������ � �      �   �  x���K��0�u�>����u��wԫ�x���@���k��bS���v�HN�W.�?�Re�2��Q��؂ŕ�K��m��x�+����^�Xe��{��7�<n�N��q"Fd����<+/i%�緓LR�ZL.*M%[��R�F����/�8�'%tߟ�^f�%)�TX�O�m!���W�|���q^�B>l�����,��Y^w%��s满�Q~P^ч}�_�]Ɏ*eKyTE~�R\D��X�	^֍\ݠ:"Ě�����KX"˒��3c;��jC?����Si��;fU�؎�u]ךn'ꀏ�x�/ ƉX ��Ng���j���"N�M4�d�+���΅|��N�ž�R�=�/�}��ayVq�Ĳ���V��3eɺp�/	�'�d8���7	w�����k��
�ϟ��޽�����׳�x���������m��pa#�לg�q��o�v#7М0ܐ���!0\��5�nD���F�6��ȍ4nL����N4rc͵7!nbs��5rͅ��7��)t����"�͈��������w�L{�9ysۛ�\ܖw�����r� oa{�����[h���$oi{K���w�-�G�X����p�ƍ��Vڣh��[��8e���{k�Q66�mlo��q��([򶶷N�q��V{��y;���!���6y;�Q<���mo���6z{�Q>�l� ��gQ�����;\��O�V��Kנ      �      x�3�4�4�2�F\ƜF��\1z\\\ !��      �   2   x�32�LO��I-I,�/J��441�4202�5��52���LCp�b���� ]��      �   /   x�3�4B.# i�i�e����	��\�@�(o����qqq �DN     