Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794926135;
	b=vqGRsL+DGrgU1Evvd8U53owReK0N+hswSKiz7ldD0VFBxcLFoNSZDqh3vUjemd6tyALc
	 0353UZHoR3qXHZQr3418nKxvrbdmV/KpZEtk+ENc+FzyFHoU8vGS8S0+tGCxBuBF8yrsB
	 58xNOOFT6hRJ51vZ9/+vndq+BvTjH9Z8C2mW8jCEtr/EIjyTIM9l8JleXPNUTch6FO2te
	 JaE9kszPxmejHOIdL7U746yH+8m486FCKg8C0+YTwKvnmzqfLi5dMwHkn+e1A5+3j/Ite
	 D+ujWAiUupw8qO4ggaBCs8sTc06Rx7U0rrjQuiPzK/9bXz90CzV4bW7ndgvW6JVDwxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z8Nm8FHzKmIfnRj5B6yPP5eTVD3vNbmx6rL+eezv180=;
	b=cp17b0knvNuVNofh2yEoFTbI537DplyRJW8NmKcU/2/+qVY7tonPTRrYSmPhThdJzrnV
	 9NW4QN74VTRVgrFMNDpxXgi/8to4YgyzKM8PH2RzInrQxHEDS2N1d0HLfqBdivT4MxNxv
	 8C1ohQedr5u1hadspSBmcZQqKR+3xOCu8jzYTiIsfPglgYCLWyy3iFF3eMqVHFIYJNI+U
	 oPRnds5czLC9wbPmU4mnAg21GqVaQCfPJkBoKZnOREKgMexc/yAA8pxemK6OAnvgLYVqS
	 HmMh7887/ZeNgybvWlG4BAFM6cc1Ipz02Noq74TFeB8/Bgrgdlg3BRHslEyy/HHVjPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Bm/OmY5L";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918F1606A889
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 14:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 918F1606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bm/OmY5L
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b878560a08so165175a12.1
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 06:35:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794926134; cv=none;
        d=google.com; s=arc-20260327;
        b=GRRQGMKKPYxH72ITrtMfNN7rC6WHPN0RB/pknZm3VN7NnkEd0+KRcB4ETva8R61Sp0
         4co2Bj28vnQG2pFUIv3aBOifkSiR88DFgbZcA9l06NMP3frmGd1CcEAOOX7DId0dyYBO
         myuQ2AOdKQ8B7iR8MD4aVUy68oy3M4I3Ns2OBBtiMrUNqDojwJ9BtLA1hExTnlN9knqP
         y2uE2To5JzlUSkC/xWzVdIi8gZKfy7ABfdExrmSte5q/SQPTSnoCk0L4qUzInjxLiiRH
         fU03oWu4gEQG7c4n6JlFEC2Kz0AAXQN8xUYtVOOqHKTUJeIxeklxCD7LNODA026DkpyF
         1yCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z8Nm8FHzKmIfnRj5B6yPP5eTVD3vNbmx6rL+eezv180=;
        fh=y9wPNmgO/G/Kw9mcDM1HHYIqPXSea6PmUZAvja61jdo=;
        b=n3w4p3jyEPUnefd2oowxVtnA4G5UeUdrNuDN465/dsdJ2NtmCLZcmTNSAvnD6ZoN+n
         GnKKb28KYo1tu/7u+AkiV6tXfmH9eEUxoXoLObA11AweqiC9cScUt7pv3pOGaez3B/aX
         a4r5yfPtW6vxTr4E+vfJ5QQiWLjO6kl2idsYYzqzVTvHdJxGZ8uCwLOHXHvhvQTdG6l7
         AnLpnIibC9fAmKtddXnpkwjmA1cjaER3Tv8pYO2Tlx5vEJJ6ZfKFt0iZb1a+jkLU53qJ
         HLJF5RtNHzIJN3MC5CRUgGh2GfQbq1LqYZaZRkgFmj/a14uDnIhcmbnuP/UZv9984e3D
         is+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794926134; x=1795530934; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8Nm8FHzKmIfnRj5B6yPP5eTVD3vNbmx6rL+eezv180=;
        b=Bm/OmY5LdHXCRXwzIGA6EAEGsmxPNf5WZhe2p6UbCrre6FKxG4TzCSqYc1Uml+/aQ6
         G4y3O5OHhMSRQmcqAwQSaKGOSmBMb7RC/TubZ7vLKWTRxxeAnG2qvZaayMgYckgvtBJ+
         Hid5TcWVNEkDMAsEqwpLVXaJs+mur1krj7UUw10ob+IoqkXC3NHkeh8IbmO9mOdjHK2m
         qizkg4FqFhooCfrjUPS/wnXLRsGX4xRtnJAsCt9BXN8NQkhZdQ5at7s78H9yn8t1ooQ8
         4AoUjqNqcrAZwvS8eiaOQ1ZCU1ZRlDuSo7njPGzEzx6dIv7GPb1FwUl5Z6D5zZT0tPhk
         n7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926134; x=1795530934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8Nm8FHzKmIfnRj5B6yPP5eTVD3vNbmx6rL+eezv180=;
        b=BC5YuS0cmWoZf2BLv/mPmemyeAHFw+uyRackFeHi+aFN26n76ied5MsLfyE3TiyNm/
         kr9DWO1zDzVY0YwJK2Q77SuCn2517CcbDAC+JvJvunRsH/irv7DeqaMuE0EPQS0cWern
         YiikyouCP7+4ad+sF3aCAyE2evpqYgwVx/orb86lINccFVQPY+28bfaAC+YfHqIvFreq
         kXfBcaWUD7L4iTii+t3z4sT7PmmZxiCJEybpIDBHUDhLmnXdtOYQr2qG1AaM53sXKHVG
         bcTvnxZM/xTjdcdrmV3/7+mohAHLM6hiu5xu65GO7GLAk2bhBz98uYVq4k7/EtK282F4
         kgHQ==
X-Forwarded-Encrypted: i=1; AL+hErGvTBrE+3Mk+/pOytlLsuQ1XeQTLQ5k5AAfJfIrdK1su93NyQJbhkvmjQ87FFadOmW9t8qZBgRU5v0l@lists.linux.dev
X-Gm-Message-State: APuU4Z/JaK7pP68fwcRr6mqFzEFebc/FgJWTcIompUt9n+G62pY1I9Hr
	pG2O23o6yUVhgxgaIPci/CSKu6iRxtTzdAjLZ79HeqWAck7PjtmzkAqPzblUMP5DqZkAMo3cYx2
	ZhYE0Vgs5HDW/g5B5QG0CrSVTXBKyh2s=
X-Gm-Gg: AYBFou0eHNVLhklolwPV1grnNBqo/O68QZNiC+odi3p0DjbGSFL4wizBBVLkyGzmTZ+
	L7Sx3F3WmH2H9Y3uCyQ3onNxfiHUVBzvkwfMUe6Tv2MYxPlT3/kXOke0XlzrhrWXfzeQmECsdrX
	6SKRzGsyjZwOLnTaE3Do16AE6efUHqjENFNf5myYcNKI6ChoIntRSyMykhYb/Yvr6NRhi8OTqxL
	j3t+RTd4M3FdOy2L0Jz1Cw478YaXEJVYfy2T53XofSKYAlcBZju/UV7jfKPZfublhy64EzQzsDf
	O1Ok4x5XsXrG1RZmgDLrFJaHKOqe0pqMTO4gVSMONMfKbCRBPCncdW6Q8nWrh2Kn6TPtMofE5/X
	GG3yEuOg6D6+0MpzSEmLlyas0ViwX7dRpsNNeQlg/DSjj4QkfAWIoQ167/PpC0SCRIeP9tI9UJi
	IfntqqELyRu9dQkd4=
X-Received: by 2002:a05:6402:2b91:b0:6b4:1eed:b9f2 with SMTP id
 4fb4d7f45d1cf-6b859739689mr2260195a12.10.1794926133831; Tue, 17 Nov 2026
 06:35:33 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117135146.3174252-1-graypanda.inzag@gmail.com> <20261117135146.3174252-2-graypanda.inzag@gmail.com>
In-Reply-To: <20261117135146.3174252-2-graypanda.inzag@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 17 Nov 2026 15:35:22 +0100
X-Gm-Features: AclHuK8C4CURJWV2PAqKHkl0J2MOz_Ngu3IxgsUB1ZW-CuNtY3L1YeTqpgF395s
Message-ID: <CAOQ4uxjMNxS-jtBt7w4nwJpMQXFraec2UFDRoiXoQqs9eoq2gw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] fuse: skip dcache instantiation for readdirplus
 names with embedded NUL
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
> FUSE READDIRPLUS can pass a length-bearing qstr with an embedded NUL to
> d_splice_alias().  Unlike verify_dirent_name() in fs/readdir.c, this
> path can create a dentry whose d_name.len extends past the NUL.
>
> For such a name, strscpy() in inotify_handle_inode_event() and the
> fanotify name-copy helpers stop early.  The kmalloc() and kvmalloc()
> event-name buffers retain uninitialized bytes within the recorded name
> length, which copy_event_to_user() and copy_fid_info_to_user() can expose=
.
>
> Some FUSE servers include a terminating NUL in namelen.  Follow
> nfs_prime_dcache() in commit 78d04af4995a1 ("NFS: nfs_prime_dcache must
> validate the filename") by skipping dcache instantiation without
> failing getdents().  Return -EIO from fuse_direntplus_link() so
> parse_dirplusfile() sends FUSE_FORGET for the unused lookup reference
> and continues readdir.
>
> Fixes: 0b05b18381ee ("fuse: implement NFS-like readdirplus support")
> Cc: stable@vger.kernel.org
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
> Changes in v2:
> - Keep FUSE READDIR and READDIRPLUS getdents() behavior unchanged.
> - Skip dcache instantiation only in fuse_direntplus_link(), following
>   Amir Goldstein's NFS precedent; forget the unused lookup reference.
>
>  fs/fuse/readdir.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
> index 1f6cf565477f..6b2468b575d9 100644
> --- a/fs/fuse/readdir.c
> +++ b/fs/fuse/readdir.c
> @@ -191,6 +191,8 @@ static int fuse_direntplus_link(struct file *file,
>                 return -EIO;
>         if (fuse_invalid_attr(&o->attr))
>                 return -EIO;
> +       if (memchr(name.name, '\0', name.len))
> +               return -EIO;
>
>         fc =3D get_fuse_conn(dir);
>         epoch =3D atomic_read(&fc->epoch);
