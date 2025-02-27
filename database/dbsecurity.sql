PGDMP  6                     |         
   dbsecurity    16.1    16.1 @    a           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            b           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            c           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            d           1262    16398 
   dbsecurity    DATABASE     �   CREATE DATABASE dbsecurity WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE dbsecurity;
                postgres    false            �            1255    16527    add_date_to_content()    FUNCTION     �   CREATE FUNCTION public.add_date_to_content() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.date := CURRENT_DATE;
    RETURN NEW;
END;
$$;
 ,   DROP FUNCTION public.add_date_to_content();
       public          postgres    false            �            1255    16529    set_comment_date()    FUNCTION       CREATE FUNCTION public.set_comment_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        NEW.date := CURRENT_DATE;
    ELSIF TG_OP = 'UPDATE' THEN
        NEW.date := CURRENT_DATE;
    END IF;
    RETURN NEW;
END;
$$;
 )   DROP FUNCTION public.set_comment_date();
       public          postgres    false            �            1255    16525    set_course_date()    FUNCTION     �   CREATE FUNCTION public.set_course_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.date := CURRENT_DATE;
    RETURN NEW;
END;
$$;
 (   DROP FUNCTION public.set_course_date();
       public          postgres    false            �            1259    16472 	   bookmarks    TABLE        CREATE TABLE public.bookmarks (
    student_id character varying(20) NOT NULL,
    course_id character varying(20) NOT NULL
);
    DROP TABLE public.bookmarks;
       public         heap    postgres    false            �            1259    16424    courses    TABLE       CREATE TABLE public.courses (
    course_id character varying(20) NOT NULL,
    tutor_id character varying(20) NOT NULL,
    title character varying(50),
    description character varying(50),
    thumbnail character varying(50),
    date date,
    status character varying(50)
);
    DROP TABLE public.courses;
       public         heap    postgres    false            �            1259    16414    tutors    TABLE     �   CREATE TABLE public.tutors (
    tutor_id character varying(20) NOT NULL,
    name character varying(50),
    email character varying(50),
    password character varying(50),
    image character varying(50),
    profession character varying(50)
);
    DROP TABLE public.tutors;
       public         heap    postgres    false            �            1259    16551    bookmarked_courses    VIEW     #  CREATE VIEW public.bookmarked_courses AS
 SELECT bookmarks.student_id,
    courses.course_id,
    courses.title AS course_title,
    courses.date AS course_date,
    courses.thumbnail AS course_thumbnail,
    tutors.name AS tutor_name,
    tutors.image AS tutor_image
   FROM ((public.bookmarks
     JOIN public.courses ON (((bookmarks.course_id)::text = (courses.course_id)::text)))
     JOIN public.tutors ON (((courses.tutor_id)::text = (tutors.tutor_id)::text)))
  WHERE ((courses.status)::text = 'Active'::text)
  ORDER BY courses.date DESC;
 %   DROP VIEW public.bookmarked_courses;
       public          postgres    false    218    218    218    222    222    218    218    218    217    217    217            �            1259    16485    comments    TABLE     )  CREATE TABLE public.comments (
    comment_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    student_id character varying(20) NOT NULL,
    tutor_id character varying(20),
    comment character varying(1000),
    date date,
    user_id character varying(20)
);
    DROP TABLE public.comments;
       public         heap    postgres    false            �            1259    16447    content    TABLE     i  CREATE TABLE public.content (
    content_id character varying(20) NOT NULL,
    tutor_id character varying(20) NOT NULL,
    course_id character varying(20) NOT NULL,
    title character varying(50),
    description character varying(50),
    video character varying(50),
    thumbnail character varying(50),
    date date,
    status character varying(50)
);
    DROP TABLE public.content;
       public         heap    postgres    false            �            1259    16399    students    TABLE     �   CREATE TABLE public.students (
    student_id character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    image character varying(50) NOT NULL
);
    DROP TABLE public.students;
       public         heap    postgres    false            �            1259    16566    content_comments    VIEW     q  CREATE VIEW public.content_comments AS
 SELECT comments.comment_id,
    comments.comment,
    comments.date AS comment_date,
    students.name AS student_name,
    students.image AS student_image,
    comments.content_id
   FROM (public.comments
     JOIN public.students ON (((comments.student_id)::text = (students.student_id)::text)))
  ORDER BY comments.date DESC;
 #   DROP VIEW public.content_comments;
       public          postgres    false    223    215    215    215    223    223    223    223            �            1259    16561    content_details    VIEW     �  CREATE VIEW public.content_details AS
SELECT
    NULL::character varying(20) AS content_id,
    NULL::character varying(50) AS content_title,
    NULL::date AS content_date,
    NULL::character varying(50) AS video_path,
    NULL::character varying(50) AS thumbnail_path,
    NULL::character varying(50) AS description,
    NULL::character varying(50) AS tutor_name,
    NULL::character varying(50) AS tutor_image,
    NULL::character varying(50) AS tutor_profession,
    NULL::bigint AS total_likes;
 "   DROP VIEW public.content_details;
       public          postgres    false            �            1259    16543    course_details    VIEW     v  CREATE VIEW public.course_details AS
 SELECT courses.course_id,
    courses.title,
    courses.date,
    courses.thumbnail,
    tutors.name AS tutor_name,
    tutors.image AS tutor_image
   FROM (public.courses
     JOIN public.tutors ON (((courses.tutor_id)::text = (tutors.tutor_id)::text)))
  WHERE ((courses.status)::text = 'Active'::text)
  ORDER BY courses.date DESC;
 !   DROP VIEW public.course_details;
       public          postgres    false    217    217    218    218    218    218    218    218    217            �            1259    16434    likes    TABLE     �   CREATE TABLE public.likes (
    student_id character varying(20) NOT NULL,
    tutor_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    user_id character varying(20) NOT NULL
);
    DROP TABLE public.likes;
       public         heap    postgres    false            �            1259    16556    liked_videos    VIEW     �  CREATE VIEW public.liked_videos AS
 SELECT likes.user_id,
    content.content_id,
    content.title AS content_title,
    content.date AS content_date,
    content.thumbnail AS content_thumbnail,
    tutors.name AS tutor_name,
    tutors.image AS tutor_image
   FROM ((public.likes
     JOIN public.content ON (((likes.content_id)::text = (content.content_id)::text)))
     JOIN public.tutors ON (((content.tutor_id)::text = (tutors.tutor_id)::text)))
  ORDER BY content.date DESC;
    DROP VIEW public.liked_videos;
       public          postgres    false    217    217    217    219    219    220    220    220    220    220            �            1259    16507    moderator_message    TABLE     �   CREATE TABLE public.moderator_message (
    message_id character varying(20) NOT NULL,
    mod_id character varying(20) NOT NULL,
    student_id character varying(20) NOT NULL,
    message character varying(1000),
    date date
);
 %   DROP TABLE public.moderator_message;
       public         heap    postgres    false            �            1259    16467 
   moderators    TABLE     �   CREATE TABLE public.moderators (
    mod_id character varying(20) NOT NULL,
    name character varying(50),
    email character varying(50),
    password character varying(50),
    image character varying(50)
);
    DROP TABLE public.moderators;
       public         heap    postgres    false            �            1259    16538    student_activity    VIEW     =  CREATE VIEW public.student_activity AS
 SELECT student_id,
    ( SELECT count(*) AS count
           FROM public.likes
          WHERE ((likes.student_id)::text = (student_activity.student_id)::text)) AS total_likes,
    ( SELECT count(*) AS count
           FROM public.comments
          WHERE ((comments.student_id)::text = (student_activity.student_id)::text)) AS total_comments,
    ( SELECT count(*) AS count
           FROM public.bookmarks
          WHERE ((bookmarks.student_id)::text = (student_activity.student_id)::text)) AS total_bookmarked
   FROM ( SELECT DISTINCT likes.student_id
           FROM public.likes
        UNION
         SELECT DISTINCT comments.student_id
           FROM public.comments
        UNION
         SELECT DISTINCT bookmarks.student_id
           FROM public.bookmarks) student_activity;
 #   DROP VIEW public.student_activity;
       public          postgres    false    219    222    223            �            1259    16547    student_comments    VIEW     B  CREATE VIEW public.student_comments AS
 SELECT comments.comment_id,
    comments.comment,
    comments.date AS comment_date,
    comments.user_id,
    content.content_id,
    content.title AS content_title
   FROM (public.comments
     JOIN public.content ON (((comments.content_id)::text = (content.content_id)::text)));
 #   DROP VIEW public.student_comments;
       public          postgres    false    223    223    223    223    220    220    223            �            1259    16575    tutor_latest_courses    VIEW     �  CREATE VIEW public.tutor_latest_courses AS
 SELECT courses.course_id,
    courses.title AS course_title,
    courses.date AS course_date,
    courses.thumbnail AS course_thumbnail,
    tutors.name AS tutor_name,
    tutors.image AS tutor_image
   FROM (public.courses
     JOIN public.tutors ON (((courses.tutor_id)::text = (tutors.tutor_id)::text)))
  WHERE ((courses.status)::text = 'Active'::text)
  ORDER BY courses.date DESC;
 '   DROP VIEW public.tutor_latest_courses;
       public          postgres    false    217    217    217    218    218    218    218    218    218            �            1259    16570    tutor_statistics    VIEW     3  CREATE VIEW public.tutor_statistics AS
 SELECT tutors.tutor_id,
    tutors.name AS tutor_name,
    tutors.image AS tutor_image,
    tutors.profession AS tutor_profession,
    count(courses.course_id) AS total_courses,
    count(content.content_id) AS total_videos_uploaded,
    count(likes.tutor_id) AS total_likes,
    count(comments.comment_id) AS total_comments
   FROM ((((public.tutors
     LEFT JOIN public.courses ON (((tutors.tutor_id)::text = (courses.tutor_id)::text)))
     LEFT JOIN public.content ON (((tutors.tutor_id)::text = (content.tutor_id)::text)))
     LEFT JOIN public.likes ON (((tutors.tutor_id)::text = (likes.tutor_id)::text)))
     LEFT JOIN public.comments ON (((tutors.tutor_id)::text = (comments.tutor_id)::text)))
  GROUP BY tutors.tutor_id, tutors.name, tutors.image, tutors.profession;
 #   DROP VIEW public.tutor_statistics;
       public          postgres    false    218    217    217    217    223    223    220    220    219    218    217            �            1259    16404    users    TABLE       CREATE TABLE public.users (
    user_id character varying(20) NOT NULL,
    student_id character varying(20),
    tutor_id character varying(20),
    mod_id character varying(20),
    email character varying(50),
    password character varying(50),
    role character varying(50)
);
    DROP TABLE public.users;
       public         heap    postgres    false            \          0    16472 	   bookmarks 
   TABLE DATA           :   COPY public.bookmarks (student_id, course_id) FROM stdin;
    public          postgres    false    222   �h       ]          0    16485    comments 
   TABLE DATA           h   COPY public.comments (comment_id, content_id, student_id, tutor_id, comment, date, user_id) FROM stdin;
    public          postgres    false    223   2i       Z          0    16447    content 
   TABLE DATA           v   COPY public.content (content_id, tutor_id, course_id, title, description, video, thumbnail, date, status) FROM stdin;
    public          postgres    false    220   �j       X          0    16424    courses 
   TABLE DATA           c   COPY public.courses (course_id, tutor_id, title, description, thumbnail, date, status) FROM stdin;
    public          postgres    false    218   �m       Y          0    16434    likes 
   TABLE DATA           J   COPY public.likes (student_id, tutor_id, content_id, user_id) FROM stdin;
    public          postgres    false    219   o       ^          0    16507    moderator_message 
   TABLE DATA           Z   COPY public.moderator_message (message_id, mod_id, student_id, message, date) FROM stdin;
    public          postgres    false    224   �o       [          0    16467 
   moderators 
   TABLE DATA           J   COPY public.moderators (mod_id, name, email, password, image) FROM stdin;
    public          postgres    false    221   p       U          0    16399    students 
   TABLE DATA           ;   COPY public.students (student_id, name, image) FROM stdin;
    public          postgres    false    215   3p       W          0    16414    tutors 
   TABLE DATA           T   COPY public.tutors (tutor_id, name, email, password, image, profession) FROM stdin;
    public          postgres    false    217   q       V          0    16404    users 
   TABLE DATA           ]   COPY public.users (user_id, student_id, tutor_id, mod_id, email, password, role) FROM stdin;
    public          postgres    false    216   �q       �           2606    16491    comments Comments_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "Comments_pkey" PRIMARY KEY (comment_id);
 B   ALTER TABLE ONLY public.comments DROP CONSTRAINT "Comments_pkey";
       public            postgres    false    223            �           2606    16451    content Content_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.content
    ADD CONSTRAINT "Content_pkey" PRIMARY KEY (content_id);
 @   ALTER TABLE ONLY public.content DROP CONSTRAINT "Content_pkey";
       public            postgres    false    220            �           2606    16428    courses Courses_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "Courses_pkey" PRIMARY KEY (course_id);
 @   ALTER TABLE ONLY public.courses DROP CONSTRAINT "Courses_pkey";
       public            postgres    false    218            �           2606    16471 &   moderators Student Support Staffs_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT "Student Support Staffs_pkey" PRIMARY KEY (mod_id);
 R   ALTER TABLE ONLY public.moderators DROP CONSTRAINT "Student Support Staffs_pkey";
       public            postgres    false    221            �           2606    16513 ,   moderator_message Support Staff Message_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.moderator_message
    ADD CONSTRAINT "Support Staff Message_pkey" PRIMARY KEY (message_id);
 X   ALTER TABLE ONLY public.moderator_message DROP CONSTRAINT "Support Staff Message_pkey";
       public            postgres    false    224            �           2606    16418    tutors Tutors_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tutors
    ADD CONSTRAINT "Tutors_pkey" PRIMARY KEY (tutor_id);
 >   ALTER TABLE ONLY public.tutors DROP CONSTRAINT "Tutors_pkey";
       public            postgres    false    217            �           2606    16408    users Users_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);
 <   ALTER TABLE ONLY public.users DROP CONSTRAINT "Users_pkey";
       public            postgres    false    216            �           2606    16403    students stduents_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.students
    ADD CONSTRAINT stduents_pkey PRIMARY KEY (student_id);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT stduents_pkey;
       public            postgres    false    215            Q           2618    16564    content_details _RETURN    RULE     �  CREATE OR REPLACE VIEW public.content_details AS
 SELECT content.content_id,
    content.title AS content_title,
    content.date AS content_date,
    content.video AS video_path,
    content.thumbnail AS thumbnail_path,
    content.description,
    tutors.name AS tutor_name,
    tutors.image AS tutor_image,
    tutors.profession AS tutor_profession,
    count(likes.content_id) AS total_likes
   FROM ((public.content
     JOIN public.tutors ON (((content.tutor_id)::text = (tutors.tutor_id)::text)))
     LEFT JOIN public.likes ON (((content.content_id)::text = (likes.content_id)::text)))
  WHERE ((content.status)::text = 'Active'::text)
  GROUP BY content.content_id, tutors.name, tutors.image, tutors.profession
  ORDER BY content.date DESC;
    CREATE OR REPLACE VIEW public.content_details AS
SELECT
    NULL::character varying(20) AS content_id,
    NULL::character varying(50) AS content_title,
    NULL::date AS content_date,
    NULL::character varying(50) AS video_path,
    NULL::character varying(50) AS thumbnail_path,
    NULL::character varying(50) AS description,
    NULL::character varying(50) AS tutor_name,
    NULL::character varying(50) AS tutor_image,
    NULL::character varying(50) AS tutor_profession,
    NULL::bigint AS total_likes;
       public          postgres    false    217    217    217    217    220    220    220    4771    220    220    220    220    220    219    230            �           2620    16528    content content_date_trigger    TRIGGER     �   CREATE TRIGGER content_date_trigger BEFORE INSERT ON public.content FOR EACH ROW EXECUTE FUNCTION public.add_date_to_content();
 5   DROP TRIGGER content_date_trigger ON public.content;
       public          postgres    false    236    220            �           2620    16530 !   comments set_comment_date_trigger    TRIGGER     �   CREATE TRIGGER set_comment_date_trigger BEFORE INSERT OR UPDATE ON public.comments FOR EACH ROW EXECUTE FUNCTION public.set_comment_date();
 :   DROP TRIGGER set_comment_date_trigger ON public.comments;
       public          postgres    false    223    235            �           2620    16526    courses trigger_set_course_date    TRIGGER        CREATE TRIGGER trigger_set_course_date BEFORE INSERT ON public.courses FOR EACH ROW EXECUTE FUNCTION public.set_course_date();
 8   DROP TRIGGER trigger_set_course_date ON public.courses;
       public          postgres    false    234    218            �           2606    16480 "   bookmarks Bookmarks_Course ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT "Bookmarks_Course ID_fkey" FOREIGN KEY (course_id) REFERENCES public.courses(course_id) NOT VALID;
 N   ALTER TABLE ONLY public.bookmarks DROP CONSTRAINT "Bookmarks_Course ID_fkey";
       public          postgres    false    4769    218    222            �           2606    16475 #   bookmarks Bookmarks_Student ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT "Bookmarks_Student ID_fkey" FOREIGN KEY (student_id) REFERENCES public.students(student_id);
 O   ALTER TABLE ONLY public.bookmarks DROP CONSTRAINT "Bookmarks_Student ID_fkey";
       public          postgres    false    222    4763    215            �           2606    16492 !   comments Comments_Content ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "Comments_Content ID_fkey" FOREIGN KEY (content_id) REFERENCES public.content(content_id);
 M   ALTER TABLE ONLY public.comments DROP CONSTRAINT "Comments_Content ID_fkey";
       public          postgres    false    4771    223    220            �           2606    16497 !   comments Comments_Student ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "Comments_Student ID_fkey" FOREIGN KEY (student_id) REFERENCES public.students(student_id) NOT VALID;
 M   ALTER TABLE ONLY public.comments DROP CONSTRAINT "Comments_Student ID_fkey";
       public          postgres    false    215    223    4763            �           2606    16502    comments Comments_Tutor ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "Comments_Tutor ID_fkey" FOREIGN KEY (tutor_id) REFERENCES public.tutors(tutor_id) NOT VALID;
 K   ALTER TABLE ONLY public.comments DROP CONSTRAINT "Comments_Tutor ID_fkey";
       public          postgres    false    223    217    4767            �           2606    16457    content Content_Course ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.content
    ADD CONSTRAINT "Content_Course ID_fkey" FOREIGN KEY (course_id) REFERENCES public.courses(course_id) NOT VALID;
 J   ALTER TABLE ONLY public.content DROP CONSTRAINT "Content_Course ID_fkey";
       public          postgres    false    220    218    4769            �           2606    16452    content Content_Tutor ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.content
    ADD CONSTRAINT "Content_Tutor ID_fkey" FOREIGN KEY (tutor_id) REFERENCES public.tutors(tutor_id);
 I   ALTER TABLE ONLY public.content DROP CONSTRAINT "Content_Tutor ID_fkey";
       public          postgres    false    217    4767    220            �           2606    16429    courses Courses_Tutor ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "Courses_Tutor ID_fkey" FOREIGN KEY (tutor_id) REFERENCES public.tutors(tutor_id);
 I   ALTER TABLE ONLY public.courses DROP CONSTRAINT "Courses_Tutor ID_fkey";
       public          postgres    false    4767    218    217            �           2606    16462    likes Likes_Content ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "Likes_Content ID_fkey" FOREIGN KEY (content_id) REFERENCES public.content(content_id) NOT VALID;
 G   ALTER TABLE ONLY public.likes DROP CONSTRAINT "Likes_Content ID_fkey";
       public          postgres    false    220    4771    219            �           2606    16437    likes Likes_Student ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "Likes_Student ID_fkey" FOREIGN KEY (student_id) REFERENCES public.students(student_id);
 G   ALTER TABLE ONLY public.likes DROP CONSTRAINT "Likes_Student ID_fkey";
       public          postgres    false    219    4763    215            �           2606    16442    likes Likes_Tutor ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "Likes_Tutor ID_fkey" FOREIGN KEY (tutor_id) REFERENCES public.tutors(tutor_id) NOT VALID;
 E   ALTER TABLE ONLY public.likes DROP CONSTRAINT "Likes_Tutor ID_fkey";
       public          postgres    false    217    4767    219            �           2606    16514 5   moderator_message Support Staff Message_Staff ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.moderator_message
    ADD CONSTRAINT "Support Staff Message_Staff ID_fkey" FOREIGN KEY (mod_id) REFERENCES public.moderators(mod_id);
 a   ALTER TABLE ONLY public.moderator_message DROP CONSTRAINT "Support Staff Message_Staff ID_fkey";
       public          postgres    false    221    4773    224            �           2606    16519 7   moderator_message Support Staff Message_Student ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.moderator_message
    ADD CONSTRAINT "Support Staff Message_Student ID_fkey" FOREIGN KEY (student_id) REFERENCES public.students(student_id) NOT VALID;
 c   ALTER TABLE ONLY public.moderator_message DROP CONSTRAINT "Support Staff Message_Student ID_fkey";
       public          postgres    false    224    215    4763            �           2606    16409    users Users_Student ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_Student ID_fkey" FOREIGN KEY (student_id) REFERENCES public.students(student_id);
 G   ALTER TABLE ONLY public.users DROP CONSTRAINT "Users_Student ID_fkey";
       public          postgres    false    4763    216    215            �           2606    16419    users Users_Tutor ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_Tutor ID_fkey" FOREIGN KEY (tutor_id) REFERENCES public.tutors(tutor_id) NOT VALID;
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT "Users_Tutor ID_fkey";
       public          postgres    false    216    4767    217            �           2606    16533    users users_mod_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_mod_id_fkey FOREIGN KEY (mod_id) REFERENCES public.moderators(mod_id) NOT VALID;
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_mod_id_fkey;
       public          postgres    false    216    4773    221            \   �   x��0Oq�K/�p426��-7�1�4/v�6�+1�0	,,,L�
�*7))��.��tLt4�L��p�H��4q4�,�����(t*��f&�*���\sJM-��]��-݊�����4I���
�	�J
Nv��*��N�fbU���=... �_�      ]   �  x���ˎ�@��uq��
ڥ��� ��7���P�HI_�8��dә+x���)��V_#,)��m�@vDbe�]��T�9���{4�.�E�ж�m#��7�nX��f�d��R�b�X�U �Py�r���;G�З��^8�@X�F'YfS���y�4;`�J�BE{ʪs�i
��7��4M��/g�+�.��ڄs�`��4�X�c�\�FW��|e1ߦ\	���;���?�mo^�Ѽ�雘�贏������C�\q*;�^{����?�w��q������6'���xL��]�IQ#"�^Ʒ����}LI�_,Q*�aa��p�)���a(?&�H��t��8�:VID�
j�VN��ǲ�iUjzM�^���x�%{y���!�/����      Z   �  x���K��@��5�+&��t�@�%X �  ��Z��E�˯���d��t/�o�$�M��Uzu�𶣯P��fi~e�D�:�l֫�>�f�I�z���E+H#w��m����㏟̧�w#��#̌��݀�˚��YZC�V���$��,0���z� �_4��Д�t�����C\6��ݤ�,�E�T!I�)��xX���v�H��J̝q�kE��Yݎ�<��Ԧ^#߂���=��_䱟*,�b�SF�k!c�k|�:ZfD��m�3���ܼ�%UNo&_�~����$�o*��z')yٝ�����^��h�,U��f�t����|+z^�Et��p<�Z��NB���� R�/�eG�#���d��<aG9��2vY�|>���I��v�wC]L�u��U�Y�ĳ!�By�'��z�/a?iP���^�5�12��	�WSq���r<NLR#��ҵ�7��s�Y۬��A��g~׻�qw4�9&��wn"W�F��{�&mVw��l����9Y��ntG�2UyP��ЕFDݺ�g�C/�C͏�L�m��l��Z4|�
�n=���iM�2f]E���R'�$}����VM8}|Ae�(6ۛ�"p�4�|��>ݮ�|��j�k�~f�.���ѠC!lV���y�V���;/6�O�]��(�Qx���[T���ۖ/1+琥���j��A=�N���~T�b(�oq����������      X   Z  x����n�@ ����h 1�ъ@��^\�Xy�ֶ$m��:3�|�I��|�Q#8�.�m$#q�y
'S=<�#�^��d4�C�$�B-��::a�@��e�!��(Ma�o��үqy��p�u����pd��"}"�����N?�@�Yt�=�l�#QW͡&�2	���-�����7Y���=�)���Q���yL=q�ɫT��w˭�4�4�:���[-����~�*D�WF�$ܫ���Hg�,�X`$`j�?��7�{{�{�YPoni�_��w2-�#���8Ļ�q�g�J�[�c�
]��e?_ԗ��[�ʷ�6Yٞ��ǰ��}��      Y   �   x���MR�0 @�5�I!B���8�	�h*�L ���{�߼��<Y,��W{nŕJ��%�X�)n���~�ac ��2x�;l��F���倿���#��gS����ȚZ���o�%��u�m2�};f̳l�*���y���M��n#�z��9o�;s)J
���fuj���q�B'����Z�$ox�4;([��Ĺ�[
[�.Ŷ��d��C�^      ^      x������ � �      [      x������ � �      U   �   x�u�Kr�0  �59'`�0����H*q�I�L ���3����S��P!vi.���7��F�PifM۷�YX�O5��|�4ë�g�w��Y�j+Pzܗ�p(�چ%�'q_$٪���Oμ(·����Oh���D�"������E�>��l��G'��Zb����C��}�(��^��xWB�G��4	�w3��^�e>�d�}��o �yV�      W   �   x���=��0 �:��0aٰڭ.Έ������$�DdC��ߟ���uﰛ��y̛��+i�<<��S;�N�
Ǩqh�������UQ��|T���D!��CD$|[ � � gc �=�i��G�ܔ��������+�����xǮ-W�4�����H;t��7;��0Yd���`[DSVi+6��&�Z���w������ �W�      V   M  x���Ɏ�@��5<�)(�v���n5njb�,@)��;�ʵ&wu�˟����ջw��;�V��6e�m]��.���rX>��@�*�O#�
e0@3Ll� ��L�CZQ�`S�+��(k����"�@�)��Ϝ�<P�Z�2v�c�3n�P�L<_ӪS�'��I�ީ�8��Y�<���H�D��D��M�(_�t!ۭ�$��,����MieM�j��Mw{�$�AԤB�;�f��E�AØԼſa4�֋@*���"����\kG�H��T�J�a�{qJ�$[��hO����W?��
���,����p�<�TU��2��     