Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973B847F3A4
	for <fuse-devel@lists.linux.dev>; Tue, 29 Sep 2026 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697565; cv=none; b=hQC/5YokZc9btiBFcJpu0Qx5t+8hfXoc+6ZYTksY+Y3gu3899pH1mtj8A1f0PBkciDICDYF1v8uDTQTQs9uuqNDfdRBbFbS5h9ktuwPAQtNrzcUr8swqeC90+MgZjXPDYWbFEhVgm/zBw8uWp0zz9oSJ6XekhP3VsQ1bddiSHCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697565; c=relaxed/simple;
	bh=bwnWYK80nFfKr3iwUcfFe3FiEOIbobSQBQGXAMlfsws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRnHqVEQoh8zFipxVO1FvhSEcdn+eq/TqCA5dJhzJ8ZBOcmhtsKJMy7xMJhwYg7R7XykoirhuH8a1zOcAcGFX4u8/bkvr3YK55htaSUHndYEDdsH56YN1cWbfBpgFjQReVGmJ4RhoHKthyNCtRAx+pa70erCX9nYUOG9egR2UIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=JQtaqqS8; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="JQtaqqS8"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso2756974f8f.0
        for <fuse-devel@lists.linux.dev>; Tue, 29 Sep 2026 08:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790697560; x=1791302360; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3j1GsvDFG4oGBkWvUsNYUZ4jWPGCGdM9fhJMq32ExyQ=;
        b=JQtaqqS8rkVniOwKik058A0XpylMwQASYr0mnUc2x+Lakfouv0nRy4UUHxjXqPc7DF
         qgqbH42cKoLteS5EgJZ2I0hi9vUwyuOp+f0kZ27fIDAgzyqIowePBCQZ2PhmnNl6Abmj
         0gzKBrUqM3MH2d3T5eGA9zP0hjk1+LBrJygWFAopM8+eLP3a3OJQlhp+IVJPCfQl5vbl
         +Ih+aMu+GC4ifHcT5l98OsP1OBRFgSvMaimBYdkl51ZvOZhO3T+WJ0LlhJI64CgmOIXU
         lOe2Edc17vi7+hA663wzI5PYXujYtDxzrE+pbuRvZ7oItAky27SsSyCqdRSll3kSXsoX
         7pJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697560; x=1791302360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3j1GsvDFG4oGBkWvUsNYUZ4jWPGCGdM9fhJMq32ExyQ=;
        b=TiRP9TxSLpld+iLcHNoYeKFDYGwQX4wueEwJtD3aQ3hjW+rTrRQiDy1yZ7iWC7EovN
         bXMvoAL0v3evEuG17qSv+lYXoTgGLa3CGpVTBYZnwZkQR+ToUl7dZK2cuNUVTUEZcmOG
         UDi4s+OYDydlRdniSH/34TdQMw+S39YLrW7/xgo0hIJs+QsetS1/b5Zqss8uDEOlWguG
         W3SDS1kxBmA0ejhHbLVVDShgCU0WBXIe3jYwlaJuE/q4lE6ZBS4ILsGuL80+8ki18SJ8
         gl+S0iUN9Nm4VO1VYA/Or9O8SWJP5goklfXtkpDvnc198Xq3cHFcZrffkjWZAFA+lMWI
         kiWA==
X-Forwarded-Encrypted: i=1; AKwUvBzQ55XeN3IP8qI9AjV79zmwsZJth+EbFsDvgsYnNmRJLo37yBfbQNv1/Pwp0i7yVgz5cZHK9/W+nH+7@lists.linux.dev
X-Gm-Message-State: AFuF++lnv1jZq3m8pnO8UxfB4e7LRNel17OoWo95WOrEiGL5fiaJJLuc
	NV/i1Z7BUh6OQdEXxPchmFnP+7zFoqHRituC0SXLs4131CbY6kX+j7TWOkgPkSwFcTc=
X-Gm-Gg: AYBFou2/+y6KsaIDfVRCP9sAhYQdIXL1JYL3wOK8jbpJCWarCq+fyzuBfw4/btggXRM
	jy8MI+iSr5qgFICTArIBZAa7VtXivPyTmrPVjJyPhw4gf2gsvSFwfTUd36CeNFdhMVHGow5VxeO
	iP7tH+d86QD56dyHWlBYpGoJMavSZ16lwXe9RH5tfeWZ7xCxGVH39p/i/CBNTI3TcaImBF6DkAj
	MKpa28tuGhgQYvQ0zjIBfnKqEbWWTpk3dkuV0xUdxcPkiczsQUUW/1a+WWcqx0v+9dhb5L13Zq/
	8CSQiOtjrMYOwayyAeWBpSPVBy/JXnMZqEs8QLKI7UbKpBNhKMlFZS3/RsrRl2+rV15voK7sU7K
	zM9Y9m820Ov4eO3n5i3oC09zUn+zVUOzReiP1ftSt8wnV1C5i7S3L8W6mobxIIIENjfyXx2WWVZ
	ZRCZCeeGZ1ZgIrlT8v4rzyTfKy12JRfjkAbVv08OrCaODNAjxdRQD4Vpd1S0LGdMssVg==
X-Received: by 2002:a05:600c:46d4:b0:49f:ec98:f030 with SMTP id 5b1f17b1804b1-49ff06f839dmr227620145e9.33.1790697559827;
        Tue, 29 Sep 2026 08:59:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::5:5c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013c6f295sm7062155e9.0.2026.09.29.08.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:59:19 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:59:17 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 07/40] mm/vma: tidy up map kernel pages enum values
Message-ID: <arvgNTUgcO0nPh-V@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-7-4583d8a23bca@kernel.org>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-7-4583d8a23bca@kernel.org>

On Thu, Sep 17, 2026 at 05:22:16PM +0100, Lorenzo Stoakes (ARM) wrote:
> MMAP_MAP_KERNEL_PAGES is a mouthful, discard the MAP_ as that's implied by
> MMAP.
> 
> Also while we're here delete useless comments for mmap actions whose names
> clearly indicate what they are for.
> 
> Also update the userland VMA tests to reflect this change.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
