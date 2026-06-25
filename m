Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB68530E0F2
	for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 18:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782412376; cv=pass; b=sJ/+GpRKXdHXk67CMl6Acl6YQ6bYpTlyEh07m3HcMI2PudKfJKrBwCYR0/4BucUuiHQvpZe3TP43hixftjLzMpgBIg5yPKIApMGMTDhdAfDnXCqOonUCUsN7VDbQ1qcAlGT2MEYLlsabgmZcXiSkdKBh+8Q+nBf+QnRXopUPOF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782412376; c=relaxed/simple;
	bh=BDX+NQmwbo8tKyIHJVU3KO5zaM+mKg+N84iqF/OWUBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kx8KT7JGTcjNesl0qwFKE93aeWgmQXLFIYvPLAoaF5H5sHrnwrYQJUpRhWqe6C9Pb4e+w1S83gX0k/5VarBFekg0OOU8cil55uqdgs+dhVCgh7S35lwH+m4APhCU5bMiiHgfLeybg9hYwDszA07z+pvQaPVZjLEDBcpM6Dgd9BE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0By5HZm; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0By5HZm"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-46dd46901dbso56823f8f.0
        for <fuse-devel@lists.linux.dev>; Thu, 25 Jun 2026 11:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782412373; cv=none;
        d=google.com; s=arc-20260327;
        b=J/OGtAK3eDnN2g9JmKeKAO9GS8XU9OK+RlGQDZISpGj+jMyXyHI+MOmXm+6alw8atx
         ZRECSWqa1QA0QPc8DAedyFHidipx7Be3ZiB2LFfcinGWtlzSyfyhkNsRCBXol+9BkP5C
         JKd21ztevTPwZ/8xcs5HqStK4x3wRncqxO4qKU4S1V120wLt8kr6mGlGA+/BmawDmd/4
         jCS4SBpEEathu5rBgiDS7R1zhCBQS4CryNafmXOmGRUvNqSjbUDJNRwcWhP7htW96fbt
         A+Z9Zqp62dyL1LAnmxZ8jGlOThPAWzbdYZrNJF2fluwHCy5YaLzB5BolsGLfy+D3J13k
         76Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g9V61tcEtmNSRd/wIPFD8Kzb7PIr8WM9gRz3AhdzXFA=;
        fh=7OKASgwuKTynvoPNbfsS/K4+sT0HA0PIq5h5cE1EA/M=;
        b=iWqp8k1zP0GQJkEOJR1oEQiUEjSJ99yndCwQfVvReQUQqSVH7HCNuMfQwk3FRUA3kV
         nqUTLHCXTcdW/qpFGmURLd8jePWSO8llYq41y/f1IrcsefbZn/MWw5jod7PclleqnIhp
         1XhQQT3IanmUdkgo8B4qx2Oo/QaNouzLsA9dDIcDjQNvvzipGOL237PQU71WH6mtVDdH
         rOvvJ7ZSHBpzRaPvg7vcDz/3qJf+OvmyAqSo0FsIlntWM/2ghNve7YnDFSfJA2F1XZzK
         CUJKHmOBRfg0IU7oqPyIwYRnwk2Ce54HXTTUbProxEBoEe5lxkcNnjIib46Wazt+Gb/d
         mOdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782412373; x=1783017173; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9V61tcEtmNSRd/wIPFD8Kzb7PIr8WM9gRz3AhdzXFA=;
        b=B0By5HZm3/fHC+5DYU095s2jTd0qKCZ6+PX8EWeqYB6fVvrK3j5iwROazVy8pVsAln
         B+GFbWKEIggQmA41vsHv2Md6E+j8VbYAfsMgtz/Wux8o+ndM0w6Pch4MzzFnguSE9ky0
         q4ZPRh93mZp08MCUWvte3D90/PDbW77iCrr+KLn5YLfrA6PU7Fpoj5iBBIOXSeKGxaRN
         QVPbjMAUKqIQPXxYQi+00xayAJwSB7WC0BynChucTbFghZYj/VgEcHL+0W/vStHRzZRg
         SR+m4AOwWZXDNrWKOoVSrDhUp+A+FGxgLX1WEOJkDoWX91+GgrQ1sOjxTnvv6Dr9IUjd
         9V+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782412373; x=1783017173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g9V61tcEtmNSRd/wIPFD8Kzb7PIr8WM9gRz3AhdzXFA=;
        b=WOXswm1i/f0uga6Cu6+7pLodCtl77e+Occ4HEaP68+e3AHqErEq/mlyo6Ct3vuu/I1
         98Q5dcGTjXGFVW+w908fg0AJaKr0Mqa9lcU8SnO09UV42S8LTW5lOOkfGE4p6zxAHSRK
         g8Zl1Y5YDpFvFbXWDlVsLNNn3GMBnzRb6HFg2zDIAgHqWh7gGhO2T9kgsrYEqvSyjKgg
         8KJovfGG9IEw/3piA265TjKRjTJ7/ssb1Euuk7tJAzX+u7q8BIqHxqKQP9w3eY/3Jaif
         lNvZJ6mfQF3ZGtpohUkZwIvoCcUMv0Hq/jGSCi3kjClxyywBwtUHtbNNvN4i2X+g2PB/
         8u9g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+8OHWSKOQ3PtLjCmP0FJgnIvunYgrYY0EwenYYwKcyEtwLiZFhJx0FoKM8VKGicitUubN5sgxciR/@lists.linux.dev
X-Gm-Message-State: AOJu0YxxBT2+Y8QMn+75lc0qnqOAxrjCyNMq2FuOZC1MC69lt8udgQ3y
	5m7BmKYF4JxL91zx53ihiXdUvDJ59+b6LXMNgve7CgiDJrDkPcxWGCjtjZNpkusUwii6337xFUL
	ZyaoSNof7stPyqDzd44rNoqW3Z9NIyB4=
X-Gm-Gg: AfdE7ckS8E6iMcYoudGg7bpzatORmmPeT0N/sxaCnkgz0ze2qC+4tKq/iF3Q2vDAXnj
	aHvVEp/6g3NCgvJtp+x8J7uwPyn4pl3iteudt7yQTnhvZt2EE1qGx83TX8NaMApwF2x0iAr3CMn
	jp6DzBlBHt5XUqaTrf5I7s1I5fknvsZVYLIKs3bOZIJGFsTBtTsrSA7osrMxcRtGcVjMcEzMhIu
	+b/oanlQbcOj5oTpMFvC1plyDd5fqL13AUvtmZgplw8L4R247r5oBwJqgpPI8cJO/Ehe19OKEYr
	yNaRqToB8T1/qAw02K9eKaeUflMF9Or2Ues339d/OjLWNHuPhqCb
X-Received: by 2002:adf:e198:0:b0:469:3bd0:fa7d with SMTP id
 ffacd0b85a97d-46dc1e7d2aamr5538200f8f.41.1782412373179; Thu, 25 Jun 2026
 11:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625120803.2462291-1-hch@lst.de> <20260625120803.2462291-3-hch@lst.de>
 <20260625174758.GE6078@frogsfrogsfrogs>
In-Reply-To: <20260625174758.GE6078@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 25 Jun 2026 11:32:40 -0700
X-Gm-Features: AVVi8Cft-saEfjqDMyKwAQ7hs3asCzTZsJFUliVou9sVBM1d6hPzz_2GUJ4y52Y
Message-ID: <CAJnrk1YFeirQ4g7qcVsda-8qPLeAtoiyW6ZBuJb2qDsGpxi-tg@mail.gmail.com>
Subject: Re: [PATCH 2/2] iomap: submit read bio after each extent
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>, Kelu Ye <yekelu1@huawei.com>, 
	Yifan Zhao <zhaoyifan28@huawei.com>, Ritesh Harjani <ritesh.list@gmail.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Hyunchul Lee <hyc.lee@gmail.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 10:47=E2=80=AFAM Darrick J. Wong <djwong@kernel.org=
> wrote:
>
> On Thu, Jun 25, 2026 at 02:07:57PM +0200, Christoph Hellwig wrote:
>
> > So instead of adding more checks move over to a model where a bio only
> > spans a single iomap.  Change ->submit_read to be called after each
> > iteration, and pass a force argument to indicate that the bio must
> > be submitted set on the last iteration.  Switch the bio based users
> > to always submit, while keeping the single submit for fuse.
>
> Is fuse the sole reason for the "force" parameter to exist?  I wonder if
> fuse could drop its submit_read function and call fuse_send_readpages
> after the iomap_read{ahead,folio} function returns?
>

Yes, that works. I think that's a good idea. fuse only needs
submit_read logic for readahead. The change would just be:

--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -953,19 +953,8 @@ static int
fuse_iomap_read_folio_range_async(const struct iomap_iter *iter,
        return ret;
 }

-static void fuse_iomap_submit_read(const struct iomap_iter *iter,
-               struct iomap_read_folio_ctx *ctx)
-{
-       struct fuse_fill_read_data *data =3D ctx->read_ctx;
-
-       if (data->ia)
-               fuse_send_readpages(data->ia, data->file, data->nr_bytes,
-                                   data->fc->async_read);
-}
-
 static const struct iomap_read_ops fuse_iomap_read_ops =3D {
        .read_folio_range =3D fuse_iomap_read_folio_range_async,
-       .submit_read =3D fuse_iomap_submit_read,
 };

 static int fuse_read_folio(struct file *file, struct folio *folio)
@@ -1089,6 +1078,9 @@ static void fuse_readahead(struct readahead_control *=
rac)
                return;

        iomap_readahead(&fuse_iomap_ops, &ctx, NULL);
+       if (data.ia)
+               fuse_send_readpages(data.ia, data.file, data.nr_bytes,
+                                   fc->async_read);
 }


If this fix needs to go into 7.2 though, maybe it makes sense to land
the v1 implementation [1] + the xfs integrity fix now and do the fuse
change later?

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/20260619050105.439956-2-hch@lst.d=
e/
