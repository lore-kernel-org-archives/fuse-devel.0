Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E4A387590
	for <fuse-devel@lists.linux.dev>; Wed,  3 Jun 2026 11:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486911; cv=pass; b=b1UyQPFW0h3c+Vzzs4W9PLnuOYt1wlzbJYIgWvAZV2EvmSCmY2Aw93i85YvBS0Jj6MSMFo6ockQYSMHURMHCzQihGq4nEPduWOHNL47No3ePUh97z/dpPQ9tWkPJPtkmIG4/uBuM8AffPP0RH/L8nc2nlY6bFZdGSWdk/jpMQoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486911; c=relaxed/simple;
	bh=hgf+v08DCxwH4VPB5SbWyh+9oGlNmzblhHyU1fcB1mQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QImxfkSbY0pD+sc6/qnKl/DbUPKFgemMLbGr/vCFE/fhPix7mpT4AzCLQg5OgUyVMFS8OzFWaV9liuiKjugvym2waos32u/FpsKRCeHFbqVemXEGr/lCD079ybxX5DXI9piqrVuEpOVfI4Xsb/ktz0GMt13C/XkOueZDHxtd24g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=l767cKcX; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="l767cKcX"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8ccf18ef922so59809286d6.3
        for <fuse-devel@lists.linux.dev>; Wed, 03 Jun 2026 04:41:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780486909; cv=none;
        d=google.com; s=arc-20240605;
        b=b559hFXxGEqFPsplT6CpxOADaH4cV9i4kegcxjduqYthEEBO+ZdNNRVu5YEGRhdJzV
         zvKONpvCn/8BgSLlrokt+Ih60Onj+W9iXyEnNay4GH7fKZdxa9rClRm5yg/YwAHBKZC8
         oD1kemc6guVJocFar2Ro6q2Ol6QJB4gufhTAhGwKMJ1DSEbc4XgkLrBogyx801G+R1gf
         vJl4jkRqw65+xboWHTJFp6WfeL91zDsyPyYV3uLJDP1tIbDJNfXaiT4GZU/59/A4ouCn
         ZWkKPNgXsfckn13OwYbHnLyU1I8HSguIBPSqT+MFL4dxNW/UYwJKIEvpHEyO1/bjmTvv
         PgDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hgf+v08DCxwH4VPB5SbWyh+9oGlNmzblhHyU1fcB1mQ=;
        fh=OwnJn87gW3S/bNuFkg5PkMkcSJWqxBhsQlP6tuALuIo=;
        b=Difsegqv4jj6RLo8qIBqITaXGOT00Adnk92T0Cbl3fCHr27QtX0eoes6XokbfUce29
         n4cTF+D/H6uQteEwACAOkgCojrFV+Ln3MJsRLWeZrNqB27qnZI7ujpvGl4OmxkvutnOB
         eyfeX7ql92vLA1JZzsDBQ07/JOHcIagn1pXNeDDAMpcSSSsj/YD+4NhbomxUaGJPpQwz
         lCtuw960sqrEp30QmOT0vh5tiTXvFP6E3TN8yASEr+x2nNarflrI1pmwvw0HW13bPTYg
         P/3r4T3DyxT5hvaRxXWnV2fO6l50VQ+/GoY8CG14Kl6c3hBzfud3+EZxkx1VHYSl54aO
         d06Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780486909; x=1781091709; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hgf+v08DCxwH4VPB5SbWyh+9oGlNmzblhHyU1fcB1mQ=;
        b=l767cKcXHWhP5uoVxKVzM7peB9J/8VSQ+Wo9eSIu4WAsW9ovx1CQdn/FuwlDS18TNf
         OsYlGZbZ/l/JuIX3RK0oxWohoa/kjjuRmyqjkcBWTZR1hK8tYqezAU+41SBpnX7XhmUL
         NFTvCqnHGNV23UCCDh/zmwsAV56/w8Ui0wBSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780486909; x=1781091709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgf+v08DCxwH4VPB5SbWyh+9oGlNmzblhHyU1fcB1mQ=;
        b=Ik8adrFjUzvF1Az2t4LluSR53QSDAQOZUc7aiG60GnSzTAxB4chi7H5x17zdzcqCKx
         9oQrujVJGKWX3Xx/LQdm/Aq1reSqNHSIor6Ii6fljNL5ZCEPd0jFrI1ZAQubYMclAZEH
         NQwSCY8xksFBUQGBkKY6KtdrkOM5ZJfucXsUXqQf6h68iqvD16AbZKqlS5yYhClgTQFj
         luOwdz0iJ2cfm5+N6DUIrA3i30BkHIKZMLuifAE1O54w73SFhpcldUf4ex4nUKbJue5d
         uUIxvfo8zvF4yDRWz7PIY5qlmUVOoPHlCQBtEFeYYrkKHPy9S1OEDk59OD4ogaFt9/hA
         QM+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+7768zWVDvN7R9Z8cTPHbZJZXEIUINO0ccV74r0L2i6RKOmp2e6yltVnZV/ODd/OF9OUUimk16VtG5@lists.linux.dev
X-Gm-Message-State: AOJu0YwYhz6SfjbihkJ6oJDJtDcZ62cHAr0jwpoLk2LEJCMX5XjsLe2f
	t90sDVTxNLn8UHuaD+4WTkc3EN7rJiLvzHqmjRlCTpchcb+HtXHqluoqhc6t8lRpWwDtiiHC9WI
	jOkCOCQ0YIMSikTYKp1pCBX9+4eaiqxzOK3UE/y18ew==
X-Gm-Gg: Acq92OGQkCODKRbV6WoTjciGVc4JeCLD2EQQdjJimG+BUWZmxVNMZBFOtbCIYBTdoK1
	6CQJrVw5Y7XZueXJ/niedG2lyotHbzg4TH7Ti6ySsfUqOU3sb8DL7/G2Y4SYMRcNfI2rZoltAvx
	o35iDd5ds9IubRUWCwD/6bq1Oer1Lww0heVb7UE8T9YgKw6kgIhm7xcEgmz+HGcUYkUPCCX88Vp
	R7LTGdW6uAesXIavEWuYMq3EqUmB5Dz6Aw3zEV5GtrjNlMvhYKz8o2BC3Pwzp5ZJr3mE0Dsxort
	fLZug6FcAPhm13EzWC40tfDZ1EiIcukXdtODEp4gSGpscH2heTcRwp0P2vdEnUhPr7U1iUiYKay
	8zZkfA08=
X-Received: by 2002:a05:622a:4286:b0:50d:5a11:1b5 with SMTP id
 d75a77b69052e-51778643d27mr46378811cf.17.1780486909124; Wed, 03 Jun 2026
 04:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602224054.1087954-3-thorsten.blum@linux.dev>
In-Reply-To: <20260602224054.1087954-3-thorsten.blum@linux.dev>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 3 Jun 2026 13:41:36 +0200
X-Gm-Features: AVHnY4Lin3g2mVzIsz3ZFIwTrzawAiVJCH1qIICFphO6I4AasIq91n6ReXoXu84
Message-ID: <CAJfpegstgb_zP9S7OxHaPHQXDk1mMjNb+bSY85ZQG_Kh8D-4=w@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] fuse: use QSTR() instead of QSTR_INIT() in fuse_get_dentry
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Al Viro <viro@zeniv.linux.org.uk>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 00:41, Thorsten Blum <thorsten.blum@linux.dev> wrote:
>
> Drop the hard-coded length argument and use the simpler QSTR(). Inline
> the code and drop the local variable.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied, thanks.

Miklos
