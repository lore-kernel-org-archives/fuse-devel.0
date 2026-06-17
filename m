Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D1A1C84A0
	for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698670; cv=pass; b=rUUeZROr4K8RmGTBBn6n1pw5zQJ1ZkZbrhCcydVbzv8hbnbCb6Dt7s3wxM8NBWQb8dLcFwVgLM4XgFT0UWlTQ708oVVhbBNjiYAGd8CxyI6zQaPwukQuXZHmD7LJirorKXtwhJqK8nVBItcx08crNAFsToDMCa4GY+Kau3HnoNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698670; c=relaxed/simple;
	bh=E8MhT0At07VmGnEKVjUb57qG8pbDhDvnMeoC5OEO+HI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvzCC+tUWPAMvx67HnbDR4KQkvJL4AyNoREe5JdUXOsloJ5jVwO0YCkJSYHSai8JYGnsInbJmaYg4kHBQXokT7e+u9/bz8UXiMjiq4H6M30TMoi99RiT/YonVkc/Mf3tUi599sCvtc7gk55sikB5OILAJfmA4tdgA+6lDir9Yak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlRal3UD; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlRal3UD"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4629051c9d1so538853f8f.2
        for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 05:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781698668; cv=none;
        d=google.com; s=arc-20240605;
        b=BZNeM+JaP9rS3pZka5GXehVu7eQNKQ0DwRIqckxojdPmgQHRhK/GvmNWt9nzM7Agqe
         J4qeaqIvdEGCIwcK8FLMWE1uwbkbPmXrKwTHUuI1C9mNoCh1O24RFGu6NJCKvi4jAC4j
         Xfun5Wo2kyeCasD8foYYC0m1356h+xPRZaC25J1JneioVQrP/R3BGNdtmZ1V74r2JzMR
         XBy7p+kQ++qUvJfNYxjhPprMlcMXZRhegrnPDmULdnBWdUb2xq7P3tS50k13tQZT/NQ6
         SdnHr5H6HvElIbfRpvk67Cn3t/Q/QCcwTQwLaKq08IWVcrRHRGgKW+Tu22LtFrh3JTHN
         HLCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j99xkZXETvNFIDRvMtsZuCETKmFqXbmtF7ToQC40+IY=;
        fh=8bUFTemOwDoWiOdOkdFFPfADoT45yqq3f7053C+zN1s=;
        b=LVSgbAb7tjBmho48h0J9auISYnZB5HI4GdA8rbQPOyhiTWLfx/i1sTmfwxk/3BNP3Z
         SE1ReipKKVjTCBEDV7Isc8lsCMfe7ysKGrpxMAnJmawd1WeHtPc75IDbcd+WbXeVyswM
         8uOiks+chGhPS7vYB+kud3lAXi7BqDmMpODZOpWzyW3Yeq7VPMh9gnuojfOf+kmo0XlU
         aZSSn+oERo5BrX0ifIjVxqiBKMOfEN+ii/CcRo/rdYsf1Qqh/skbfTR65bauW6S3NkfZ
         BNDYjiZD+EOWKcUF53uL+qaoXRM96mioJ1gKtoLGXkBcgwEuzLNoQc4SZEhBA1WTIsUs
         se3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781698668; x=1782303468; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j99xkZXETvNFIDRvMtsZuCETKmFqXbmtF7ToQC40+IY=;
        b=dlRal3UDdn24t2p5vP0e60I8M2O5PgPacKZPU2N95HRuGHo0iw/D8PwgiS5LEHWF1Q
         at9gX6/tJFGtGTHcekhvgmHnWwAQ5Z+Dwr0P97BRXeudeySECBQDvurXaQTYBIxIXw22
         77Bmy4ZxFc1dImnb7TfYkLsvfMjpeCOtFIGZgsapGnkYUkhoX0hpvKhIRILnaS/mF3h5
         ZegSn3Sf55wbLAlmJeJNtH/ZIj+W5iGd2Fz6GA7si6JV8erGtktzjrKe6Tutmb6oLyuH
         lMoAZpV2LJenP0LkOzBtu+xPLUNpd17lrcuJp+oV0UiPE46EwuTUg90IcK8uLqvIMWlF
         v5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781698668; x=1782303468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j99xkZXETvNFIDRvMtsZuCETKmFqXbmtF7ToQC40+IY=;
        b=N8Y8hbc6xh8bxbv7QhYWuU/HTSZCj76nKBpf0Yk1yPAzQ+/EY2oDp+gDyQQhlSvvDw
         naBYD+locFKlOj90jkEBu/x+5saTpoOTUC++f6JKXvxluKof7H9DjKkyAo3WPOUOrqbo
         2TxGz2H9PXIJV5C3MCpn7ok6iTEN81LbLELkERTMV63oM7/SuS72t4jTAhfigeHi5Nh/
         L/83EEcyfGotr0VxpgSidygeqFRBKK0UqsKIQb32WPnFFS1DW3dZjkgTAckALdHxpRwU
         +/Zw/za5nOmu22mppRjgjTFXpOHYPx3bEG8ofKnJwVNfdsh+nH7b0Hyk2pZY0xX+PFSn
         ezmw==
X-Gm-Message-State: AOJu0Yyg8Zbz5BYQiWGMBJXXPIBldR77F8lvDfHWCMS46YDZoEV13cd4
	oJsxbtDkSzIvXbYx1rzHuHFs3v9SuHHWa7958dxGjXtRac2CtMFbCS40NlkZnO2wJPgrWKTLIC3
	Eg3G1l4zSpITI4YWGdTa7FVY0JaWZ65A=
X-Gm-Gg: AfdE7ck1NGGVKj7y4Tfr0VNhDTigsiGYajsPikSHAKDtKkfKMfw3k6z2sK1U7lkVTXt
	ujqpmpi5i5ynONPeP/wHIFV7N5oYUeUU27OkXTaojbV5u6b9X8JTjJqvD+A8rrD7YhieWkaSJUH
	4DaO7CW2OuOTrd1AAAWbhN8SCjw913pXgB4MAYudhWw4SR+qyxVepbKvc/3n1dywATiJY/+Ww8I
	VOm+k0/ggTv7cr3rgysYfSvDoIBYj8226KFGf4Mu3vPxzj17Q4r+UG0LiRvrt3pHJM4eBbFfrHp
	Qsd6jXvvXiEabKY951W0mx8Xg3aKVD82xXVxN13kz+VJI417ItFKpV9h
X-Received: by 2002:a5d:45cc:0:b0:45e:945b:276 with SMTP id
 ffacd0b85a97d-46237d5b277mr4153545f8f.20.1781698667412; Wed, 17 Jun 2026
 05:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-10-joannelkoong@gmail.com> <CAJfpegs+EY+eCDOkBgVWhUyd8hBLE3bFY2oaum-k_tS=Cv2SVQ@mail.gmail.com>
 <CAJnrk1YiUn3JFZCEe5oADyK5+zx6Rh_6KTZbCzeHUjAebUVQBw@mail.gmail.com>
 <CAJfpegvokfiN4b1tEd+fAPfO8n9hSQKeXt6-UM1OzxwHYA5-hw@mail.gmail.com>
 <CAJnrk1ZTOcAP85qYpFz6w2TPBK+WMdT1B01T5O_gL68BYAOvCQ@mail.gmail.com> <CAJfpegsixwxHLTMhz6uH=ssvETM4zZOS24x5qUM8fvBHTE7Zrg@mail.gmail.com>
In-Reply-To: <CAJfpegsixwxHLTMhz6uH=ssvETM4zZOS24x5qUM8fvBHTE7Zrg@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 17 Jun 2026 08:17:34 -0400
X-Gm-Features: AVVi8Ccc2f2UCWN22IXAoD-wsfO2iGRZ5659hYS9Gchge-kzpN3R62zecZarVLE
Message-ID: <CAJnrk1afks6eorKTSm__CBMhPcg8v1Cf0gFPVnFDWmfBKMBaew@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] fuse: add zero-copy over io-uring
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 7:48=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Wed, 17 Jun 2026 at 13:23, Joanne Koong <joannelkoong@gmail.com> wrote=
:
>
> > For zero-copied registered buffers, the "address" you pass in is the
> > raw offset into the buffer (eg if you want to read into the
> > zero-copied buffer starting at offset 4k in the buffer, you would call
> > io_uring_prep_read_fixed(sqe, fd, (void *)4096, len, file_off,
> > buf_index);).
>
> Okay.  Could we have a variant of the _fixed API that takes an offset
> instead of an address?

This is a liburing API [1]. We could add a variant of the _fixed API
for this (will need to come up with a good name for it...). Internally
it would still have to set sqe->addr =3D offset, as in [2], but I think
this is a good idea to make it less confusing.

>
> That would work much better for the plain registered buffers too, as
> the fuse server wouldn't have to look up the address belonging to a
> particular buf_index, just supply the offset that was returned in cqe
> (as you suggested) to the _fixed op.

For plain (non-zero-copied) registered buffers, the fuse server would
still need to pass in the starting address of the buffer pool, so I
think it would just use the regular io_uring_prep_read_fixed() API and
pass in starting_address + offset. It's only for buffers that are
zero-copied (eg pages supplied by the kernel) that the addr is the
offset; for non-zero-copied buffers, the addr must be an actual uaddr.

Thanks,
Joanne

[1] https://github.com/axboe/liburing/blob/650d8fb7acb5952a12530b617f09da75=
b95c979c/src/include/liburing.h#L673
[2] https://github.com/axboe/liburing/blob/650d8fb7acb5952a12530b617f09da75=
b95c979c/src/include/liburing.h#L604
