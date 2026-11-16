Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794825230;
	b=tOnBpm46wl8tUwNHn2ZoebCDr32oQPcISCyQkoNC8e/r3ghRYMz+IAJGvxd2Qf6SfZ09
	 ffoiYtkh5yxmY/Ii+wA430svoWbpWBI4iDj2Px+BkgGx9IwCFpAG0CQ85S40ZcEZ0SnLW
	 xucAoJi4ET5vpuP4VA5QdZNRPvRWhwSLjQv5dS9EcguHl2s1x00DAxM0niH1hWmhS/oGr
	 gtM/eGcZTVjBZUXvE8h8mq67GRfMVxYSW8+u0hUjE7Taj/MwQzZWSFE11tNBN401mRDwE
	 vRVtsYJvPEzrzG6yi8au8AZVY+S9juy8jZw8L5kh6Hj8AVHlt5RQ43RhXgERo5SRLFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BcX26cyIolLDGV7RzmSSpE6fHAk7h/NEUs+iaS9LpDg=;
	b=bF9c4aEz16YgULMZUFJbnHzxGfz2tNbif8coMCPAIc/TJghrbaoh1CcRq+em6npnj7AO
	 IqoVaSeDtiyJPDqmrpFcyJM8UIg03YXk6VPQAGVOwVpXFPRw3KdUN4hW8nUCx2uRRb/OC
	 xNCuKuizwJ4biR7+Ex6XWPxlvnDcbE8rfHnwBaUmwh/odMffxJB3wQ1mZPvFS2RjDwIY+
	 tErFFPGD4330MzM+Yhv7aSSl/NccV2SbljsObebM3X+6SP3MnZyeIXV7dswTLtFT9R8Z/
	 9FQPYIHLvrAjLHiIqAf9DH6K1K2TGtUsyZwJHOvZRQMUtalAWac2RKY6pgHxPoKN87g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jG/ecO9N";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86C1606A32F
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 10:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A86C1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jG/ecO9N
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso7453703a12.0
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 02:33:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794825228; cv=none;
        d=google.com; s=arc-20260327;
        b=J7ItA4v96oBh5BbVhLPOOJSCjDKzP4W9aIlr/jzn7rPJRpf79kmkyIo0hNkeh4LzwQ
         hDkE9dbRwjb0Nr1n7VdqcQzdSimkXQU5Jy7bVjerxd6CSVwpK5tJIK2MMgxmqLYivn19
         gqEEmXGdyVp8jiL0ID+Mv4PK+rp5hJCsgZ3I/tGYxffC3Lw6xDbJBg/ETmeP6jArYo4w
         36jiaLRuaSte5UcD5JFJPEkDgO3ZQLJzv475h0hXbsPfvDyVzuAW6xP5dWvwSQa52DnD
         MD9kGRuPVpkZisaNweeGOLF3MPMKM7dpQOtXntV+MJhT9uYiWzJcsc/0+JZkEPSOcKne
         RIxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BcX26cyIolLDGV7RzmSSpE6fHAk7h/NEUs+iaS9LpDg=;
        fh=xWqS1J/7YLAYPJrUdU5SrjfuSdOVMSuNOSl5Snw95Js=;
        b=H8e8NyWr8tw/qPmfdO9vk9zZUkGVGREC2l7etdXTCqt6PlvBR/8fEUSb+t1rZujYWl
         D4O9WWWN5GE+zXAM/ddFBbGrzEJKYYGLiIOaAft8zXrGgXBY96WLhhGjjsJ/WaToNI5I
         34Z/xx71sjR6BtfHg58GDLQIQlwPjsXC8C5cvto9nrslEvTlSFjvHj91CP9jojJjkqlA
         XVStAC1omOQtkCjFMoPRIV4tMqxfC1bk7CtuuwmC0orS6oT0pX3HLWKqpxBGB8uHxFrK
         g8I3ajEJN+ok574xze7y7WeFWDvMJzrRI6nohgZvfknUn4h3ZJtSRpj2eBZK0KH1ZbtH
         3FhA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825228; x=1795430028; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BcX26cyIolLDGV7RzmSSpE6fHAk7h/NEUs+iaS9LpDg=;
        b=jG/ecO9N5lU3D1Zs1fLoh+WTqRD+ycrcjkhB1V+LAdG5n46JCh9g7RgyluK4kjBKaE
         iYJ99nwKv1OHQanHEBBWxHE6wDwh8ylR0ed3Di172kHqg8FjlFE4Zy2m8n93SHO2vB72
         Qjf9VfypjMokq2ZoJU01jHQLnU0Iqk8JtzAzWN++zzKChSIg8r+TETmKBf/eYpQODCzO
         mmVYvuvekMOIqa0XS4XXUnswd1GPHASMkbCiW9/bCsNo8dlQ185zpmzMml66tT0s4XcA
         Pc+AKua2OhS6H/juBCUM9QU/43pPIyDvD2WzJ1HBGHNzkY4cW/XVrbvLLuUZnyUcKmEm
         tf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825228; x=1795430028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BcX26cyIolLDGV7RzmSSpE6fHAk7h/NEUs+iaS9LpDg=;
        b=b0l1zC09TcG1gTHeBPktvXMd1OKv0fgqSYadAYcZnobSavPWxOvKAewCcRQJORhTqg
         LNJ7HGM9PyDRs2iJdlS5m9WbpI5fzdNY4RAe8u1fFMneX+MIcK0KXsLL9I8QsliihXvr
         2ZTRe6PTg2rK5g9A9U0CejE8rnQSJQjBURogK/1/gtuJ6Ak9xX+B6NlCQyUpjsi7pyXQ
         FWNRXU8gmtdNT4e1+ZQoeT0RyBBJfki6FkaYk8m4MZ6Xgsw/d1VoMTbPfK2Rsgjc40cH
         gQn341mo3NrhDIoJAEfzEuL1Q8kI0hDgDCIO3PAyAEVu8QR+QmNvS7HyBpAvBDClPmhL
         EZwQ==
X-Forwarded-Encrypted: i=1; AL+hErFfk5WW9ZfchQis6Ut/OPdpyf/pd8b7jb4OOAwftQ7wpUgxwLIxA82dC2nV8hHLO+/PKhgz+y/DMTiW@lists.linux.dev
X-Gm-Message-State: APuU4Z+/n+wMFWeEBbRZpU65Gk1va9uhjCZP3jae/sEty8L6FPXMxtuQ
	wKZI22dFhGTASCvrqkZncg+4FUnAEMAXifAcQwFcPCjnk+36GmZbmumiu1tbziEt00Rq2Iasnwh
	RO1DH/YgAt4h9+tD5MLITG5MP4dwIRNc=
X-Gm-Gg: AYBFou0YMuDS57xDeazED6uvw623+nYuEMlkKkaazk8u16cwQSdQQg3BhfVhUwWUK7s
	9H1ihh4eHi85dHIQboN/RI2PLbF0CZUlWWRkjjNvwm8ycj2CH31AeE4SGwiUBHZ4kV7c9fpEVLp
	A8lANmWRfOjw9d3p5NSgR5mMRV1sPSItOpJZaXGq/hVxh59EDWE7VtSPHZut5CsxZOiqMEWIPM7
	k3GwR/L3sOzkO0qAQkhOI9B5DlfJtuKHUdhEGIQgDjTKLeWMpa/D+5AejzPuTm1uRgjt6y5akuU
	Wi2nhX818XDSHZGWVm9G7KgaWgslPhmxBQpQx1DCgzoB7MM18hvjHq7lBJl77+CqW0eXCxxE/IE
	IkPQWLcvv4eHdaDT8tCSP78RM+bgxOYfEXXr4k+rmBRRD8cJ1KvBmvdVq1KMdBOFQRjmLJA==
X-Received: by 2002:a05:6402:44d2:b0:6b4:59d0:7294 with SMTP id
 4fb4d7f45d1cf-6b7c0c7fc57mr6737947a12.31.1794825227756; Mon, 16 Nov 2026
 02:33:47 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115210952.2140036-1-graypanda.inzag@gmail.com> <20261115210952.2140036-4-graypanda.inzag@gmail.com>
In-Reply-To: <20261115210952.2140036-4-graypanda.inzag@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 11:33:36 +0100
X-Gm-Features: AclHuK-NMHGmo8BvWWPeGRhVs7Os08I_QBobJYDFHOlrsGgrh13rxr7aQnEhSTs
Message-ID: <CAOQ4uxibz=iM4Xg6qmRmqKB25w=Z9AaaqnMqc-L2d27G632hyw@mail.gmail.com>
Subject: Re: [PATCH 3/3] fanotify: zero-pad copied event names after an
 embedded NUL
To: Junyoung Jang <graypanda.inzag@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>, Matt Bobrowski <matt@bobrowski.net>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:10=E2=80=AFPM Junyoung Jang
<graypanda.inzag@gmail.com> wrote:
>
> fanotify_alloc_name_event() sizes the variable-length event buffer from
> the qstr lengths and allocates it via kvmalloc() without zeroing.
> fanotify_info_copy_name() and fanotify_info_copy_name2() record
> name->len in info->name_len and info->name2_len, but copy the strings
> with strscpy().
>
> If a qstr contains an embedded NUL byte, strscpy() stops at the first
> NUL and leaves the trailing bytes of the allocated name buffer
> uninitialized. copy_fid_info_to_user() then copies name_len + 1 bytes
> to userspace, leaking uninitialized kernel heap memory.
>
> This mismatch dates back to
> commit 929943b38daf ("fanotify: add support for FAN_REPORT_NAME") and
> remained after commit 0fdbe845534f
> ("fanotify: replace deprecated strcpy in fanotify_info_copy_{name,name2}"=
).
>
> Switch both helpers to strscpy_pad() so any trailing bytes up to the
> recorded length are zeroed.
>
> Fixes: 929943b38daf ("fanotify: add support for FAN_REPORT_NAME")
> Cc: stable@vger.kernel.org
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
> ---
> Note: default FUSE mounts report a zero fsid (-ENODEV on fanotify_mark()
> with FAN_REPORT_DFID_NAME), so this patch was runtime-tested on tmpfs
> with FAN_REPORT_DFID_NAME create and FAN_RENAME events.
>
>  fs/notify/fanotify/fanotify.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/notify/fanotify/fanotify.h b/fs/notify/fanotify/fanotify.=
h
> index c25cf5c1fc70..4a1f14aa4974 100644
> --- a/fs/notify/fanotify/fanotify.h
> +++ b/fs/notify/fanotify/fanotify.h
> @@ -225,14 +225,14 @@ static inline void fanotify_info_copy_name(struct f=
anotify_info *info,
>                 return;
>
>         info->name_len =3D name->len;
> -       strscpy(fanotify_info_name(info), name->name, name->len + 1);
> +       strscpy_pad(fanotify_info_name(info), name->name, name->len + 1);
>  }
>
>  static inline void fanotify_info_copy_name2(struct fanotify_info *info,
>                                             const struct qstr *name)
>  {
>         info->name2_len =3D name->len;
> -       strscpy(fanotify_info_name2(info), name->name, name->len + 1);
> +       strscpy_pad(fanotify_info_name2(info), name->name, name->len + 1)=
;
>  }

Same as for inotify patch I prefer that we are consistent with d_path(), fo=
r
example by using memcpy().

Thanks,
Amir.
