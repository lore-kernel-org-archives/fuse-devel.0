Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC383A0B39
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 22:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778624447; cv=pass; b=mR+2EfbFjk/qorxd/OI+sayxwPqUx+h+hFqDLrKMdHfpjzwfAEOafcBXPZLlZtWNCBJOYtvOHHLT4mlAN/43jlYQDyojIdCOw/S4SFuK9pXosvOzv8QdW+V00G8UCawqQEVd5nUUoHFFvX3Go59GBp8QZ/o0rftBc3sR9H2k4Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778624447; c=relaxed/simple;
	bh=qAOaMhX4hFGUXuJDfpTr6sF+f3dlVHW1uLkRCwtcU7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHSqiaRBh0O7wB7AVYv+yrT7nZYWDOr6OwP8kWUyBbNudOJG4n3WFKgF2c/ql2Jic9u1mKNKD5EGOzoO5Hk7WwCoHQR3ZeR7jOBGauzhBRjjh87BthY5Wb4Wk5PhBlCB3WMiRHghnUq6GTVjLhN1WCYWwPIudatJ/fJwuiqybCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RW+qTXff; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RW+qTXff"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso9358516a12.1
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 15:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778624445; cv=none;
        d=google.com; s=arc-20240605;
        b=kg+UuAf96IGXlS02aohmQuy/kaJ2ManzvzbHbZmdAZlJk/3Ag5kxavza22tkprhHaq
         SnzV9ZxfryiKd0ivletkgmJfnUoOW975eQ6qZv21Ch+mMUMd785rQdtGSfttZG6C3FsQ
         4h+mv6O+QANTQTCt6jpU9beKZjYkyRJ26u3MJ2CvP+R4TPEbaltYffT+aTe/I9Wqf+J9
         R6svNF+HzDbQ+C6W67bIccE+vragVnnxMdbOvnJIDs+IL2NltejUGeh2b6M645gcjW9E
         5n1N374Z37dWbuoHPSEyhcc0cFwb79JIZGt9iPdf8qlW22PhV4gRXlqdeazFvO5nUXuG
         m2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dWs55en/zxUC3Jl0cU0W4m41MbY2arDOleFNWdTIEvc=;
        fh=Cf3EKFWCuOlkB0+bF00t+dyEjZ5G8ZIhb0NIgATppk4=;
        b=AVr/oBGl5BKf0KPOKF3l15ASPLdL0LDXE3x2Zxm3DBmnjSo4rWq9nNaRJTYzGCYHEA
         RunAts/rJvimS4Wdwjo8Mi48iGPKp+uLEbp0yTKfUZWuYXguHj8o/8iI7oofHLKFXOGI
         pF9ziJqBAOKuJiCDGyRBEgOsZbF8oAmmgc0y/RKG29D+CA4wL+jZ/CTIu6tR6Bpgr2s/
         FDuDj46kdWp2ECkDihWZoCZR2L+SeQ0XFCChRU6oKxMagZdejWNoRdNwZYO4aHit9+ZZ
         gvUNDZ8eMaFFexNK31lYvaKm08Xe1jy9Mtvo1YGHAJrDgrhPCDXJL8YcQ/daEuawvlua
         75nw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778624445; x=1779229245; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWs55en/zxUC3Jl0cU0W4m41MbY2arDOleFNWdTIEvc=;
        b=RW+qTXffNRSiaPeUPdKaLBKEsS2WtmiBA3tm+X8jVKC83Xi11Yrgq1wb6wTuwfMZaJ
         OLqt5fkUi+Yu4mZBB3qwqkZCcMM9N3Hmp4lmQup8Z+mmglTbusATjBNPR1oCCD3+QxeU
         DPcVZUc7QfLRaW/a1uZaXLGhYmjJg5JiVLylsbqdVDstPY0/bSceo6hbr4B5PLF2j1po
         mg9AFro9YpwDBEn7s9mho91YZGvDYAB6qFB/cr7FP08EYird1vwaZcLqudFoAN9zAOBs
         aU3NxSLt0wNs+f8UzLX0RqMVg8xid+tfW4qEV/UKX1I1wJqrP/GdDe95aeKn2UwFJJum
         kzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778624445; x=1779229245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dWs55en/zxUC3Jl0cU0W4m41MbY2arDOleFNWdTIEvc=;
        b=QpYN9F6O2ab+42kP5ZTvWHuFdDlZU+EN2MUgeuSK6tSh2oHAnjkreM4ETySLYmsilL
         ltI71Ynajoe1iKsfBpsOMMuqq9Enjuaan+LWWv3QTIjFY0ZRG7hGPzAVcB2Gjr0K/y6V
         oYy63YeYQYVzmFk/Pt1KFTnLn8PYpNyaD9RUNCPlGRDW31QJaff7hZmcrwyrDwhob7P2
         oJekfWPb50aXIkd5drxC4m4FtebsRo7L+0YmCiVEfRq/abpFG8Bd366ecjVw94ugWU+z
         PNhOT3lnOfzHD6MF8CWP4iLw463vX88CCACgp4z4cZgaQHfXDFhoeJi3upaHDOXpbOKk
         ceAg==
X-Forwarded-Encrypted: i=1; AFNElJ8BGd0cUf8uZVc9JrLTgm8ToIWUjN1vve5brBWQ+nvbHzMHe/RZcATHC0SQ5vNPEpSn6cFGxd6ZQqCD@lists.linux.dev
X-Gm-Message-State: AOJu0YwcF/NPmTybQj8D7tSWSKnYz6eio4LhOwd/Tlvem+sca7VQeITQ
	uBLZVDlBMQ64xHO9bfxXiWkEgopIDMIvmSXbdNBlINgloRNSn7RN56S1hu3YA16m3qrsvQasmEj
	d/lYIssXwpoIpTgM9vwkWoG7GyUAYEoI=
X-Gm-Gg: Acq92OF3WnOETUsVzsXzyn2E1f+sXTCaWFOgWZa/7CjFgYsQVUwZgLoh8UPNve3ZRqb
	1XfV21po3eTaqoKMQtGSHBlxIIw15eCLFmok9k0QNV4aLY+CCXo5ee6fT7jYZ2REXYoQigpEAZe
	GUf1AmmkBeaqI6sMOscd5AlMJZzvjQwpKXfBXW8ZYtpzsgIGQt8PCCXPxZqmY/7OMP1QiyfOTeq
	5xfPV1DugLBcy7GJkuTbTBHp34K0o9pwClVdFp8RO7UivaW+/4mOs9nGE7Qk8I4dGPj5iV2G3iP
	jjQW+ZkiMHlb3tE6jepR0f1tRIpHqwOyxTRcw4igf22BJqWlq4g=
X-Received: by 2002:a05:6402:8cb:b0:66d:d2f9:520c with SMTP id
 4fb4d7f45d1cf-68256d5afa3mr265913a12.19.1778624444602; Tue, 12 May 2026
 15:20:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512200448.3818665-1-joannelkoong@gmail.com>
In-Reply-To: <20260512200448.3818665-1-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 13 May 2026 00:20:33 +0200
X-Gm-Features: AVHnY4L6IF1zgyncSGc2FdF5VTc6jMql8HGOFQnJgnPOs0Jo3RzOddRTuqZ8XY4
Message-ID: <CAOQ4uxhAbS+pQiOygY9m+UzqnuuWL9+Y0hj40Nck7_8NX0Xh_Q@mail.gmail.com>
Subject: Re: [PATCH v1] fuse: use copy_splice_read() for FOPEN_DIRECT_IO
 splice read
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 10:05=E2=80=AFPM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> When FOPEN_DIRECT_IO is set, fuse_splice_read() calls
> filemap_splice_read(), which populates the pipe with pages from the fuse
> inode's page cache.
>
> This contradicts FOPEN_DIRECT_IO, which is set by the server to indicate
> that the page cache should be bypassed entirely.

Generally speaking, this statement is not 100% accurate if you consider
mmap(), so "page cache should be bypassed entirely" is a bit strong,
but I agree that this is a good goal to aspire to.

> Subsequent splice reads
> can then read stale data from the cache instead of fetching fresh data
> from the server.
>
> Use copy_splice_read() instead, which will invoke ->read_iter() on each
> splice read, sending a FUSE_READ to the server every time without
> populating the page cache.
>
> We do not need to add checking for O_DIRECT since this is already
> handled at the vfs layer in do_splice_read().
>
> Fixes: 2cb1e08985e3 ("splice: Use filemap_splice_read() instead of generi=
c_file_splice_read()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/fuse/file.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 3bdab8d03373..3ebe18ed0264 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -1859,7 +1859,9 @@ static ssize_t fuse_splice_read(struct file *in, lo=
ff_t *ppos,
>         struct fuse_file *ff =3D in->private_data;
>
>         /* FOPEN_DIRECT_IO overrides FOPEN_PASSTHROUGH */
> -       if (fuse_file_passthrough(ff) && !(ff->open_flags & FOPEN_DIRECT_=
IO))
> +       if (ff->open_flags & FOPEN_DIRECT_IO)
> +               return copy_splice_read(in, ppos, pipe, len, flags);
> +       else if (fuse_file_passthrough(ff))
>                 return fuse_passthrough_splice_read(in, ppos, pipe, len, =
flags);
>         else
>                 return filemap_splice_read(in, ppos, pipe, len, flags);
> --
> 2.52.0
>
>
