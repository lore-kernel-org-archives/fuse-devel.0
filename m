Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E9D32D7F8
	for <fuse-devel@lists.linux.dev>; Wed, 27 May 2026 17:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902548; cv=pass; b=ZPgquUnJojck+aPMY3Rhqo59fizt3Pkn/1KYwL5DodVcDn8gekWXcES09TydKA644IENORIsyheNNqNRC/sLvHNzUlnTUp46UzeZbzitEBlhSYYOrqX8EzU2q1IEjmU77zrZDGiIFWkZgu6q3+sPDU6mqLgupivwjzaZ9y6ScLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902548; c=relaxed/simple;
	bh=xWOELAcUGcSKDZVay+uKVv8DquFSEP0JBDqmg7lGgGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kfc4lwioFeyMJzAYcvwD1VOq2lZW8PajItVgmedfi6AOVyIUWoNj4Da9gCWYrb/4Y8qCWnBTeiIoAGupszZiRgSeDBRlNI/FNCAvHi7oOnkmMPidjidZmj3S78wglB46XE5qqC/69vBshQ2cegI+yWGIv0CnHd3HA5Zl8D9JyOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ik0OTcJV; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ik0OTcJV"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso19586615a12.1
        for <fuse-devel@lists.linux.dev>; Wed, 27 May 2026 10:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779902545; cv=none;
        d=google.com; s=arc-20240605;
        b=I3dvgw5f48gl9EJMfYUAxmC9Zh2Bn/4PGPrO7CW2WlE76HEGRtdR0mFwW7vDdJdEOk
         Kwx5uOB6sgVnSGreqWHbZC/TBjceG2exboJeyXLy/su9ReKLLRrjKeLOqTIoSQklrMOf
         P/3WQAMrelZ8R2TFjwqc2T1Zgd9E/+UjqBAugtVrFzA7w1djUhWS3PPBUE5agov1q3fj
         2yD1TZUS+fNwm1v40VxNbgpkFO4lFc5VVh0I7iMZNTKyaImfhzbxuYDuMp/SI3oPI+Xr
         xLtDpvQGxfWL8Jw9K+kk6RW5EzTMsOZsxBTLUsiIYPjriH9ZRJP/jwmWiqVOJb2ps4pm
         nAVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2DCx/GfCsxKID9L9hrqpo9Z9Drtthz58CWbiDxH7ua8=;
        fh=aXnVIysyGk7s8gKLcSaPRbNtrnTdqS1ftxa6anJCATw=;
        b=TI9pOSQCknb1cI8TVHNwLk49eTxkzvYQWGSitNlcdimcCew+ULWtewWY+ZLMO5aIxB
         4y99SBrtjQPBr1COIoNzlPBBm+JWDdtjOuTWdZe8jRI9fmNKKZoGeoaP9AEeztHBfc/Y
         rwTP2srVviTBH7I1ZtqCQKxjsiGEmNBpsgD5pQomooXV7f3CqcjMLsZWl8slp8MzxEOS
         81kidDXXpMYFhCHEvI5vfr0eMVwbVtW7ZFo6W5dsTR3XxbZYDEmEW7uPiuYeLbeHZ2X6
         k9t4RHdznN9l154GidioCthCBK2Edfh+K3ZjQ7MVxKacRcc2WX+qz/PpkZAujSdmkwSp
         J3lA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779902545; x=1780507345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DCx/GfCsxKID9L9hrqpo9Z9Drtthz58CWbiDxH7ua8=;
        b=Ik0OTcJVFAgRVNGMVM0ul/QDkx3fD1ZsXeaMza5P0CPjAb5SCNExeSmHODcmjKcLK7
         MrXH94VG2qBDdiMKuzbsuG1aoNvhl9vmpqWSI5bbMbav8hbKKnfNfvl2+ghqBfxaEhhp
         Xw2uo0yKYEWezNdCp/Repy4m0OAWdzRaOPMdLQH/7y3G0d/oruKqh9yU9DvTv1BVIowN
         6Fwjr6231chK1aWyi/Ch+2mQlLe2rgqqeTo7d5/4/RgO9VjV+9ZzvEYMkEBNI565NXAH
         siIj8NvKwHKAIYXYWVO/cmS94Lv8OL6Pi0pl7MAcnqilR5wB7ymC70kvfyznVwGD9U8V
         ROmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779902545; x=1780507345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2DCx/GfCsxKID9L9hrqpo9Z9Drtthz58CWbiDxH7ua8=;
        b=YwSty20i10KCpTCRcNr0jT/jbFhMZKoW8SvbzRhCik0xQRX+li0eL20dr0eP4kYJKG
         XwolivUYCXzm2krI8PjjXA/bhM2wgYXaHwcjzzLFjRGoQbMfN6fCqsIWUqCBRcER/sQi
         c06kJvoLGmtlYjngQrLFTnryROlxCgbjKVmehzlIdTQqbfflIoq9ilyztLLQLfVjAuiX
         P9cMRyIfHbYqufjr2M6TJso+gnSRXhP/v+cAGK59DTzTUN9bPnVSBe/fXqvGGjrImUjh
         8/OBVMvrCKhRfRDtucTjp5+0KKdbNfHC/lIv+OY3SyoqI2942QJQMX0Odp1g9flG+XyK
         mkxw==
X-Forwarded-Encrypted: i=1; AFNElJ/M1OPHtCPvgHcwvwc9Cvz1jP+tLO8FdJV8TyuQN/3a8l72ohDr+yKAFyFcTWeSQ/kV7nsaVblMj4X2@lists.linux.dev
X-Gm-Message-State: AOJu0Ywbgl+8qTFfonBbiyMnwY7qULT3CkBTN44sW/10rkxuiIASpeah
	3Hqnfg2lt2BZIjS2KM8IdyDISP2Sd6P3HcT20i5QWiLzejVTmYUc99R5nuChk1jQ0NrszED1hmW
	RDnZr2whhynd6I01heADSA2YLdrw08Wk=
X-Gm-Gg: Acq92OFxaYQzUNHtRiQi9tSekJ86DC1r9xklGbEOZi3h/Pq5aZMGZ8RpW2Op7Vi2Ods
	S2Y8utwM6ywPhTa0yQ4+yZ7N+hVd4vscUdOvxZ+G2PUNUsFPbOlSsjohc4O03eIBMZjHOsncSzc
	qXuySIY8PLx8StCTK59wO2dl6tUSeJL9Wy6OtC/woHKf0kP/UYRkZ/OyCEByAnQ+Ya1sUEnBjJW
	mbsIjxFZu2uS0xnnS1INIWWGSYKesAfoemmiy/LHL+GTEvWMo+oKzKb9K9dgwq+i0sruYLMfoCk
	yd8dy5vtbYla3F3GZUfIrvwJM9LkfRXT9F298Dcxv4tfAdQz4p80
X-Received: by 2002:a05:6402:2746:b0:68a:510c:f956 with SMTP id
 4fb4d7f45d1cf-68a510cfbb5mr3623067a12.1.1779902545340; Wed, 27 May 2026
 10:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527171808.828637-1-amir73il@gmail.com>
In-Reply-To: <20260527171808.828637-1-amir73il@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 27 May 2026 19:22:13 +0200
X-Gm-Features: AVHnY4KcStwYqbM4xju8K5FtIa89g6ha0R4fFutIlB5R81CjHbhumw4gTA022bc
Message-ID: <CAOQ4uxjMEdQTyWMfuxsG7QrVjCehaLOThXo8BcYNXWTRCAnXeQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fuse_request_recv tracepoint
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd.schubert@fastmail.fm>, Joanne Koong <joannelkoong@gmail.com>, 
	"Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 7:18=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> This new tracepoint complements the existing fuse_request_send (enqueue)
> and fuse_request_end (completion) with a tracepoint at the transition
> from "pending" to "in-progress" at the moment a daemon thread dequeues
> a request from fiq->pending.
>
> This is needed for tools tracking the in-flight state of fuse requests.
>
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> ---
>
> Miklos,
>
> This patch is not technically a fix patch, but it complements the
> tracepoints that were added in 6.12 by commit 396b209e405a5 ("fuse: add
> simple request tracepoints"), so it is my intention to backport it up to
> 6.12.y for use on production kernels.
>
> I came across the need for this tracepoint when working on fuse queue
> monitoring tools [1] for our production env.
>
> The fuse_request_send tracepoint is broken on 6.12.y, so I also plan to
> post a backport patch for 0d375a1385ed8 ("fuse: capture the unique id of
> fuse commands being sent").  Not sure why it was not tagged as Fixes.
> The existence of fuse_request_recv

... in an LTS kernel will serve as a hint that the fuse_request_send
tracepoint isn't broken...

>
> This patch is intentionally based on upstream fuse (v7.1-rc2) and not
> on for-next branch, with ease of backport in mind.
>
> Specifically, commit 80cea98b648ba ("fuse: change req->fm to req->chan")
> on for-next needs to apply the same change to the new tracepoint as well.
>
> Would you consider applying this patch at the bottom of for-next and
> make this adjustment to your refactoring commit?
>
> Thanks,
> Amir.
>
> [1] https://github.com/amir73il/bcc/commits/fuseq/
>
>  fs/fuse/dev.c        |  1 +
>  fs/fuse/fuse_trace.h | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 5dda7080f4a90..583155157d117 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -1475,6 +1475,7 @@ static ssize_t fuse_dev_do_read(struct fuse_dev *fu=
d, struct file *file,
>         req =3D list_entry(fiq->pending.next, struct fuse_req, list);
>         clear_bit(FR_PENDING, &req->flags);
>         list_del_init(&req->list);
> +       trace_fuse_request_recv(req);
>         spin_unlock(&fiq->lock);
>
>         args =3D req->args;
> diff --git a/fs/fuse/fuse_trace.h b/fs/fuse/fuse_trace.h
> index bbe9ddd8c7169..289a279b3c312 100644
> --- a/fs/fuse/fuse_trace.h
> +++ b/fs/fuse/fuse_trace.h
> @@ -101,6 +101,28 @@ TRACE_EVENT(fuse_request_send,
>                   __print_symbolic(__entry->opcode, OPCODES), __entry->le=
n)
>  );
>
> +TRACE_EVENT(fuse_request_recv,
> +       TP_PROTO(const struct fuse_req *req),
> +
> +       TP_ARGS(req),
> +
> +       TP_STRUCT__entry(
> +               __field(dev_t,                  connection)
> +               __field(uint64_t,               unique)
> +               __field(enum fuse_opcode,       opcode)
> +       ),
> +
> +       TP_fast_assign(
> +               __entry->connection     =3D       req->fm->fc->dev;
> +               __entry->unique         =3D       req->in.h.unique;
> +               __entry->opcode         =3D       req->in.h.opcode;
> +       ),
> +
> +       TP_printk("connection %u req %llu opcode %u (%s)",
> +                 __entry->connection, __entry->unique, __entry->opcode,
> +                 __print_symbolic(__entry->opcode, OPCODES))
> +);
> +
>  TRACE_EVENT(fuse_request_end,
>         TP_PROTO(const struct fuse_req *req),
>
> --
> 2.54.0
>
