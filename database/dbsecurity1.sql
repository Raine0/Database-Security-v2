toc.dat                                                                                             0000600 0004000 0002000 00000043334 14562441620 0014452 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                        |         
   dbsecurity    16.1    16.1 5    3           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         4           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         5           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         6           1262    16398 
   dbsecurity    DATABASE     �   CREATE DATABASE dbsecurity WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE dbsecurity;
                postgres    false         �            1255    16527    add_date_to_content()    FUNCTION     �   CREATE FUNCTION public.add_date_to_content() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.date := CURRENT_DATE;
    RETURN NEW;
END;
$$;
 ,   DROP FUNCTION public.add_date_to_content();
       public          postgres    false         �            1255    16529    set_comment_date()    FUNCTION       CREATE FUNCTION public.set_comment_date() RETURNS trigger
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
       public          postgres    false         �            1255    16525    set_course_date()    FUNCTION     �   CREATE FUNCTION public.set_course_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.date := CURRENT_DATE;
    RETURN NEW;
END;
$$;
 (   DROP FUNCTION public.set_course_date();
       public          postgres    false         �            1259    16472 	   bookmarks    TABLE        CREATE TABLE public.bookmarks (
    student_id character varying(20) NOT NULL,
    course_id character varying(20) NOT NULL
);
    DROP TABLE public.bookmarks;
       public         heap    postgres    false         �            1259    16485    comments    TABLE     )  CREATE TABLE public.comments (
    comment_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    student_id character varying(20) NOT NULL,
    tutor_id character varying(20),
    comment character varying(1000),
    date date,
    user_id character varying(20)
);
    DROP TABLE public.comments;
       public         heap    postgres    false         �            1259    16447    content    TABLE     i  CREATE TABLE public.content (
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
       public         heap    postgres    false         �            1259    16424    courses    TABLE       CREATE TABLE public.courses (
    course_id character varying(20) NOT NULL,
    tutor_id character varying(20) NOT NULL,
    title character varying(50),
    description character varying(50),
    thumbnail character varying(50),
    date date,
    status character varying(50)
);
    DROP TABLE public.courses;
       public         heap    postgres    false         �            1259    16434    likes    TABLE     �   CREATE TABLE public.likes (
    student_id character varying(20) NOT NULL,
    tutor_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    user_id character varying(20) NOT NULL
);
    DROP TABLE public.likes;
       public         heap    postgres    false         �            1259    16467    student_support_staffs    TABLE     �   CREATE TABLE public.student_support_staffs (
    staff_id character varying(20) NOT NULL,
    name character varying(50),
    email character varying(50),
    password character varying(50),
    image character varying(50)
);
 *   DROP TABLE public.student_support_staffs;
       public         heap    postgres    false         �            1259    16399    students    TABLE     �   CREATE TABLE public.students (
    student_id character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    image character varying(50) NOT NULL
);
    DROP TABLE public.students;
       public         heap    postgres    false         �            1259    16507    support_staff_message    TABLE     �   CREATE TABLE public.support_staff_message (
    message_id character varying(20) NOT NULL,
    staff_id character varying(20) NOT NULL,
    student_id character varying(20) NOT NULL,
    message character varying(1000),
    date date
);
 )   DROP TABLE public.support_staff_message;
       public         heap    postgres    false         �            1259    16414    tutors    TABLE     �   CREATE TABLE public.tutors (
    tutor_id character varying(20) NOT NULL,
    name character varying(50),
    email character varying(50),
    password character varying(50),
    image character varying(50),
    profession character varying(50)
);
    DROP TABLE public.tutors;
       public         heap    postgres    false         �            1259    16404    users    TABLE       CREATE TABLE public.users (
    user_id character varying(20) NOT NULL,
    student_id character varying(20),
    tutor_id character varying(20),
    staff_id character varying(20),
    email character varying(50),
    password character varying(50),
    role character varying(50)
);
    DROP TABLE public.users;
       public         heap    postgres    false         .          0    16472 	   bookmarks 
   TABLE DATA           :   COPY public.bookmarks (student_id, course_id) FROM stdin;
    public          postgres    false    222       4910.dat /          0    16485    comments 
   TABLE DATA           h   COPY public.comments (comment_id, content_id, student_id, tutor_id, comment, date, user_id) FROM stdin;
    public          postgres    false    223       4911.dat ,          0    16447    content 
   TABLE DATA           v   COPY public.content (content_id, tutor_id, course_id, title, description, video, thumbnail, date, status) FROM stdin;
    public          postgres    false    220       4908.dat *          0    16424    courses 
   TABLE DATA           c   COPY public.courses (course_id, tutor_id, title, description, thumbnail, date, status) FROM stdin;
    public          postgres    false    218       4906.dat +          0    16434    likes 
   TABLE DATA           J   COPY public.likes (student_id, tutor_id, content_id, user_id) FROM stdin;
    public          postgres    false    219       4907.dat -          0    16467    student_support_staffs 
   TABLE DATA           X   COPY public.student_support_staffs (staff_id, name, email, password, image) FROM stdin;
    public          postgres    false    221       4909.dat '          0    16399    students 
   TABLE DATA           ;   COPY public.students (student_id, name, image) FROM stdin;
    public          postgres    false    215       4903.dat 0          0    16507    support_staff_message 
   TABLE DATA           `   COPY public.support_staff_message (message_id, staff_id, student_id, message, date) FROM stdin;
    public          postgres    false    224       4912.dat )          0    16414    tutors 
   TABLE DATA           T   COPY public.tutors (tutor_id, name, email, password, image, profession) FROM stdin;
    public          postgres    false    217       4905.dat (          0    16404    users 
   TABLE DATA           _   COPY public.users (user_id, student_id, tutor_id, staff_id, email, password, role) FROM stdin;
    public          postgres    false    216       4904.dat �           2606    16491    comments Comments_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "Comments_pkey" PRIMARY KEY (comment_id);
 B   ALTER TABLE ONLY public.comments DROP CONSTRAINT "Comments_pkey";
       public            postgres    false    223                    2606    16451    content Content_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.content
    ADD CONSTRAINT "Content_pkey" PRIMARY KEY (content_id);
 @   ALTER TABLE ONLY public.content DROP CONSTRAINT "Content_pkey";
       public            postgres    false    220         }           2606    16428    courses Courses_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "Courses_pkey" PRIMARY KEY (course_id);
 @   ALTER TABLE ONLY public.courses DROP CONSTRAINT "Courses_pkey";
       public            postgres    false    218         �           2606    16471 2   student_support_staffs Student Support Staffs_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.student_support_staffs
    ADD CONSTRAINT "Student Support Staffs_pkey" PRIMARY KEY (staff_id);
 ^   ALTER TABLE ONLY public.student_support_staffs DROP CONSTRAINT "Student Support Staffs_pkey";
       public            postgres    false    221         �           2606    16513 0   support_staff_message Support Staff Message_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.support_staff_message
    ADD CONSTRAINT "Support Staff Message_pkey" PRIMARY KEY (message_id);
 \   ALTER TABLE ONLY public.support_staff_message DROP CONSTRAINT "Support Staff Message_pkey";
       public            postgres    false    224         {           2606    16418    tutors Tutors_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tutors
    ADD CONSTRAINT "Tutors_pkey" PRIMARY KEY (tutor_id);
 >   ALTER TABLE ONLY public.tutors DROP CONSTRAINT "Tutors_pkey";
       public            postgres    false    217         y           2606    16408    users Users_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);
 <   ALTER TABLE ONLY public.users DROP CONSTRAINT "Users_pkey";
       public            postgres    false    216         w           2606    16403    students stduents_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.students
    ADD CONSTRAINT stduents_pkey PRIMARY KEY (student_id);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT stduents_pkey;
       public            postgres    false    215         �           2620    16528    content content_date_trigger    TRIGGER     �   CREATE TRIGGER content_date_trigger BEFORE INSERT ON public.content FOR EACH ROW EXECUTE FUNCTION public.add_date_to_content();
 5   DROP TRIGGER content_date_trigger ON public.content;
       public          postgres    false    227    220         �           2620    16530 !   comments set_comment_date_trigger    TRIGGER     �   CREATE TRIGGER set_comment_date_trigger BEFORE INSERT OR UPDATE ON public.comments FOR EACH ROW EXECUTE FUNCTION public.set_comment_date();
 :   DROP TRIGGER set_comment_date_trigger ON public.comments;
       public          postgres    false    226    223         �           2620    16526    courses trigger_set_course_date    TRIGGER        CREATE TRIGGER trigger_set_course_date BEFORE INSERT ON public.courses FOR EACH ROW EXECUTE FUNCTION public.set_course_date();
 8   DROP TRIGGER trigger_set_course_date ON public.courses;
       public          postgres    false    218    225         �           2606    16480 "   bookmarks Bookmarks_Course ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT "Bookmarks_Course ID_fkey" FOREIGN KEY (course_id) REFERENCES public.courses(course_id) NOT VALID;
 N   ALTER TABLE ONLY public.bookmarks DROP CONSTRAINT "Bookmarks_Course ID_fkey";
       public          postgres    false    4733    222    218         �           2606    16475 #   bookmarks Bookmarks_Student ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT "Bookmarks_Student ID_fkey" FOREIGN KEY (student_id) REFERENCES public.students(student_id);
 O   ALTER TABLE ONLY public.bookmarks DROP CONSTRAINT "Bookmarks_Student ID_fkey";
       public          postgres    false    215    222    4727         �           2606    16492 !   comments Comments_Content ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "Comments_Content ID_fkey" FOREIGN KEY (content_id) REFERENCES public.content(content_id);
 M   ALTER TABLE ONLY public.comments DROP CONSTRAINT "Comments_Content ID_fkey";
       public          postgres    false    4735    223    220         �           2606    16497 !   comments Comments_Student ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "Comments_Student ID_fkey" FOREIGN KEY (student_id) REFERENCES public.students(student_id) NOT VALID;
 M   ALTER TABLE ONLY public.comments DROP CONSTRAINT "Comments_Student ID_fkey";
       public          postgres    false    215    4727    223         �           2606    16502    comments Comments_Tutor ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "Comments_Tutor ID_fkey" FOREIGN KEY (tutor_id) REFERENCES public.tutors(tutor_id) NOT VALID;
 K   ALTER TABLE ONLY public.comments DROP CONSTRAINT "Comments_Tutor ID_fkey";
       public          postgres    false    223    217    4731         �           2606    16457    content Content_Course ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.content
    ADD CONSTRAINT "Content_Course ID_fkey" FOREIGN KEY (course_id) REFERENCES public.courses(course_id) NOT VALID;
 J   ALTER TABLE ONLY public.content DROP CONSTRAINT "Content_Course ID_fkey";
       public          postgres    false    4733    218    220         �           2606    16452    content Content_Tutor ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.content
    ADD CONSTRAINT "Content_Tutor ID_fkey" FOREIGN KEY (tutor_id) REFERENCES public.tutors(tutor_id);
 I   ALTER TABLE ONLY public.content DROP CONSTRAINT "Content_Tutor ID_fkey";
       public          postgres    false    220    4731    217         �           2606    16429    courses Courses_Tutor ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "Courses_Tutor ID_fkey" FOREIGN KEY (tutor_id) REFERENCES public.tutors(tutor_id);
 I   ALTER TABLE ONLY public.courses DROP CONSTRAINT "Courses_Tutor ID_fkey";
       public          postgres    false    4731    218    217         �           2606    16462    likes Likes_Content ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "Likes_Content ID_fkey" FOREIGN KEY (content_id) REFERENCES public.content(content_id) NOT VALID;
 G   ALTER TABLE ONLY public.likes DROP CONSTRAINT "Likes_Content ID_fkey";
       public          postgres    false    219    4735    220         �           2606    16437    likes Likes_Student ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "Likes_Student ID_fkey" FOREIGN KEY (student_id) REFERENCES public.students(student_id);
 G   ALTER TABLE ONLY public.likes DROP CONSTRAINT "Likes_Student ID_fkey";
       public          postgres    false    219    215    4727         �           2606    16442    likes Likes_Tutor ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "Likes_Tutor ID_fkey" FOREIGN KEY (tutor_id) REFERENCES public.tutors(tutor_id) NOT VALID;
 E   ALTER TABLE ONLY public.likes DROP CONSTRAINT "Likes_Tutor ID_fkey";
       public          postgres    false    217    4731    219         �           2606    16514 9   support_staff_message Support Staff Message_Staff ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.support_staff_message
    ADD CONSTRAINT "Support Staff Message_Staff ID_fkey" FOREIGN KEY (staff_id) REFERENCES public.student_support_staffs(staff_id);
 e   ALTER TABLE ONLY public.support_staff_message DROP CONSTRAINT "Support Staff Message_Staff ID_fkey";
       public          postgres    false    224    221    4737         �           2606    16519 ;   support_staff_message Support Staff Message_Student ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.support_staff_message
    ADD CONSTRAINT "Support Staff Message_Student ID_fkey" FOREIGN KEY (student_id) REFERENCES public.students(student_id) NOT VALID;
 g   ALTER TABLE ONLY public.support_staff_message DROP CONSTRAINT "Support Staff Message_Student ID_fkey";
       public          postgres    false    4727    224    215         �           2606    16409    users Users_Student ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_Student ID_fkey" FOREIGN KEY (student_id) REFERENCES public.students(student_id);
 G   ALTER TABLE ONLY public.users DROP CONSTRAINT "Users_Student ID_fkey";
       public          postgres    false    215    4727    216         �           2606    16419    users Users_Tutor ID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_Tutor ID_fkey" FOREIGN KEY (tutor_id) REFERENCES public.tutors(tutor_id) NOT VALID;
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT "Users_Tutor ID_fkey";
       public          postgres    false    4731    216    217                                                                                                                                                                                                                                                                                                            4910.dat                                                                                            0000600 0004000 0002000 00000000327 14562441620 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        X7dCngpQXA230XYUw4L6	y7sGWK1mVt3x4QqqqdzV
w4tpJkSuNIAaA7YdmmPD	PgPLi4A4JxYuolHkhqBt
X7dCngpQXA230XYUw4L6	PgPLi4A4JxYuolHkhqBt
X7dCngpQXA230XYUw4L6	ZVnzElu59NWDzAo9FsKj
X7dCngpQXA230XYUw4L6	i4eKYjQhTTYRbScAknRs
\.


                                                                                                                                                                                                                                                                                                         4911.dat                                                                                            0000600 0004000 0002000 00000001000 14562441620 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        L1M1gmBTbd14eyb9MGEM	3H0hGzWEodnR6XsU0nC9	w4tpJkSuNIAaA7YdmmPD	QM8KkVoPdh7CIhZP3Tpw	haha boang	2024-02-12	bHnee9HikobzIJBJSLHt
hopTbq2PEDlaxGsrNllZ	CG4SQbamqWgrMdkU25wQ	w4tpJkSuNIAaA7YdmmPD	QM8KkVoPdh7CIhZP3Tpw	eyyy nice one	2024-02-12	bHnee9HikobzIJBJSLHt
Jc7bVM91fGOhopl7tLED	3H0hGzWEodnR6XsU0nC9	X7dCngpQXA230XYUw4L6	QM8KkVoPdh7CIhZP3Tpw	Hahatdog	2024-02-12	UmpDs0vDxpU80UxkycRb
FdKXxwMCrgwk3HeBjJhq	3H0hGzWEodnR6XsU0nC9	X7dCngpQXA230XYUw4L6	QM8KkVoPdh7CIhZP3Tpw	haha eyy	2024-02-12	UmpDs0vDxpU80UxkycRb
\.


4908.dat                                                                                            0000600 0004000 0002000 00000003145 14562441620 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3H0hGzWEodnR6XsU0nC9	QM8KkVoPdh7CIhZP3Tpw	PgPLi4A4JxYuolHkhqBt	HTML Guide #1	HTML Guide #1	6UxGNadGWW17z1LdmtwG.mp4	HzAJCEsmLQKQhjaBiWK6.png	2024-02-10	Active
CG4SQbamqWgrMdkU25wQ	QM8KkVoPdh7CIhZP3Tpw	PgPLi4A4JxYuolHkhqBt	HTML Guide #2	HTML Guide #2	XhdCfjuJQwFEwOPSQxhX.mp4	oc1Q4gQrVHkr86kzEOx8.png	2024-02-10	Active
QWuPArdTqBsWo3VXY2nB	QM8KkVoPdh7CIhZP3Tpw	PgPLi4A4JxYuolHkhqBt	HTML Guide #3	HTML Guide #3	XmXkyzd1ABp7GGKzYH7C.mp4	tPCNLZhh3c6rjj1Nvf8M.png	2024-02-10	Active
couXy46Ph1jJWwYyvJRb	RkhWBsE01aItADjmtfKk	ZVnzElu59NWDzAo9FsKj	CSS Guide #1	CSS Guide #1	6r9TTrOG0aH2XxfXHtd2.mp4	EwXI0yIaK2AoI5D8uCx1.png	2024-02-12	Active
I7APz8jc3xBWp28aS3Bh	RkhWBsE01aItADjmtfKk	ZVnzElu59NWDzAo9FsKj	CSS Guide #2	CSS Guide #2	TEucWVaPtVtwpkykNlTK.mp4	liolSR5zhTPCQAX9Cwjm.png	2024-02-12	Active
AXgpMI8CuyHC7CwESrTm	RkhWBsE01aItADjmtfKk	ZVnzElu59NWDzAo9FsKj	CSS Guide #3	CSS Guide #3	ihFCch9pjQoyke2m7Zm0.mp4	2jQxy1cpeZThUdJNuqA3.png	2024-02-12	Active
j4kgHMFKR3B2oDEg6UuS	RkhWBsE01aItADjmtfKk	i4eKYjQhTTYRbScAknRs	JavaScript Guide #1	JavaScript Guide #1	vLNTCPzc5CiPqIRAiiED.mp4	53SCwRKIDq9GtJkBz7TG.png	2024-02-12	Active
wp6xazhxOXXdMi5QOHZw	RkhWBsE01aItADjmtfKk	i4eKYjQhTTYRbScAknRs	JavaScript Guide #2	JavaScript Guide #2	uGab9EtHqmE1LpoZoeGs.mp4	5yGRcukG7ifroqXxWA0e.png	2024-02-12	Active
3OGaLrsDEGL24SM2qlc2	RkhWBsE01aItADjmtfKk	i4eKYjQhTTYRbScAknRs	JavaScript Guide #3	JavaScript Guide #3	nWznB3oxapTvg3vFtWlJ.mp4	xK0X7XqF5GFsIRLlOoVN.png	2024-02-12	Active
AlP6uymvDpjZi6GXnQ9f	RkhWBsE01aItADjmtfKk	i4eKYjQhTTYRbScAknRs	JavaScript Guide #4	JavaScript Guide #4	6PNVA1FRbidQNYPEuCiZ.mp4	effNgNQVZpGkwkDhuOQr.png	2024-02-12	Active
\.


                                                                                                                                                                                                                                                                                                                                                                                                                           4906.dat                                                                                            0000600 0004000 0002000 00000001107 14562441620 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        y7sGWK1mVt3x4QqqqdzV	QM8KkVoPdh7CIhZP3Tpw	Complete Pro Raze Guide	A course that will make you a pro raze player!	ufBj8OYZtdipaI78V1IL.jpg	2024-01-25	Active
PgPLi4A4JxYuolHkhqBt	QM8KkVoPdh7CIhZP3Tpw	Complete HTML Guide	A complete html guide for beginners!	95pb4GE9Jl80Sq1VxRVs.png	2024-02-10	Active
ZVnzElu59NWDzAo9FsKj	RkhWBsE01aItADjmtfKk	CSS Guide for Beginners	CSS Guide for Beginners	CbLhxGpbFREmcq1wXoCq.png	2024-02-12	Active
i4eKYjQhTTYRbScAknRs	RkhWBsE01aItADjmtfKk	JavaScript Guide for Beginners	JavaScript Guide for Beginners	v7IbfO1snO3zkJfmWtqT.png	2024-02-12	Active
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                         4907.dat                                                                                            0000600 0004000 0002000 00000000401 14562441620 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        w4tpJkSuNIAaA7YdmmPD	QM8KkVoPdh7CIhZP3Tpw	3H0hGzWEodnR6XsU0nC9	bHnee9HikobzIJBJSLHt
w4tpJkSuNIAaA7YdmmPD	QM8KkVoPdh7CIhZP3Tpw	CG4SQbamqWgrMdkU25wQ	bHnee9HikobzIJBJSLHt
X7dCngpQXA230XYUw4L6	QM8KkVoPdh7CIhZP3Tpw	3H0hGzWEodnR6XsU0nC9	UmpDs0vDxpU80UxkycRb
\.


                                                                                                                                                                                                                                                               4909.dat                                                                                            0000600 0004000 0002000 00000000005 14562441620 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4903.dat                                                                                            0000600 0004000 0002000 00000000415 14562441620 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        dM0MJ0oAbeheD8bbBtkJ	Ryan Philip T. Cataag	HYUvrtbU1QCDTZ0lk4ns.jfif
X7dCngpQXA230XYUw4L6	Ryan Philip T. Cataag	P1lVs2W4uyoYd93yhRdf.jfif
akHqd37jgMAt976FA3TH	Ryan Philip T. Cataag	bObyznbrcvIaULfnHCT0.jpg
w4tpJkSuNIAaA7YdmmPD	Gojo Satoru	LUID68qNiljqXRuYLF7K.jpg
\.


                                                                                                                                                                                                                                                   4912.dat                                                                                            0000600 0004000 0002000 00000000005 14562441620 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4905.dat                                                                                            0000600 0004000 0002000 00000000415 14562441620 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        QM8KkVoPdh7CIhZP3Tpw	Natsuki Subaru	natsumichan@gmail.com	40bd001563085fc35165329ea1ff5c5ecbdbbeef	bNcpKYOrwPAHWYrqtaSP.jpeg	Developer
RkhWBsE01aItADjmtfKk	Rimuru Tempest	rimuru@gmail.com	40bd001563085fc35165329ea1ff5c5ecbdbbeef	JS6sOYptfHZvZ5IEiVoO.jpg	Developer
\.


                                                                                                                                                                                                                                                   4904.dat                                                                                            0000600 0004000 0002000 00000001263 14562441620 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        UmpDs0vDxpU80UxkycRb	X7dCngpQXA230XYUw4L6	\N	\N	ryan3@gmail.com	40bd001563085fc35165329ea1ff5c5ecbdbbeef	Student
oMqfPh0JTg2nsQ9f0tUH	akHqd37jgMAt976FA3TH	\N	\N	ryan2@gmail.com	40bd001563085fc35165329ea1ff5c5ecbdbbeef	Student
ODE11hlPbBEtk26cQs9i	dM0MJ0oAbeheD8bbBtkJ	\N	\N	ryancataag@gmail.com	40bd001563085fc35165329ea1ff5c5ecbdbbeef	Student
3QdFCyyJO4vEPLtoX19O	\N	QM8KkVoPdh7CIhZP3Tpw	\N	natsumichan@gmail.com	40bd001563085fc35165329ea1ff5c5ecbdbbeef	Tutor
bHnee9HikobzIJBJSLHt	w4tpJkSuNIAaA7YdmmPD	\N	\N	ryan1@gmail.com	40bd001563085fc35165329ea1ff5c5ecbdbbeef	Student
DebDcm8LlOoOQNPRJZdQ	\N	RkhWBsE01aItADjmtfKk	\N	rimuru@gmail.com	40bd001563085fc35165329ea1ff5c5ecbdbbeef	Tutor
\.


                                                                                                                                                                                                                                                                                                                                             restore.sql                                                                                         0000600 0004000 0002000 00000035073 14562441620 0015400 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE dbsecurity;
--
-- Name: dbsecurity; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dbsecurity WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE dbsecurity OWNER TO postgres;

\connect dbsecurity

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: add_date_to_content(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.add_date_to_content() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.date := CURRENT_DATE;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.add_date_to_content() OWNER TO postgres;

--
-- Name: set_comment_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.set_comment_date() RETURNS trigger
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


ALTER FUNCTION public.set_comment_date() OWNER TO postgres;

--
-- Name: set_course_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.set_course_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.date := CURRENT_DATE;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.set_course_date() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bookmarks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookmarks (
    student_id character varying(20) NOT NULL,
    course_id character varying(20) NOT NULL
);


ALTER TABLE public.bookmarks OWNER TO postgres;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    comment_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    student_id character varying(20) NOT NULL,
    tutor_id character varying(20),
    comment character varying(1000),
    date date,
    user_id character varying(20)
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content (
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


ALTER TABLE public.content OWNER TO postgres;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    course_id character varying(20) NOT NULL,
    tutor_id character varying(20) NOT NULL,
    title character varying(50),
    description character varying(50),
    thumbnail character varying(50),
    date date,
    status character varying(50)
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    student_id character varying(20) NOT NULL,
    tutor_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    user_id character varying(20) NOT NULL
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- Name: student_support_staffs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_support_staffs (
    staff_id character varying(20) NOT NULL,
    name character varying(50),
    email character varying(50),
    password character varying(50),
    image character varying(50)
);


ALTER TABLE public.student_support_staffs OWNER TO postgres;

--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    student_id character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    image character varying(50) NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: support_staff_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.support_staff_message (
    message_id character varying(20) NOT NULL,
    staff_id character varying(20) NOT NULL,
    student_id character varying(20) NOT NULL,
    message character varying(1000),
    date date
);


ALTER TABLE public.support_staff_message OWNER TO postgres;

--
-- Name: tutors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tutors (
    tutor_id character varying(20) NOT NULL,
    name character varying(50),
    email character varying(50),
    password character varying(50),
    image character varying(50),
    profession character varying(50)
);


ALTER TABLE public.tutors OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id character varying(20) NOT NULL,
    student_id character varying(20),
    tutor_id character varying(20),
    staff_id character varying(20),
    email character varying(50),
    password character varying(50),
    role character varying(50)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: bookmarks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookmarks (student_id, course_id) FROM stdin;
\.
COPY public.bookmarks (student_id, course_id) FROM '$$PATH$$/4910.dat';

--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (comment_id, content_id, student_id, tutor_id, comment, date, user_id) FROM stdin;
\.
COPY public.comments (comment_id, content_id, student_id, tutor_id, comment, date, user_id) FROM '$$PATH$$/4911.dat';

--
-- Data for Name: content; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content (content_id, tutor_id, course_id, title, description, video, thumbnail, date, status) FROM stdin;
\.
COPY public.content (content_id, tutor_id, course_id, title, description, video, thumbnail, date, status) FROM '$$PATH$$/4908.dat';

--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (course_id, tutor_id, title, description, thumbnail, date, status) FROM stdin;
\.
COPY public.courses (course_id, tutor_id, title, description, thumbnail, date, status) FROM '$$PATH$$/4906.dat';

--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (student_id, tutor_id, content_id, user_id) FROM stdin;
\.
COPY public.likes (student_id, tutor_id, content_id, user_id) FROM '$$PATH$$/4907.dat';

--
-- Data for Name: student_support_staffs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_support_staffs (staff_id, name, email, password, image) FROM stdin;
\.
COPY public.student_support_staffs (staff_id, name, email, password, image) FROM '$$PATH$$/4909.dat';

--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (student_id, name, image) FROM stdin;
\.
COPY public.students (student_id, name, image) FROM '$$PATH$$/4903.dat';

--
-- Data for Name: support_staff_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.support_staff_message (message_id, staff_id, student_id, message, date) FROM stdin;
\.
COPY public.support_staff_message (message_id, staff_id, student_id, message, date) FROM '$$PATH$$/4912.dat';

--
-- Data for Name: tutors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tutors (tutor_id, name, email, password, image, profession) FROM stdin;
\.
COPY public.tutors (tutor_id, name, email, password, image, profession) FROM '$$PATH$$/4905.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, student_id, tutor_id, staff_id, email, password, role) FROM stdin;
\.
COPY public.users (user_id, student_id, tutor_id, staff_id, email, password, role) FROM '$$PATH$$/4904.dat';

--
-- Name: comments Comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "Comments_pkey" PRIMARY KEY (comment_id);


--
-- Name: content Content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT "Content_pkey" PRIMARY KEY (content_id);


--
-- Name: courses Courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "Courses_pkey" PRIMARY KEY (course_id);


--
-- Name: student_support_staffs Student Support Staffs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_support_staffs
    ADD CONSTRAINT "Student Support Staffs_pkey" PRIMARY KEY (staff_id);


--
-- Name: support_staff_message Support Staff Message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_staff_message
    ADD CONSTRAINT "Support Staff Message_pkey" PRIMARY KEY (message_id);


--
-- Name: tutors Tutors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tutors
    ADD CONSTRAINT "Tutors_pkey" PRIMARY KEY (tutor_id);


--
-- Name: users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);


--
-- Name: students stduents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT stduents_pkey PRIMARY KEY (student_id);


--
-- Name: content content_date_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER content_date_trigger BEFORE INSERT ON public.content FOR EACH ROW EXECUTE FUNCTION public.add_date_to_content();


--
-- Name: comments set_comment_date_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_comment_date_trigger BEFORE INSERT OR UPDATE ON public.comments FOR EACH ROW EXECUTE FUNCTION public.set_comment_date();


--
-- Name: courses trigger_set_course_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_set_course_date BEFORE INSERT ON public.courses FOR EACH ROW EXECUTE FUNCTION public.set_course_date();


--
-- Name: bookmarks Bookmarks_Course ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT "Bookmarks_Course ID_fkey" FOREIGN KEY (course_id) REFERENCES public.courses(course_id) NOT VALID;


--
-- Name: bookmarks Bookmarks_Student ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT "Bookmarks_Student ID_fkey" FOREIGN KEY (student_id) REFERENCES public.students(student_id);


--
-- Name: comments Comments_Content ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "Comments_Content ID_fkey" FOREIGN KEY (content_id) REFERENCES public.content(content_id);


--
-- Name: comments Comments_Student ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "Comments_Student ID_fkey" FOREIGN KEY (student_id) REFERENCES public.students(student_id) NOT VALID;


--
-- Name: comments Comments_Tutor ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "Comments_Tutor ID_fkey" FOREIGN KEY (tutor_id) REFERENCES public.tutors(tutor_id) NOT VALID;


--
-- Name: content Content_Course ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT "Content_Course ID_fkey" FOREIGN KEY (course_id) REFERENCES public.courses(course_id) NOT VALID;


--
-- Name: content Content_Tutor ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT "Content_Tutor ID_fkey" FOREIGN KEY (tutor_id) REFERENCES public.tutors(tutor_id);


--
-- Name: courses Courses_Tutor ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "Courses_Tutor ID_fkey" FOREIGN KEY (tutor_id) REFERENCES public.tutors(tutor_id);


--
-- Name: likes Likes_Content ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "Likes_Content ID_fkey" FOREIGN KEY (content_id) REFERENCES public.content(content_id) NOT VALID;


--
-- Name: likes Likes_Student ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "Likes_Student ID_fkey" FOREIGN KEY (student_id) REFERENCES public.students(student_id);


--
-- Name: likes Likes_Tutor ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "Likes_Tutor ID_fkey" FOREIGN KEY (tutor_id) REFERENCES public.tutors(tutor_id) NOT VALID;


--
-- Name: support_staff_message Support Staff Message_Staff ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_staff_message
    ADD CONSTRAINT "Support Staff Message_Staff ID_fkey" FOREIGN KEY (staff_id) REFERENCES public.student_support_staffs(staff_id);


--
-- Name: support_staff_message Support Staff Message_Student ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_staff_message
    ADD CONSTRAINT "Support Staff Message_Student ID_fkey" FOREIGN KEY (student_id) REFERENCES public.students(student_id) NOT VALID;


--
-- Name: users Users_Student ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_Student ID_fkey" FOREIGN KEY (student_id) REFERENCES public.students(student_id);


--
-- Name: users Users_Tutor ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_Tutor ID_fkey" FOREIGN KEY (tutor_id) REFERENCES public.tutors(tutor_id) NOT VALID;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     