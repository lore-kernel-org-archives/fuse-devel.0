Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4159A26F288
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 19:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787083077; cv=pass; b=gSXgPdFEdKAWr5SSWlJSr9wJqaQwx7HLqITa1mGXW3V2ZWaizSURVbbKknOZziIx+D29YX/UE06psfK1N7Owk4iny4msvir8PM82VG7heQNWU8BmdG2tfqSC1HYpORDHuBwvEAOmAGx6vVAaFbG2M+ufrvFUUrUHyamV58m3nuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787083077; c=relaxed/simple;
	bh=Szm3BHWLk691Tkb3wpX+u/chbB+Kd0H25f5yPjsHjDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYp4G2nEGirDn+S7nvcIqs/KkE3czJhmTYhFpyjPmeouhEsLZYpPNB9dHFCN5BvWQ1Qwu6XAm6fM9iNuQsniGU0LaCgggbDL4RAhoP4hj465uhx4puiZJCuCApsmSW/9LLExdj+WZBuGtneg0xOJ8R78JROkKa4eJ70B2ckin5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ednhY4Yi; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ednhY4Yi"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so512958a12.0
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 12:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787083074; cv=none;
        d=google.com; s=arc-20260327;
        b=gh2IgWt34xXFZfLbNcqvG/Z0AWZN1EWx+fWemfPo9hywPVj3qPtvmOzh7ap+paZhIT
         PyjdDhYUts2UnbBYFyO/s3uOemHQOwJzXF8/4wybQUAzS6cvQpiYYq0fAFTv9YJfS4cG
         8Ir0ZzOVoRKr+mQWNbQcBogSto6OS4p+kvjJa0IZooqLfobk6ZydZ77b7qAxPkrwwQ2Z
         gm2uWYLr5DWY6D//BxFa5BfiszpsHX38TcYkwQg+1kH10abxazL/O8e4zRt5M5NtnMqz
         axv3GPldg2gVsdVQXYK3Ro52R8eDegf72a76pII28P3G2FJJ7Mg4FyheWqR76/x6Ntc5
         NWgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WSJnz51fcIZBid2gs89wxh+KscHIMubJ0sU5re+K3qI=;
        fh=P9cX9jd98rZWJNPqW4I5FdOE+5qwKjvXDOfKBJo9dBY=;
        b=nJSvgdzuxFdBRRn2xXtJTEsLoxOXmcS3MojVxMGF6eK1bg7wuw2syXbUkUJ0ol/8c6
         UXneLXiThUM4qqSHTINvpZPzy9ngT5nBDLV8SBva+ZSPu0J1KG8nIPdCGuLJVZnFxJ30
         oGb6k3CVzSnwbIUUcgiOBMJPLxlh+CrWFxbzQsk8DTGNKEvf7Wz9s1xGPsJYT8z+YChV
         rzH9zByqyODmydfWHYjCfW/rGyclOw01bOD5fr9AhfQ1ayT9GvWpu3IP5jy1n9RdbxEW
         f1ZBZq9Y4xy18JYliEH5+7PJ1klBmuK2Aj4O3jrD820HHpegkTGyzbeVbZzJqq1tHTb8
         jnPQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787083074; x=1787687874; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WSJnz51fcIZBid2gs89wxh+KscHIMubJ0sU5re+K3qI=;
        b=ednhY4YiSED7bRDUUYrkWkLNBDD5BJbqOoF03IP7F2oXHVyUqMeRM8T9ElIoKpmJiR
         31rki8Xa+TaexFyWEHE0a6greA9nMw7yJ/Hf80PnDUN+0LfiPvH3Iqka/+0D3JV3YyUA
         B31UVm3oEO7l1eaVujRda5QxHLfowrZ0zCBdJJleCdri0uO/m6JRR9E1tl4WzY2Hcyf0
         P5Tvhc4BGwm3Cz6yJwZ3JCgFj3fY/yrwZXbTVaynmP8c08WlD3axFWJ1L7oT5ogpDpK+
         LRPQFmqPnk9l9uLmC3nqC9FbI2eYk/rvm7RoaBvhVxh9yzE7aoiRLSzp+qgGxav87Oz3
         3Rtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787083074; x=1787687874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSJnz51fcIZBid2gs89wxh+KscHIMubJ0sU5re+K3qI=;
        b=IuNxC3iejA4y9g5geN6Gd0JAC3XmrqlAXHN8y2pEOC0rkFQAMdnvSYKnsWcQTG9S7G
         bd4KX0tUd5pmP7Z1dB8ZQb+kuQ0tjDx+Dj1bHyMWaMfm2KBh/R/wJhDqGbtrDKYJklAp
         xya4A7TyO8URv7nNedwyw4syzsTzrsPTY9hiGpIVbAEJzltrjTavx4e4Sc6TjnJVor5U
         8VjZ/zv05gsYNCG3xofnR0gakUFm1XG4W3Wsbz1XulMut6CibtW9lF4cNi/WeV2yW5JJ
         oXBbsp8Rlum4DECwdElECqPHAF8lSik03lOninXur8cQ0qCASPexrxbAP153gdraj3sI
         Eh1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrPJmUUOUA59/kiqHIjO1r729EplqsQW/L78aelIIMlUCFjJbOtNhtZsc1LrflnSzykUUVAeOz50jsx@lists.linux.dev
X-Gm-Message-State: AOJu0YxKQitg0B1BkqHuOWmc4553hPvWT/O0ZPV7vqvLUblWNaC4UETt
	wEEoVAi1RlDSfUGyAv6MLSacjIli/SIGjavGGnpZj//ySwfAT27XAygl1ZpfnIIxZZrCE16Ktm2
	4QhCwixpHupexfXBZWU0a1f5mMDrAePM=
X-Gm-Gg: AR+sD13JHbtRYGzEhmaAk5Vi4zsHmUc/BL6bx66Tz28z3WPoCl8Uln5f+bboKF9o8/N
	JKGaubGGhmgvKgp7aCj2GWm/mmSG9qVzYzQ6BaRSgyPohKZlH7KVCpij1cML7ZvaOjMeNi9qQSH
	AIkW6QULIIXDywTgkm5Sjn+Zl0pFqddlEsMulqqei9Irrxdq7E/NDK9lchlFZBoCJHbxtmnbldz
	cGcrn9BILhq9bBLS/mR06gP05Wod8pr7pWcrCpCFdtGk50DSQ2iTrazF+9xWHBzRtUXmfG1KkZs
	JResIB8hZO2iU4i/RwOmFT5mCmCXEMnxmzSg4tDAqXGlOw==
X-Received: by 2002:a05:6402:3983:b0:698:ecf:d18a with SMTP id
 4fb4d7f45d1cf-6a3fb76aae4mr349028a12.9.1787083074119; Tue, 18 Aug 2026
 12:57:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817141156.6079-1-luis@igalia.com> <20260817141156.6079-2-luis@igalia.com>
 <CAOQ4uxjsx-Atq3tGsUeakGNZYLVHayVXPne1E6gM0J9tZp+f6g@mail.gmail.com> <87mruje8a7.fsf@wotan.olymp>
In-Reply-To: <87mruje8a7.fsf@wotan.olymp>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 18 Aug 2026 21:57:41 +0200
X-Gm-Features: AcwNN1VmEJCZ2dfSdLunAIKvJi6pxYGeoutfft8jaBr1bHqfqj2oEFnFdnxoK3A
Message-ID: <CAOQ4uxjnJ436FHZUZMKNx5C9gPKvD5c0n9ojcnxQBoUCuBTVqQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/8] Documentation: fuse: add document on caches
 being used by FUSE
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 5:51=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> On Tue, Aug 18 2026, Amir Goldstein wrote:
>
> > On Mon, Aug 17, 2026 at 4:11=E2=80=AFPM Luis Henriques <luis@igalia.com=
> wrote:
> >>
> >> This new file aims at documenting the caches that are used by FUSE.  A=
t
> >> the moment only symlink, attributes, ACLs and readdir caches are descr=
ibed.
> >>
> >> Signed-off-by: Luis Henriques <luis@igalia.com>
> >> ---
> >>  .../filesystems/fuse/fuse-caches.rst          | 142 +++++++++++++++++=
+
> >>  1 file changed, 142 insertions(+)
> >>  create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
> >>
> >> diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Document=
ation/filesystems/fuse/fuse-caches.rst
> >> new file mode 100644
> >> index 000000000000..071febf45d00
> >> --- /dev/null
> >> +++ b/Documentation/filesystems/fuse/fuse-caches.rst
> >> @@ -0,0 +1,142 @@
> >> +.. SPDX-License-Identifier: GPL-2.0
> >> +
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +FUSE Caches
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +Introduction
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +This document summarises the different types of caches that are used =
in FUSE.
> >> +For each cache type, it attempts to document the rules that are follo=
wed to
> >> +insert, validate and invalidate data into the cache.
> >> +
> >> +symlink caching
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +Whenever there's a link resolution request, the VFS will call into
> >> +``fuse_get_link()`` which will then send a ``FUSE_READLINK`` request =
to the
> >> +user-space FUSE server. However, the server can ask the kernel to cac=
he all
> >> +links resolutions by setting the ``FUSE_CACHE_SYMLINKS`` flag during =
the
> >> +``FUSE_INIT`` negotiation.
> >> +
> >> +If this flag is set, FUSE will immediately call into the VFS
> >> +``__page_get_link()`` from the ``->get_link()`` inode operation. The =
first time
> >> +this is done for a specific link, it will end-up sending the ``FUSE_R=
EADLINK``
> >> +to user-space but the link contents will then be added into page-cach=
e. The next
> >> +time the link needs to be resolved, it will use the link content that=
 is already
> >> +cached, and will only fallback into sending the request to use-space =
if the
> >> +folio isn't up-to-date.
> >> +
> >> +Attributes caching
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +Attributes obtained from user-space, for example when an inode is fir=
st
> >> +looked-up, are cached in the kernel. However, these attributes have a=
 timeout
> >> +associated and once expired they are invalidated.
> >> +
> >> +Thus, the ``FUSE_GETATTR`` operation will be sent to user-space only =
if the
> >> +attributes aren't yet available, the attributes aren't valid (timeout=
), or if
> >> +there is an explicit request for doing so (for example, by using the
> >> +``AT_STATX_FORCE_SYNC`` flag in ``statx``). This may happen in the fo=
llowing
> >> +situations:
> >
> > "This may happen" what may happen? I don't see it referring to anything=
.
>
> Yeah, that sentence doesn't really make a lot of sense.  I'll rephrase.
>
> >> +
> >> +#. An explicit request from VFS to get the attributes for an inode (t=
hrough the
> >> +   ``->getattr()`` callback).
> >> +#. When an ``->llseek()`` is requested to FUSE with a type of request
> >> +   (``whence``):
> >> +
> >> +   -  ``SEEK_{HOLE,DATA}`` and the user-space doesn't implement the
> >> +      ``FUSE_LSEEK`` operation (it has returned ``ENOSYS``), or
> >> +   -  ``SEEK_END``
> >> +
> >> +#. When doing a buffered read past EOF or automatic page cache invali=
dation mode
> >> +   is enabled (``FUSE_AUTO_INVAL_DATA``).
> >> +#. When doing a buffered write with write-back cache enabled
> >> +   (``FUSE_CAP_WRITEBACK_CACHE``).
> >
> > This list is incomplete and strange. it has post EOF write for
> > writeback which is the exception
> > and leaves out every non writeback write.
>
> This list was meant to list the scenarios where the FUSE_GETATTR is sent
> (the "this may happen" above).  But I'll review the list again.
>
> > If you composed this list yourself I highly recommend an LLM for this t=
ask
> > if you used LLM I suggest a stronger model.
> >
> > Generally speaking, I find that today's robots are much better at writi=
ng these
> > sorts of docs than I am - as long as I sit at the helm and guide them
> > about where to expand on and where to keep it concise.
>
> Thank you for the suggestion (I did not use an LLM btw).  In fact, do you
> think this document is really useful, given that everyone will be running
> an LLM anyway?  (I've been asking this question myself...)
>

LLM is very good in collecting information and arranging it in nicely forma=
tted
structures, but you need to keep a very good eye on the output and you need
to focus on it to make the document relevant to the prospective audience of
human readers. Running LLM to document without a human on the helm
you can get half truths and plain lies.

Also, for economic reasons, the way to work with LLM is to let it research =
the
code base and create nice reviable "brain dumps" that you OR the LLM can
read later into context.

Doing this research every time is neither cost effective nor reliable nor
deterministic.

Thanks,
Amir.
