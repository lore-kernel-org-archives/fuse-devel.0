Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384AD45FFCB
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 16:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267895; cv=none; b=cEq3ileRYXo9LlorNdY47bJBbwOJV4ejF4f25RIH5cTX6TN7o+B9j0dmFVPoiv77lVxPEb9xBUoqWgofjOzCvO+9m7fB8JUcsXP2fJlL4rQ8wwJmxcsOAGOMs8GLl+qZ01mOZXns9+Qn+EWaFWE+y3kHTmQz24LZluQqsIEKGEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267895; c=relaxed/simple;
	bh=Y6dfgoDu9ENyHz35342iESy0PYqePxl/sIn9jSurkUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JG6ZzNHm5zW1jgrquJE3ip6+u6Fl87Pcms7URa7RnRqDmby87opdW+fnXW5hzmzT3DUQO+XeEdRGFmB5CID5EZFk4OQfqlpqVw7Fn3nvNnWLJyhOhsgp/0cKWdWxNRPdpBqOL40gQ+JB9SQ42+vuu6x7+tgw5rg3onkwSPczeys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=sZpT5d8g; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="sZpT5d8g"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532e91a3687so105071cf.1
        for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 09:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790267891; x=1790872691; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LuPrvXBzY5FQ+f/5fzbveR9yF272P1V2+jsIcGJNdC0=;
        b=sZpT5d8g+D4FL5X+8AV2bWQl9bhYLWx0vMB9bpPIuqIKJtcpWedqWqIoUpJdDX5TnR
         g+boazhr3s9aYLQdHfLIoT15ak/NLdHPqmaa0yUD8PT+fsoEVkPgWeU1Gfn5Bx2puSnH
         DQRBf1crA6M/52gdlkihHLkiuM9SmuBjJME1yikBB+SB0c/ihkUM8Erhuco+KxXBrWQW
         fkQ9ys9tLrkq3gZhBrfS+7fH3SfidIR4Dpg2wXguwRyfh7ACvPRb5wSh5jsx2rW9u8+L
         vCZXl9wf/JAObtsIGzhX4YNJyP8oUtn7q2n5rY5fSkB90C8yw92+NDHzJsYeT3rELFNT
         BKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267891; x=1790872691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuPrvXBzY5FQ+f/5fzbveR9yF272P1V2+jsIcGJNdC0=;
        b=P0PtXi34hrPi+c/xWfAv8mPvtfweGXtMR5C/tNweNz8nAQaeaQ16fiMc37U5JxgumZ
         oqNEGbf62nkxZm5HRX/3+yKJ84J3yLre+3lomZwVdOyll0lo46V8CWOMi8zw0yh82Hdq
         sI9ymo4wCDtqiSxltvem4GxmBXHlosyrN8FMBfFbR1fgKS6SS0dAPhs1JLqtLD3X2rZF
         /mc7349pThgOZISw4Rdmxec0atAdpioP4tnnOega3Olb9k9pLbLzwRZcpwxBwdV6OzSI
         03E37G4nM/miDDnJBFmTzk0UUHSB/VwsRBkwRSMVNBZhdvOoRf55Q2eTM1kXtYpwn0ZG
         pffA==
X-Forwarded-Encrypted: i=1; AKwUvBwnfgbmuBfeUUkZ3F9JaEgiq4ZI8hnOk61Fg+V2R5j+ktRlddc/2VaEn79wkhQaOKQr9qg0QeeV0REz@lists.linux.dev
X-Gm-Message-State: AFuF++mpDsLmsCeTmwvaBJ1DtRGX3/N/QSEr6WY4d9dpUY36EDM2q8nP
	pD6IFIQjb0VdY/1gcNmSdkqQ62XOncVLbvtH5Yo/EMBtsCldv80VdCQQ6aYVhwv5Y5c=
X-Gm-Gg: AYBFou2MTXWZcaWWcSPAGDiX0nDhIJ+7q3b6odwjSS4PS+puI+WDwRqC6t3FG4Kv1Mp
	eFa2KedM+nBKSNSTVUymeyS7yC0KQ2B5fXanYTixrzR+7n5lxmb5smQTnttJopW/VEPtFc0qZSs
	7Rr9eMPYT2CDuOS0OX1cf6aZ61u4hKAD/ISiMfxjHKHE4RniP5tfpg0cHPyJEF8L8ZljiuQHwhW
	H6NcewiksqL3yzlQHlkhQheTMqKqc+ayD49Dff6WcYe/rH96Mz/3ozENmGjaRr9TkZzKC5CiuUj
	9WrAzhxKggo5kC13pWtzJa7JF4vtx0sDlcqLkTCjv6jP4B3LuJ2/0WEZgTwe4u05gYvpRnP8Tzt
	2cRFh+9ko8/wxUN9eeL44CatpALkDNXV4v9itn66h0VAsV2lAgdjBlj3RwBx5XkAvUs2IyQEkdu
	XEMf+Hg3+M7zomOl0Nw0BKhRXOvxU1fCEcpbdoQRkmMWdnbuccBx6CJt4c/XJgnswtLttNBhhEE
	36oDCb6J41SlVGInNEJre2Elw2c9c7Ntm+stVmyeoQ+C8/1/mHBuSA=
X-Received: by 2002:ac8:5743:0:b0:530:d860:ffba with SMTP id d75a77b69052e-532fe9f05bamr29797891cf.6.1790267890993;
        Thu, 24 Sep 2026 09:38:10 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb32f6aasm45064551cf.16.2026.09.24.09.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:38:10 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:38:08 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 03/40] mm/vma: introduce and use
 vma_[flags_]can_merge()
Message-ID: <arVRqJZkql6sGunt@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>

On Thu, Sep 17, 2026 at 05:22:12PM +0100, Lorenzo Stoakes (ARM) wrote:
> Replace the open-coded VMA_SPECIAL_FLAGS check in the VMA merge logic with
> two new functions vma_flags_can_merge() and vma_can_merge() and update the
> merge logic to use the former.
> 
> This abstracts the check and expresses it in terms of the desired behaviour
> rather than an arbitrary and confusing VMA flag.
> 
> This also lays the groundwork for making further improvements in VMA flag
> usage.
> 
> Also update the userland VMA tests to reflect the change.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

