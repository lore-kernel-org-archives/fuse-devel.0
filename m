Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794926017;
	b=rf2JrT5pts1AnXj/ho3/kttZXuHdoBgSeUL6K62n6F1xXiF5h7r3HWlfVINEjQnhWmfu
	 +xnl2TUdhGN59wKcCtdQMZ6WrT3rcut84x9dgjtnPYGlQdsvzU2FlJhWlFSFxwYW/joDj
	 RYobFbvwv8I29/tOOEce5TzQo55j3czkeZy7WW8Gb00SdA94y9xCHAQS3BMf1F8/Q7y2w
	 kCoP3jIwY5VJ1I124+mBq1yYVmlFD6360FmNSAkZaXRK55Ww+vymTSEUGr27G5Z2P2Epp
	 LBWLWB/COd4O6890Ezo2EPotU79qw8Q1rab1Z+NzFuYETlF3naqNUu3nWhW5Om7NbRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qYqqunDmmSSST3DA/CdKBNtQiNEx8lMxFK8nZ1VqJzo=;
	b=kNwlwLCdhUTbjerbq1ZF0xhpph7ooM2jHsSWaHTM8+3yqNWah8l0TO23wYke3i7EiMMi
	 FQJ/QRI3apF8PiewfZDsG1L3m4EenNfjDmiec5NgQpPY/W9xu01STqU7c/lfpxb0ddYFc
	 klVQECzkctWBbugelijaZJhV930xDtwbBnFidcmSy40aRRwqyBSmnmM4fwRSE8UTK/lUI
	 hMsxLHWDFVOTomRfzsFaFwTGPFN+pufE2JY9QuwFqwKcnwigWkvd20mcHSTOGKTuw520e
	 2u6rrj14B3LWYQx4HO80gIvxDy1PAvYAvgHkYGrQq7vrc1ulPL1jOFidIYjyPNl0ScA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgWLDfXM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8C8606A881
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 14:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C8C8606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgWLDfXM
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so5843935a12.0
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 06:33:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794926016; cv=none;
        d=google.com; s=arc-20260327;
        b=snOKurEayaI2HIeITVBb1rLFQmm9OosheylqHXOjjh8LF2PT8KgzHT9VGh6NTCEdZb
         J97iUIhAhNzbr34XlpoBET5nYZAeuoVIUPm5ZAJ1ryVIRx+BUrQabX98Nt5qNNJx4zH4
         y2+AfNE/z/mWUtsBM1+MR7wqVzCunspXqY/ZPoho6RUlt6gV+a2mWOAcCwiN2mg0pmdC
         J2QrIJUQqe29+mZM9mxjJQCnaeueq1sSjRvbI9+1hWZTmvPCGPzvkAvbbrkfM9AuVVtH
         sufmQBxe/ovWsDOZK1aXyUHc0YYiutAnSGNYXysR93BVK24GpoScanZg3NcnTSWZIOdA
         bDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qYqqunDmmSSST3DA/CdKBNtQiNEx8lMxFK8nZ1VqJzo=;
        fh=IkLokK5yJ+AWMlH0IjMR9Lw1+EZq5atSoUtRIocF13A=;
        b=Uo6U5KXmISi8AwyRZnih7z3x7y6bfqjXcKzrXZPl3DsPHf4OF1ORIkdNqEnFWisrNM
         pRcAohPZj4ijrBCLknzc7na/sSlTSKlUeyJiLC1L/nsbQsy44++8DgPqZzeUhYtEKEqW
         Zf5AInVRJ2etY9/aSjATOtRxBk+BtmhOPtOyKxMNdj8elaRZeUJG5ebv9ytqJ5ZYKwlB
         iSd6Kek/mvURW75ESLLgbw6PWZMaLsGh+BqYiyRW+VCYS+SFQ6a64fYdFPYcR+SENFnc
         WxPtXrkFie0vCHO+qkkxbgvcMFzSoYlcnaMe7qHiw5iVVYUeH39N7iRta6FkDQTYOJDE
         t2bQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794926016; x=1795530816; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qYqqunDmmSSST3DA/CdKBNtQiNEx8lMxFK8nZ1VqJzo=;
        b=zgWLDfXMWBmCfAYYvhsgx0l9slEmm9V9RdpHDOhTx2E8CiRqcwMIZIEszJXtG2LtGd
         gichzrN3gKZFvAnUFv23nMc9YXvuvIoa/P206YEc8NN5XmIYMMp+BXDJKJotgWxztPHb
         28hjHIHqu5DD0J+70Oa5amnh+BtIA6IenjacgjtqwwDOIIFpMjJbSM49ygx+nEvsLVav
         GfBnHekVQBxBSH3xG+64K3lV5JFdfyDWl3Uy8+dpBNCnm3gA7Pk34KXW0KbOeRRIibpj
         I5NYJD2BvhivxKD1YfBrqeNQvtq5SI5UolU1gZJs60CMcMyEgG/MNpEBSLdk9AkkUVrp
         PsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926016; x=1795530816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYqqunDmmSSST3DA/CdKBNtQiNEx8lMxFK8nZ1VqJzo=;
        b=Dj7hYzjTyW3czIjviYkBnkqrpDoU7uFEO/b8oyfP/iPmsPwCkPTCKwzI3W4TH6eBmE
         DR35TLSrapeO4sypBQ5YrR2HFzKTrRv+ODKlqG3CLA29vtJJhtn7YfGLh3IZRX0gLqf9
         b/MiRRlj9hIjnodRhLwsGy2YOaWBR8mxFtwP/wksh3DzQ8csS0kWDn266nQgXYbHabxh
         OlNlFBYk4l3SqxcJBqI6BGbWCwZWVmtwJAtGZcQ4+AnghVsSUfHSCSPo6g50ON0fIXnd
         ibIPSPYW/hvlpVW/BW3kGSMC6mRWAYS/744K96Hk06CcHm7O2+Oas2XRrPRB7v1S1c9w
         zX/w==
X-Forwarded-Encrypted: i=1; AL+hErFp3qNIMN8ed39gTXDI91ad7MFufKD9tZ3EQaIjL0qeqqrlWGUpbxYdW0w/xUjK6I0t286nPA064Hjn@lists.linux.dev
X-Gm-Message-State: APuU4Z/AOGrIQ0QX2CBgW8heCjnuYSSZvZSiApCKrsAw5F034Xj3xb1B
	STJwj7A5QX+lAcofIL/DjQlvGbofePBGgcE06hQD469wDoxjB0QqrmbKW8h2SqPz5VLd7oxozC5
	4bkSmbZCwROVQbKvDmucN9eM1EMb4Fkc=
X-Gm-Gg: AYBFou2h6x04cPchW6eJMhxTS9YF1dmBocMYOTJ+kkwm30NGis/W0BLOUJ5mGJrxDMe
	3gimrwbOBTL/xkLtB/eS9mHPxKej19jSm82+afJgU+Idian4oYhEpdu1hO2ZTGX3e6EeH6Dx75y
	HdmcovOW9OaW5jpD9p63thdz0PKcmmeb1asJW1oMo2SQdTxp7fOhP7Y53Tc3fb3z6mhZAZ3Sdnk
	LImbwCyOx6IP2tYOKLTsQWxvF0LRIkuUgp9BAU9HloPsr/4LH3f/eFt1OzX1qMty8dcFcdRnpAz
	yGLVui8CCLUQ1F8bzO3EmFn6EstsX+fjdWKidFGr397QeirlwDjcsg7ixQHXfj/APoHG6R3L+oa
	UBpAL+8K8UMSeDHo6S6V/R02zVWA1IsmhdFiZZGWWZnQkUQ7CJgPlnCAF5tWrHTOn9Q2e8w==
X-Received: by 2002:a05:6402:c51d:20b0:6b7:749:4bff with SMTP id
 4fb4d7f45d1cf-6b7c0bc3facmr7573789a12.26.1794926015815; Tue, 17 Nov 2026
 06:33:35 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117135146.3174252-1-graypanda.inzag@gmail.com> <20261117135146.3174252-4-graypanda.inzag@gmail.com>
In-Reply-To: <20261117135146.3174252-4-graypanda.inzag@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 17 Nov 2026 15:33:22 +0100
X-Gm-Features: AclHuK-oqTtDNy1F_dD-TE8gCQJwenfN41foadOCG31m2aii0fr_9cwaA2IqUTU
Message-ID: <CAOQ4uxjO-eQPk3OS0iCTRqyFgFSRtVMFywCiPdgWGHkmRBuAUQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fanotify: copy full qstr length for copied event names
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
> fanotify_alloc_name_event() reserves name->len + 1 bytes for each
> copied name in a kvmalloc() event.  fanotify_info_copy_name() and
> fanotify_info_copy_name2() use strscpy(), which stops at an embedded NUL
> and leaves the remaining name bytes uninitialized.  With the original
> length stored in info->name_len or info->name2_len,
> copy_fid_info_to_user() copies name_len + 1 bytes to userspace, leaking
> uninitialized kernel heap memory.
>
> Use memcpy() for the full qstr length and write the terminator
> separately, consistent with __d_alloc() and d_path().
>
> Fixes: 929943b38daf ("fanotify: add support for FAN_REPORT_NAME")
> Cc: stable@vger.kernel.org
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
> Changes in v2:
> - Use memcpy() for both copied names, as suggested by Amir Goldstein.
> - Write each terminator explicitly without reading past the source qstr.
>
> FUSE fanotify mark setup on a zero-fsid mount returned -ENODEV; the
> normal-name FAN_REPORT_DFID_NAME and FAN_RENAME paths were tested on tmpf=
s.
>
>  fs/notify/fanotify/fanotify.h | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/fs/notify/fanotify/fanotify.h b/fs/notify/fanotify/fanotify.=
h
> index c25cf5c1fc70..2d6b5c2c6f25 100644
> --- a/fs/notify/fanotify/fanotify.h
> +++ b/fs/notify/fanotify/fanotify.h
> @@ -221,18 +221,26 @@ static inline void fanotify_info_set_file_fh(struct=
 fanotify_info *info,
>  static inline void fanotify_info_copy_name(struct fanotify_info *info,
>                                            const struct qstr *name)
>  {
> +       char *dst;
> +
>         if (WARN_ON_ONCE(info->name2_len > 0))
>                 return;
>
>         info->name_len =3D name->len;
> -       strscpy(fanotify_info_name(info), name->name, name->len + 1);
> +       dst =3D fanotify_info_name(info);
> +       memcpy(dst, name->name, name->len);
> +       dst[name->len] =3D '\0';
>  }
>
>  static inline void fanotify_info_copy_name2(struct fanotify_info *info,
>                                             const struct qstr *name)
>  {
> +       char *dst;
> +
>         info->name2_len =3D name->len;
> -       strscpy(fanotify_info_name2(info), name->name, name->len + 1);
> +       dst =3D fanotify_info_name2(info);
> +       memcpy(dst, name->name, name->len);
> +       dst[name->len] =3D '\0';
>  }
>
>  /*
