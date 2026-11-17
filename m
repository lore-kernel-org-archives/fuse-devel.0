Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794925911;
	b=Wn2vc5LOKeo2vJym6Cj113G+9/Meodji46znHt1J+3MtrjzI/oiJ/8KhSUcw9juXFziZ
	 NOl1pbjHIBBPzQ89CH1sn4eb2bEieXggsIrUPNWi0gCYKQ7kkC+yox6mAcZVG3Ld5KVR+
	 pEwcY3hW4qPCKb1TchVS0ELCPvg+0XgzCWGtPrM+/ziGXsw9OtgLHqVkaFQPiuXIB+twV
	 V2N5MVeqh3o+47wGyL01wT9Ib2hpbr590poegP5ldCZHxHijT6AzZMRU8KoMuSUt50sQn
	 e+/JPsZwLOknXKc1+wZMdYJET0lNWMirrQZeGaJg8QhRMjVSxBqMfTgSzQDWYOEQSAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J8J/dU+jQllMyvNevSPXlfSxT9AbwROgLjn7O3WN4IA=;
	b=3sdSnaUpJ4Se2NXyN3pwkUf5fxIQczX7YhtvDXfAN/YRwRcappE8PaRNkHvmeqeW0gi2
	 1SmU3U8hhgGTXJFlKF8tPs9/79s24ZMGI56EPJwtcts2e5Zjwww1rbMbVXPsUK9q5sGjF
	 YFihtUt+o/KHC3rR0VJzuuqGTm8jhbTFXTXJEWIKaKcihU0iaDskh9g0uPnLYSf66VvP5
	 LHQiQuPvUOaQw0Y1gpJVZOFZn8Ue+eoNQLOZ4Oxwe59/pNGLXkAByV+ledJU72TkYxY6n
	 fn7CTfjvr1tPBLbHuVQKV0WV3MPDfIYcIY+uxTxgYQzccaUnFHN1zW1hBWbbldxeNPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f91sks1R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5199E606A330
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 14:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5199E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f91sks1R
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so5407766a12.1
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 06:31:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794925909; cv=none;
        d=google.com; s=arc-20260327;
        b=DL8loptx3cGg/TCIfGQNXHOsRAa/1l4MNQK9mSsLD+1p40Mt63KwT8b9TPwSWayris
         DxGE8dIFCaoROPK0lm1fZbrBkqiAUqafcgKhqAVwpM4xd6/CSIGPb7CsIr3xsUdL3yfj
         Wwi+LE+uwh4cv8mwASZATUZWz5rZxKQxZT2CszgmlBJBnleUuxSy3a3gO7uQ/dU5Fw98
         4IgDrWXWfzW0xBt8RDTuKkdAAINbp8Jjy+pn7+409mRZjR75b4sjFYkYKvDavzqops9h
         0JlFyPauGiKqgpRaHvhXRbvPd7OkDeLZH0IOtJ1z7Pj9umxTwtGPoA9fOTeg6mRmu6pz
         ENrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J8J/dU+jQllMyvNevSPXlfSxT9AbwROgLjn7O3WN4IA=;
        fh=ZkCnstjOXk3XSzYpxFgMDqR8zdKxqu4CnAwi4BpiXCQ=;
        b=WxTW47NGS5S5JmHfMddyUmirw5vAkJQ35jGZnYOMvJNvvqfVCj0n9VECErR29S63RW
         pAnNRy02b5Xsdhu3ybL1+HfRUSLm/lHeGDScyCV9HrMcpadhgx+sa0j2JpzWdDTABHZd
         Zff+tAwR08t1gvbeKrbLSBQVWpnM2abxYZTW1xhyB6OrxxWWZgu2WEfS94BksjaZ/iIK
         T0+JVUGLYVvxuszuwo22SBLpnfajsnhccmrAD31kGnLWZGs8A5vjW8CMdDqhJzGW+DRQ
         4zhMp5PERPcy/5cpCV92LcwZX61qKKB/7lw43htMCLfZet+hjffYzFUtOw4deUSdCnfb
         KxUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925909; x=1795530709; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J8J/dU+jQllMyvNevSPXlfSxT9AbwROgLjn7O3WN4IA=;
        b=f91sks1REKQ2BMst8jVQzXcq4zVe3N1Yj5df4guojTN39hJ5IeLZeYMOkhpPoUZ68Y
         4Wa+jQFGfRHmvcs9mnC9nHHDSaQijwn0EONi5QVH146aaRcyiBcdqcPXUKjaohWRshAe
         G2srAzFiYsBrEovmVhTlfpT1b9SHgdcCX0HJd0JZ4t7a/xkMqCzLjnmNqYv5AcfxvAi9
         4bfrui7xdDSpdV0LMaRZCmUiZyKsu1NBSrchWjY3Mog3NsASoDY8JaHlbW5pdlwqwoe9
         tKhVEPjdm8U/pQIUtia79g4/sgLf6C2/xh9PvdzzThsqR3iWMEC+koPSPXXuQIgdK1Aq
         44hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925909; x=1795530709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J8J/dU+jQllMyvNevSPXlfSxT9AbwROgLjn7O3WN4IA=;
        b=EnnJR6snh93LmEKDK61Aah+XOVnmdvlTzZRnNtP5ng2GbgpDVpn6NHHYTVAWV4Qbsv
         FILcX+oh8rlFif6prvPx6Nlbta2ySx62ftSsRq9ruQHKW+iosb7IJSPJyoSxGHdJ3R62
         hsWWHJLLKcKd+BdBgPHlGCOeTwV+ahhWfufw1foY/K9mhsN17CteF1rWtXySZhUVTnqV
         Tm3bn9YRZIlCVEJ1QsExgmYoUb0HM76US7leeWNMCVCvoWhD0HXha7GVTtDRF5BR1kb8
         A3YHhl3zR0J20NIAXSMsJFyeN+1Gc62f9qPI093zMTO+nQ2Y+PzPWLK7GwDs+05jA+09
         Gm1A==
X-Forwarded-Encrypted: i=1; AL+hErG+7Ojreg4kKBFdi5lKb+3UkmkRwGtUKvWQbvyrTO/duw+cUiXRuD3KVnEK5J4BEmdtJ9jwon7ABfg5@lists.linux.dev
X-Gm-Message-State: APuU4Z+RYZiU8wy/glQrdv8RGD5eeH0wkoU0bwAR2RCdyRCjJdgspmKg
	b2/dyCjsU3p9YVZ80OjKqDJiA+pN8yrRU+1M3xcCwg/07IHC+1nUU0iHNNE+t6Jy/qW4jChzxdD
	q6bggf7PAHYU2rhna0chut5Q+6PZAmLA=
X-Gm-Gg: AYBFou0a9suQnDgY+KZg/0xc1CXYpJWCeIt4J42PUung908JwUUDDKkev2uP0F2+adz
	C2M4/Qt3lxNDXRhmXYKQ1zT36aM8bacdnfKMxoxQmxf0nXHHxYwZABOXlMHnIsoJrUJSPM8N12U
	FDDHQgSfr70yvVnBqQBlyQ6mQXWRZwPkrgJYk1KSz/l50i6Ur0m4zTH5McQDIP4stMoek5XPW73
	ZxxjfeA3ZpqutGCEt7lFljX6G6di/u60as6G/i/8jlSfIHvPAIXmp7b2g5lJqhERlggksH/zk/5
	LlXkEz/6DzUA6w52X/9aANDL5t0jsEou1+jgWimb9glJIXo+AzCUJibCPQE61VIZ0G9hwAmBLRr
	5G/14MbR/LhnVcyHaRzg3LKMRb9tqhRuTLTag9MgjR7LgR81Es9ynlp6jWNqyF0tn3xmez85YuW
	GL3/b64YnOLl4w3JY=
X-Received: by 2002:a05:6402:1f49:b0:6b1:cd52:5798 with SMTP id
 4fb4d7f45d1cf-6b7c0d2476dmr11277202a12.42.1794925908479; Tue, 17 Nov 2026
 06:31:48 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117135146.3174252-1-graypanda.inzag@gmail.com> <20261117135146.3174252-3-graypanda.inzag@gmail.com>
In-Reply-To: <20261117135146.3174252-3-graypanda.inzag@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 17 Nov 2026 15:31:36 +0100
X-Gm-Features: AclHuK-1tfZhKwrVCdjfTj54iWvStsZEppahje6OeA9duQdnuQ1FrAmDZgLv9Zg
Message-ID: <CAOQ4uxiTpRO9ZOFpKRHjGakB03X=8HWEhpMxj_xcMp5yc4tMUw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] inotify: copy full qstr length for event names
To: Junyoung Jang <graypanda.inzag@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>, Matt Bobrowski <matt@bobrowski.net>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 2:52=E2=80=AFPM Junyoung Jang <graypanda.inzag@gmai=
l.com> wrote:
>
> inotify_handle_inode_event() allocates the variable-length event via
> kmalloc(), reserving name->len + 1 bytes for event->name, and stores
> name->len in event->name_len. strscpy() stops at an embedded NUL in
> name->name, leaving the trailing name bytes uninitialized.
> copy_event_to_user() copies event->name_len bytes from that buffer to
> userspace, leaking uninitialized kernel slab memory. The terminator
> and alignment padding are zeroed separately in userspace.
>
> Use memcpy() to copy the full qstr length and write the terminator
> separately, as __d_alloc() and d_path() handle length-bearing names.
>
> Fixes: ce163918cd33 ("inotify_handle_event(): don't bother with strlen()"=
)
> Cc: stable@vger.kernel.org
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> ---
> Changes in v2:
> - Use memcpy() as suggested by Amir Goldstein and terminate at name->len.
> - Copy only the valid qstr bytes to avoid a one-byte read past name->name=
.
>
>  fs/notify/inotify/inotify_fsnotify.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/fs/notify/inotify/inotify_fsnotify.c b/fs/notify/inotify/ino=
tify_fsnotify.c
> index 6e3af6452dcc..ecbfc9b4e99c 100644
> --- a/fs/notify/inotify/inotify_fsnotify.c
> +++ b/fs/notify/inotify/inotify_fsnotify.c
> @@ -120,8 +120,10 @@ int inotify_handle_inode_event(struct fsnotify_mark =
*inode_mark, u32 mask,
>         event->wd =3D wd;
>         event->sync_cookie =3D cookie;
>         event->name_len =3D len;
> -       if (len)
> -               strscpy(event->name, name->name, event->name_len + 1);
> +       if (len) {
> +               memcpy(event->name, name->name, len);
> +               event->name[len] =3D '\0';
> +       }
>
>         ret =3D fsnotify_add_event(group, fsn_event, inotify_merge);
>         if (ret) {
