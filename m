Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E60194C98
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 01:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778893465; cv=pass; b=MiRi1WQq2ZUIptb2GN+gbu5NOIeXhLijLIFUUNApv7hI0T2AP6ihgZMd1Hg2QJoLtyD2CqK8Hs76BBIdlPnH2xUyCXoGJ2IVcV+XhSQT07fDBJGC1q7qKQXJinvsYsp0/cdHCcmuRhjZn30uGeVGmA9gbrJon0P0qns4cXcVSRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778893465; c=relaxed/simple;
	bh=HjfXyAreThSB7plifY/0RnO87buo4k7Jm7ynrCfd/68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtvTp5TfnRij61yIfyZyfHNPjFl7jCRpJxyf58yfYjrR/QgnX4j5Tg5jjgx2E5RCMUnDe470BbXtMNVnIkIcEb9LA8ipPHhyxRorAfbDSHoqr39K4uzmmmLpW1cRwscW2bUTrUAHkUUqktamuYXR3MTTenwGkHtAsX2FWGW2+0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LD+CGVa1; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LD+CGVa1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so2195615e9.2
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 18:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778893463; cv=none;
        d=google.com; s=arc-20240605;
        b=X0yOsr/4wVEr5jEL+030S9LblEZlKhKJEpQ0q3FATBOcUoWUAP8LhSdX8ksWFJFvBw
         1XgHIONCa8TW3gpfhjzSZK9i80X3oFBRwz23H1bVpDFzhbnwL8ctyPw9EydG+p//+WAd
         i7vkWVflKBfPHTRVz9NlgipznoAFoQMryMAyuFb88fsUwjog08YX7gIUrJ7HGiD+Qx8v
         oCRkyJU1zormIz39LPKVQTkQ4frck+aPc9njbxZ0eBq2IjLaDqTtJZF1UuL+S2Dvj6hX
         TEPomG2w4EewVLqVBa152vLWw5eOTqqdIY+FEEqrNzemgs5Jp5axt2AnkOsmDeFH9HeG
         tS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rMAbpirgAMOxyu32qU3H1eARc33X7yqH04nuIA50Xlo=;
        fh=m/f6YJvJ+t5+4aY2YI3TD839gW/9+K7lKLC2GNVR6Rw=;
        b=kdyP7p0oUEio6JTz3pHl64lkyzAoyZ3IbuU3BvY1cYi9iXYWy1K9k2KjaMeeHoitmz
         OZuXz62SGyX872Ntv1iO8hGj9QDgOeYxQD3AwqsBkY0mPZ9QEOfvgm5uEKsCxffYzOZX
         aLjAsiAWiYSq1x9quu133eTsUXh6m7MsYY6DCV1eb7E1SVxsEQaHbCYLiJ6yOLlAPAqa
         +yLCZUxMXH14AYvFQeg3QOrKa0qxULA614nuV4DjlwrgVSy0I//wp/DXb07b+CXw7VCp
         YCsXNHkPHIVCFCYxjTkpIlQk10i+WS33HXhNHOTgOjUNEVtNL5M8A0meeRRTAUjk773D
         n1kQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778893462; x=1779498262; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMAbpirgAMOxyu32qU3H1eARc33X7yqH04nuIA50Xlo=;
        b=LD+CGVa1h4jsa4toJg1qeWrRLrQEe40Sq0BHDOBhEK8XQAmvZWo15r01o3VgaJZqes
         0b1nX/IAyzVM0s5FkM9/pyG+Y1osBEMV++seqNriN8T7Dwb5xp1rWE5nngIVzFSGHjLt
         3VFQeRidEK8p4BrcaS3uicbmW0v+gLRIWwIyftuGZZbml56hhvOiZ+w/eSwecEkySebw
         d599ob6Dgr18/EVglWbVT1sawhh4HaUcAqlER9hNwfCG5L+Pnpm5+FTf2cbqL+eiCm5u
         M/cnKN4J52ZBZdlJf1hy13OsqgkX8dM9Cbrz8PTy3EHChHNqyBjs44rKBT9+NUhORb6P
         yGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778893463; x=1779498263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rMAbpirgAMOxyu32qU3H1eARc33X7yqH04nuIA50Xlo=;
        b=UD5NyDg/JjM4i+J25vuJIMS3kyR0GVwNFG6ffq1xXqi3nURUWE/0vsPFbfQY66CgWo
         ltAxdCq41eoLqlC4ovT3NYOZKHLnYFmKg/joIe+1RG5rGtiGM732HvSmldSK8wUDH2Wd
         jKIgZf9+myg5XLf5Ia9t5K7RE0QDPBG1xH0sctaWw39RgRCx6unAgTMJCDPU0eQ455ag
         VupNqXH52YiWzUSo5V1mUGspk3PHi3hif0wauwLaIbpziUW4j6Y/rIrSaGqyE2aq3a6O
         qUQ3BCjOyuqbB52NoZyi7WA/ZAfGIAnGOE0xdPXxSpq/jpxmn/9BhXWbPzZB0o4fEXag
         HHiQ==
X-Gm-Message-State: AOJu0Yy4wt3ntjKxLTbafUAyC5HiWevXMN/QNcNrNFD0w1o53oW37nqR
	SVO56y226BbIqIEFCS02QPFW2mpXiRqjpXLcHMoXApst9keeKAd2M2M6YY/rsPnxvOfihnvF0CT
	4CViPvW88yyaJO7/rGRZy/5nt7kxgH3ZMjFmfl7xfJw==
X-Gm-Gg: Acq92OEM9jRwxU6E0vtVEdCBnSCWqgh84imMccIF8FnxrJJ2u1NkRwWmScMcLkC1FB7
	SzhQyuORWh1bncIuaN2itNkMeu6cA282BOQeWaDToBEpAed89wM6oEx3ryMQit5cUw6ul7sjnxK
	YH3dcmOeQA/oGnzBpvUAuZ9gEvOoJVaHCCZJgoqUQRQguWs/i/7wC67z0GT3ONQNpAKv2jYXTRF
	yhPWNyPGCkJke60qQOTApfgO1fQGC2lCLFMjxvf4Vewgscp+wOLYh+P7AtNG3IzMgidNtrfWhpK
	ue3k1Q==
X-Received: by 2002:a05:600c:3e11:b0:48f:e230:c3fb with SMTP id
 5b1f17b1804b1-48fe6626a8emr94789465e9.33.1778893462397; Fri, 15 May 2026
 18:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com> <20260516004004.1455526-20-joannelkoong@gmail.com>
In-Reply-To: <20260516004004.1455526-20-joannelkoong@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 15 May 2026 18:04:09 -0700
X-Gm-Features: AVHnY4KoZdiSGJG-4wYSni3XkLB_-aOuD-lXy6zSI7M5cwElKh-O7LAgLIiFbp0
Message-ID: <CAJnrk1bm=QOmY9MNZf5rbi-aTLaYetJ2Ziu7A5q9m4MMy5-Y7A@mail.gmail.com>
Subject: Re: [PATCH v2 19/21] fuse: add passthrough setattr
To: amir73il@gmail.com, miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev, linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 5:53=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> Add passthrough setattr which sets attributes directly on the backing
> inode through backing_inode_setattr() instead of sending FUSE_SETATTR to
> the server.
>
> Passthrough setattr is checked before the
> handle_killpriv/handle_killpriv_v2 suid/sgid stripping because the
> stripping is handled natively by notify_change() on the backing inode.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dir.c             |  3 +++
>  fs/fuse/fuse_i.h          |  3 ++-
>  fs/fuse/passthrough.c     | 28 ++++++++++++++++++++++++++++
>  include/uapi/linux/fuse.h |  1 +
>  4 files changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 4c7e3e1604af..b67b3b334e69 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -2506,6 +2506,9 @@ static int fuse_setattr(struct mnt_idmap *idmap, st=
ruct dentry *entry,
>         if (!fuse_allow_current_process(get_fuse_conn(inode)))
>                 return -EACCES;
>
> +       if (fuse_passthrough_op(inode, FUSE_SETATTR))
> +               return fuse_passthrough_setattr(entry, attr);

In the v1 discussion [1], there was a suggestion about gating
FUSE_PASSTHROUGH_INO on FUSE_HANDLE_KILLPRIV_V2 to avoid the
non-atomic killpriv path, but I think we were only encountering the
non-atomic killpriv path because I was calling
fuse_passthrough_setattr() in the wrong place. I think we can avoid
this altogether by just having the backing filesystem handle all of
the suid/sgid stripping atomically through its own notify_change()
path, which will let us skip all the fuse killpriv handling logic in
this function.

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/CAOQ4uxipQJt5zskb_THxueGi_MXpFdywFiG=
pd_nmWeY_sMHwzQ@mail.gmail.com/

> +
>         if (attr->ia_valid & (ATTR_KILL_SUID | ATTR_KILL_SGID)) {
>                 attr->ia_valid &=3D ~(ATTR_KILL_SUID | ATTR_KILL_SGID |
>                                     ATTR_MODE);
