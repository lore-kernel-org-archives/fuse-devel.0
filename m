Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F09B48097D
	for <fuse-devel@lists.linux.dev>; Tue, 21 Jul 2026 10:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630161; cv=pass; b=CHoKAutAXZyHh3YkRcpMi6XbRR+s9lAYNzySFfJLqtuHHGcQhaoUw6HTjI23NVFwSvuj7ylH0FyVFYS0S/E8Bw3NGsKo/gH6wlM4BFd8RoClmvyADy9YIGZCkHPWRzUVd0SpwL4UaqOLElkTdsvF+uuYm4uFWMorz3U7gIHzJdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630161; c=relaxed/simple;
	bh=rYViphB4DxfaPGMMntEonSPLt1Abt8g/0zJq2r3L3xE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkqkGSgrQosp0H2rW/VR95wY8txqICyJjZU/hBN/QoxSF1fGlnlz3vYYKbB4jUuWPxKaZmu4COrLiPbLlYHze1pj+cu2ubUcGW4MOoOaXKP/LgWGyVLUEKgYxdZouQvUaLWcsUyyizSY0oUg+9k5wWh5N/VHwgCkaIo71+X1Szc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T83xiO4S; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T83xiO4S"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so13021288a12.3
        for <fuse-devel@lists.linux.dev>; Tue, 21 Jul 2026 03:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784630158; cv=none;
        d=google.com; s=arc-20260327;
        b=Lqd4i1y8wXRCxA/4ws7XzTmRbCkX921MMUUvBpV9MqGjlrqHZjewlmPflkrARNfMLu
         MU+UAC+nKAIz8E6fjWjHGyI67iqdCQ+Pv8FzVGOITa2Y2f+h4xmKaZUk8y+MNcUmOGdR
         lY8Ery3PsQvNFGbNpo3WLVH4Cw9LSKBIXe//pTm5An6q/WAnXKnPphVZ5E4Dt/pvW68t
         /h0U1uBlQRx+WFgkCGC86Ps800/OBOnmNJLWMJeO16kaBim/WHw/amTVPND4P3HKOebw
         W3iMHvPgKUzR2HD5J9dsfsbpj+ewlkIZ+L9i/uYJ//KI2yHFFijAbf6yswiWa94zjsVD
         mIYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R6gkln8TC+X7dROBQSudVEuyKf8Opd2LeVjHp6RExug=;
        fh=7t3ZOODPxs8ZSgWu/JycFTtG9h4/rsUxRNOD2W72beE=;
        b=obLJfXr9JpAvjAc60Yg1+WeZIsUjGfPX+lZUHpMuRVF8IMExa1PZRvpIF0GliCZeDA
         ctofcE+VsEBlK0MtGkrUxU+gKNZnY/kdJMDvKmBEUZNCcHC/RCaXKGroJwjKcO4VUYvN
         Yyz3colN66n5pbthjWpBNw0lWGzXnjjFdpTrlXZdZb2vGllNnOstAQSVK6HMtxj5WnAm
         kRiNB8QX66T6vI6gO8vgG2JTHSfiIaLGNLwDVcfAfNUnnZzXjuDhDn9LygAwN0QR/wpq
         YYHcTlWsGJJ2Fs0W8GmrPw1PN/cy7n6cEyEnnk9jOOGheqB9KHGvxGRq4HKiEDYeTugP
         iRsg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784630158; x=1785234958; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R6gkln8TC+X7dROBQSudVEuyKf8Opd2LeVjHp6RExug=;
        b=T83xiO4SW83jzHDiDMvW7MZCKadIABzwSDkOjAMSmDfwljSnCZwikH4tlMcrHZ/Eo4
         Eb9RWPHoNsJ47e7LeatsEacATjIuX7NpGuTHxswj2RG7bp1uC6SCyqRuh1NzyY5bTYVB
         fDhMBLx8FT/GSTsxM6nddJCjGIBEYSV2APTyVmUIWcB6fy6ou9wTMQ99P4rw0NYyYvAB
         iI7mEWuxOKiHbv3yiPpSf4+fPnYttj9LDNr6O9ZEZRr4MlRVpa7O3FiKnfVH1pUqXwt4
         O6yhO0ZmTldzBP3telnE00B8cJmy3V4iKHUa4mg8d/Ll0DIHnBVXhExzqlwhPjAarOXF
         /U/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630158; x=1785234958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6gkln8TC+X7dROBQSudVEuyKf8Opd2LeVjHp6RExug=;
        b=nY5w3UbeHH/ZG5LliC14jGwaJtwvQp+hqTYwoq4rPNOm0Gm+OpPke6/xm1mZjrE5bb
         XLS3E5IU8BaVeK/y3OxNw/nO/rsUlA1PsCz5y6EuiEDszGd3v5LuAofDS8cKre4uFV1v
         5LyLiMj3dKPMzp7ilGLsO/rv5yGFPVCLAq4IsCgF89le1NoC2iODHd7eSS5ifm0Vzs6X
         8vaIoDWZIxuQ5iptIOPaPrgV3uPcISdFAJc32zPCdesXRW6+uFkkEVwD0VVHWK2S4HrO
         tt4LXUKfruBpRbFz6Mc3N3h6k/EoKJy5SNHpmhi2PpkhCUyschaqtuiz6G5s0fzVcvlm
         4w5g==
X-Forwarded-Encrypted: i=1; AHgh+Rqh4vL2RsMudArepapoYH8MlpGeJuSirbXFJlGe04kFKlb7ZZu8/j586UsLQPoM4IDp6cZwHQMTC0Mr@lists.linux.dev
X-Gm-Message-State: AOJu0YyMud/A7HfSlsleAAzDPN4ex6GDdjuGBO6TK/z6nsU2+Gv6pbro
	FlwlIWjQj73Xir2CQ1WNv99JTiSCkg+Tvg9fH5GMV01wIVH3wKub3h1Nt277Ma+In+pwj88SM8H
	hoMm0iAaRZweIqcEfmqbEpZkScdRT4gw=
X-Gm-Gg: AR+sD11ybEQ7x14ehpPGNt0QepjsHGXD+8H4CQIl+C6+MrAMCsyI8Lv95/+7WhY56Se
	6IO8fnwdzE/6ltlB/saBqOMsU21WMKkbWgqoK9ZIjAAnrO7TPA+wU7fA6BPYTs1ZoYZgi5QRjqk
	NY3W0wWOZjWHHgV27jHqfPcXGkZwKozGNzqQN3knitc7DUC3IagICJSFU8ZVeRsM1CIGD8NW7bJ
	Sp1P7fw+JDakv/xn7MgazvVUlGTuZxhLvlmmtfoA/hz/LvRIM6wx4RSR4Vw24F1GCJG5JJJYA==
X-Received: by 2002:a05:6402:50c8:b0:698:bdeb:a9ce with SMTP id
 4fb4d7f45d1cf-69e652726ffmr6135346a12.13.1784630158075; Tue, 21 Jul 2026
 03:35:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708131122.2917-1-luis@igalia.com> <20260708131122.2917-3-luis@igalia.com>
In-Reply-To: <20260708131122.2917-3-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Jul 2026 12:35:46 +0200
X-Gm-Features: AUfX_myDrhpG_I_jw7T0ARJbDXZ0WGU31MEHieyc08zEfODDtXT-duqal-shoGs
Message-ID: <CAOQ4uxiy3X7ZZ_E_jC8Gqa6S==jb-m4CZh8kwmAznUWxeSQB=w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/5] selftests/filesystems: convert fusectl test to fuse3
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 3:11=E2=80=AFPM Luis Henriques <luis@igalia.com> wro=
te:
>
> Since it is probably not worth adding new fuse kselftests based on fuse2,
> it is a good idea to convert the single existing test to fuse3.  The
> conversion is trivial, as it only requires some changes to function
> signatures (the gettattr and truncate fuse operations), and to the filler=
()
> helper.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  .../testing/selftests/filesystems/fuse/Makefile |  8 ++++----
>  .../selftests/filesystems/fuse/fuse_mnt.c       | 17 ++++++++++-------
>  2 files changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/te=
sting/selftests/filesystems/fuse/Makefile
> index 612aad69a93a..422cd1b1688d 100644
> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> @@ -7,14 +7,14 @@ TEST_GEN_FILES :=3D fuse_mnt
>
>  include ../../lib.mk
>
> -VAR_CFLAGS :=3D $(shell pkg-config fuse --cflags 2>/dev/null)
> +VAR_CFLAGS :=3D $(shell pkg-config fuse3 --cflags 2>/dev/null)
>  ifeq ($(VAR_CFLAGS),)
> -VAR_CFLAGS :=3D -D_FILE_OFFSET_BITS=3D64 -I/usr/include/fuse
> +VAR_CFLAGS :=3D -D_FILE_OFFSET_BITS=3D64 -I/usr/include/fuse3
>  endif
>
> -VAR_LDLIBS :=3D $(shell pkg-config fuse --libs 2>/dev/null)
> +VAR_LDLIBS :=3D $(shell pkg-config fuse3 --libs 2>/dev/null)
>  ifeq ($(VAR_LDLIBS),)
> -VAR_LDLIBS :=3D -lfuse -pthread
> +VAR_LDLIBS :=3D -lfuse3 -pthread
>  endif
>
>  $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_mnt.c b/tools/=
testing/selftests/filesystems/fuse/fuse_mnt.c
> index d12b17f30fad..5d335fa5cf05 100644
> --- a/tools/testing/selftests/filesystems/fuse/fuse_mnt.c
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_mnt.c
> @@ -4,7 +4,7 @@
>   * Creates a simple FUSE filesystem with a single read-write file (/test=
)
>   */
>
> -#define FUSE_USE_VERSION 26
> +#define FUSE_USE_VERSION 31
>
>  #include <fuse.h>
>  #include <stdio.h>
> @@ -20,7 +20,8 @@ static char *content;
>  static size_t content_size =3D 0;
>  static const char test_path[] =3D "/test";
>
> -static int test_getattr(const char *path, struct stat *st)
> +static int test_getattr(const char *path, struct stat *st,
> +                       struct fuse_file_info *fi)
>  {
>         memset(st, 0, sizeof(*st));
>
> @@ -41,14 +42,15 @@ static int test_getattr(const char *path, struct stat=
 *st)
>  }
>
>  static int test_readdir(const char *path, void *buf, fuse_fill_dir_t fil=
ler,
> -                       off_t offset, struct fuse_file_info *fi)
> +                       off_t offset, struct fuse_file_info *fi,
> +                       enum fuse_readdir_flags flags)
>  {
>         if (strcmp(path, "/"))
>                 return -ENOENT;
>
> -       filler(buf, ".", NULL, 0);
> -       filler(buf, "..", NULL, 0);
> -       filler(buf, test_path + 1, NULL, 0);
> +       filler(buf, ".", NULL, 0, FUSE_FILL_DIR_DEFAULTS);
> +       filler(buf, "..", NULL, 0, FUSE_FILL_DIR_DEFAULTS);
> +       filler(buf, test_path + 1, NULL, 0, FUSE_FILL_DIR_DEFAULTS);
>
>         return 0;
>  }
> @@ -107,7 +109,8 @@ static int test_write(const char *path, const char *b=
uf, size_t size,
>         return size;
>  }
>
> -static int test_truncate(const char *path, off_t size)
> +static int test_truncate(const char *path, off_t size,
> +                        struct fuse_file_info *fi)
>  {
>         if (strcmp(path, test_path) !=3D 0)
>                 return -ENOENT;
>
