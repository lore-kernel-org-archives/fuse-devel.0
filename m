Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794850650;
	b=IRgP+jUTZoct58uP8lsUW4hVGaGvQtmqOtVRvWFU1y7n0l1QmrcbFVhugB1CvXTxzszY
	 k0+JdpgUggTYV8JVmpqHZ08rtYNOV6FDK1Z8OS7WAmECE/NT1d+sz1OeNIUqH6k5R9amu
	 /Y0A4y8QhkDdYhb3amP4M4p+T7G9QeQEeNEhpg94vsI2iKXzvF4rpuIbdQu89MmvXzZlD
	 oGDBWyjzxFJuzU8I6Ffpaebym7w3CYnBmP7jseDta2+j2rBn5Vf2X4O/UtnBAvvwT4/HK
	 fBtfra90X0m7t/sydFXJz2p17l0URM+jsMheJOIYJ1t76z7IU2E3pu7Mf6sVG517BFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
	b=EcBp9hgFbyOSRazqp9y/R2L1oq2suPfn/C+cs8zziG7hwrJM5L0wB8cizAxI1YK6sa3t
	 M3i3CT/p2gAhOo6ZyXgCqhG8l/HYi3zQ7QbjcqjH+CtY7ImIb6CMSWx4u+OlYUg/xXhZB
	 vprescHexCl8NQt3kh4Y9vpMKl2XIMtkaiZoN/1iXytWOkXcAC3ILOBbWl7L6TmawE9zg
	 KshEQSMH6vaLADRtZd5GkfL4ZlncwVCr/JZ1dwNgKEJiiKJdfWFCHUoQ2pJeywnz6POfu
	 LinteQpUIuE5KfMAnjBpCauSn4Lot8SzoUU1/4Rbk/p7SlTYKxVkK0OmGnmenF8pdcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MIIHDm6t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5224E606A891
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 17:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5224E606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MIIHDm6t
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b596569640so140947a12.1
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 09:37:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794850648; cv=none;
        d=google.com; s=arc-20260327;
        b=hAORXKzr1nJ83MJz30nwD1N0U9HQpVAWq7HvzwLV412+lfr7Y/kAcdfkgtEMiAYxY1
         zGHj1yYzrBQBOZBfOLaRRuqZLadd780e/O+8RovElzyHEYj7/dlwbh604FSPsjyTpaMV
         xB2WO/ZjNgXs/A2+ZxyVN2BcPjsJuUwzNx7U74Bc0BVa3or4ClY4w8+NOEwZBJONPI4w
         940WMf2bYgj5a58VpH10pk7cRD6SqoEq9LURzpr7kvLyrsAyA3RQNoF9UUSsr8NOuN4p
         3F4+7sU2zXmaffy+wJhCVWwY575rJ94t007snaF+Iu+syxQ0t75b1gOwjBSOrQv1PIqh
         vIHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        fh=HX/yVj5WOdgqYjTIU1Ox8toxsnv4fx3mXN5BBTHbqIA=;
        b=aqE95MpG6Dtb5bO+V4VhzuwzzZri8aA70qmugWbfVxJFbJNI8jMKzv5ubnGIp8Dobv
         SIrH/bcV76gfnbcX+XVVch6lq64YCbBCDAq0VhcA5aqWCSMSUBYYhgYpc08v70M8RYNm
         c98nHX8ubePFjKlc7G/S5p4HKhaCNuMRKAdvtYGKBFmvaR9h+/EUDxeIB8LTL+vsYiP0
         2MTuj9X4Lf75IuBchA42nUZY9w8Jeuy2VXEW8A0jKvWehumiIHGD09aIoJN6QoFNFCdQ
         RDj++n81T8mQeIInnOb3GAfAN2/zr+yzW1plP5geg9pgsYJRAxJcT1lVd5mOYgHYRQkC
         vtSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850648; x=1795455448; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        b=MIIHDm6tNl0jMwQGZFYspXzw69ZH9P9dqlik2bLwSZHN79vb9UQDq3BhLSBW5bLNnp
         kdIeVHGjhZHzf61SyL3b3ydlxwim4EjsThqb0fnZxnanBsxutaCIhyTlGBRG9hPSRbOZ
         fFaG5vsg41r3wTTij9drFm8gpxLl42CkbIANWuXryWOvdftgQB/8SBQEIjVn8KSPtYSU
         2vlHLos9zQsrpdhu2xI22Ez4Yub9+BznFJIQxI6j/wgPmjfKMw/Zc4e/dF3RGn2Ktq3T
         s21vwK591UvJv1ZlyUvhsPDv/2gU2Po7TGDNdkl+TDZ6z2h+AfFyVPIkrcGrM8jz08LR
         NM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850648; x=1795455448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        b=ReQaLXwhxXAqL3VBrqAGgqVFCLZqoDT3pid7XRcOdYWLVmHxZ7G9febTlzE+d4FQ2z
         PsiJkhxKgJadY/MtxwKFaiDN3RLE8We1xnIUYlvHKbEssmIeLTUjSy/TO+7zZLl7c1cG
         myuMqQJcyHOGYnassrR6vwpjR+nGFQkDqxcV+tGE6GMnEQBTW1wYr2I+guQVuoHquntX
         /0OTySdSB9v8HVToINwV2ketQwPVcGBSuaCFizKv0HcrAovGfINtOj7EndK9Vhquu+89
         ULpA+vfqdJ2DGgtx5+owsrJYJXAHfnXEMUNf0qXexKZeFtM16KUBKhBpGa4wiLiFsZOu
         dOWQ==
X-Forwarded-Encrypted: i=1; AL+hErFcFR91J7IrFQa/p6mcREW/ZkVyNvRZSezVwSrTIx+1NK/4Xpj/q2yL5CMY2AK3RHyAItX+2ifSniGZ@lists.linux.dev
X-Gm-Message-State: APuU4Z8kM1LHvn0pp6dd208fFXWZJ4W9Y7xcUjowJyqBaMRTS0RHLgRh
	jOqNgdW28rsDlt+AblUwap0UVSj51dYms8/g1W0Ol/I1/3lHKjXZIK5dYBikPXW7M1xefQ0fxeF
	rU47iJ+8xB4R2bSDErTKqjT4CeitO3Ag=
X-Gm-Gg: AYBFou1mQQMYut1onWPep5csXPrMuwi0PM/tkG/F6PdQCIYgAbok0lUM6Rnyq8yhHIA
	PWyAr/8z7A5GKOWYiIc3ZoGcs60ZRTH576kMIMJfwH8TOqtxSuMVMTQ5B/loiop9qsR3WvD4Kf2
	/tKi0fwrMsnEd2/SLxjpS/bHTT5vp4jXgDDAPVuDCwxE4HMbF/dLGDSIHAOJHHYbCLr/WSfNGPx
	L+y//PiI2ct1EbEdwm5IU1vOuETOOoD2prZbEWRDParRTJrUiKHcEie+pIAZqyNKDnGxawcxJco
	DfkxZ3n9CNNyiVeGyUGg/as/v4/shv9ciWtQWOsF9DfvWF0R1YBDTDwPebHEpAuZFfwEjs+Vd2g
	B27iANv6Z+PqSe84xaIBPSNWy0YzQNzMgLdGA+m+NIf6R+fXHDMaLU6GU0UnlpS9m0jvIpw==
X-Received: by 2002:a05:6402:1598:b0:6b5:7250:d621 with SMTP id
 4fb4d7f45d1cf-6b859ae1a00mr134291a12.15.1794850647426; Mon, 16 Nov 2026
 09:37:27 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-33-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-33-8cbbea1cf34f@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 18:37:16 +0100
X-Gm-Features: AclHuK_sKnxFPAK3k65pZhjyZC94SJD4eZ9z2j_P12s3kyb9TMw6hurQcjyq55Q
Message-ID: <CAOQ4uxgPerkkG4ie0SyHVXaBD9VZN2wYfQpEAEi4hytn=ara3A@mail.gmail.com>
Subject: Re: [PATCH RFC v3 33/44] ovl: refuse data-only layers on pseudo filesystems
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:10=E2=80=AFPM Christian Brauner <brauner@kernel.=
org> wrote:
>
> The data of a metacopy file can live in a data-only layer. overlayfs
> doesn't look that data up when it looks up the file. It only remembers
> the absolute redirect and looks up the data lazily the first time
> someone needs it. So until then nothing can tell which filesystem holds
> the data of such a file.
>
> But a data-only layer has no business being a pseudo filesystem in the
> first place. All it does is hold the data of metacopy files and the
> regular files of a pseudo filesystem are kernel interfaces, not storage.
> So let's refuse data-only layers on superblocks with SB_I_PSEUDO at
> mount time.
>
> Data-only layers can be added via the "::" separator in "lowerdir=3D" and
> via "datadir+" by path or by file descriptor. All of them end up at the
> end of ctx->lower. So a single check in ovl_get_lowerstack() covers all
> of them.
>
> Note that regular lower layers on pseudo filesystems are left alone.
> Stacking overlayfs on top of sysfs keeps working.
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Link: https://lore.kernel.org/all/CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo=
91QjJHH9T_Yw@mail.gmail.com
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  fs/overlayfs/super.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index 39d4d57dec230..719c2569dfeaf 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -1237,6 +1237,14 @@ static struct ovl_entry *ovl_get_lowerstack(struct=
 super_block *sb,
>         for (i =3D 0; i < ctx->nr; i++) {
>                 l =3D &ctx->lower[i];
>
> +               /* Pseudo filesystems don't hold data for metacopy files.=
 */
> +               if (i >=3D ctx->nr - ctx->nr_data &&
> +                   (l->path.dentry->d_sb->s_iflags & SB_I_PSEUDO)) {
> +                       pr_err("filesystem on %s not supported as data-on=
ly layer\n",
> +                              l->name);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +

How about we make this just a tad more restrictive:

                /* Pseudo filesystems don't belong in composefs setup */
                if (ctx->nr_data &&
                    (l->path.dentry->d_sb->s_iflags & SB_I_PSEUDO)) {
                        pr_err("filesystem on %s not supported along
with data-only layers\n",
                               l->name);
                        return ERR_PTR(-EINVAL);
                }

I could send this as followup patch, but since this version is simpler
there is no real reason to have the intermediate "only ban datadir" step.

Only the commit message needs a little more flexing to justify this.

Thanks,
Amir.
